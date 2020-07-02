import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
// import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:flutter_material_color_picker/flutter_material_color_picker.dart';
import 'package:provider/provider.dart';
import 'package:skapp/routers/application.dart';
import 'package:skapp/utils/cache.dart';
import 'package:skapp/widgets/restart_app.dart';
import './../../store/type/type.dart';
import './../../utils/map.dart';
import './../classify/index.dart';
import './../../widgets/search_text_field_widget_app.dart';
import './../../widgets/smart_drawer.dart';
import './../../store/root.dart';

///这个页面是作为整个APP的最外层的容器，以Tab为基础控制每个item的显示与隐藏
class App extends StatefulWidget {
  App({Key key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _App();
  }
}

class _App extends State<App> {
  final Type store = Type();

  //创建页面控制器
  PageController _pageController;
  int _selectIndex = 0;

  List<Widget> _pageList;

  List<BottomNavigationBarItem> itemList = [];

  String size;

  Future<dynamic> requestAPI() async {
    await store.fetchData();
    if (store.type != null &&
        store.type.code == 200 &&
        store.type.data.length > 1) {
      itemList = store.type.data
          .map((item) => BottomNavigationBarItem(
              icon: typeMap[item.typeEn] != null
                  ? typeMap[item.typeEn]['normalIcon']
                  : typeMap['normal']['normalIcon'],
              title: Text(
                item.typeName,
                style: TextStyle(fontSize: 10),
              ),
              activeIcon: typeMap[item.typeEn] != null
                  ? typeMap[item.typeEn]['activeIcon']
                  : typeMap['normal']['activeIcon']))
          .toList();
      if (_pageList == null) {
        _pageList = store.type.data
            .map((f) => Classify(
                  typeId: f.typeId,
                ))
            .toList();
      }
      store.changeLoading();
    }
  }

  @override
  void initState() {
    super.initState();
    _pageController = new PageController(initialPage: _selectIndex);
    requestAPI();
  }

  @override
  void didUpdateWidget(App oldWidget) {
    super.didUpdateWidget(oldWidget);
    print('didUpdateWidget');
  }

  Future getCacheInfo() async {
    String sizeStr = await loadCache();
    if (mounted) {
      setState(() {
        size = sizeStr;
      });
    }
  }

  // 左侧抽屉
  renderDrawer(context, _global) {
    getCacheInfo();
    return SmartDrawer(
      widthPercent: 0.65,
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            decoration: BoxDecoration(
              color: Theme.of(context).primaryColor,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.only(left: 16),
                  child:
                      Text('换肤', style: Theme.of(context).textTheme.subtitle),
                ),
                Expanded(
                  flex: 1,
                  child: MaterialColorPicker(
                    elevation: 1,
                    circleSize: 36,
                    iconSelected: Icons.color_lens,
                    allowShades: false,
                    spacing: 16,
                    onMainColorChange: (Color color) {
                      _global.changeTheme(color);
                    },
                    selectedColor: _global.theme,
                    colors: _global.colorList,
                  ),
                )
              ],
            ),
          ),
          SwitchListTile(
            value: _global.isDark,
            onChanged: (value) {
              _global.changeThemeMode(value);
            },
            title: Text('暗黑模式'),
            secondary: Icon(
                _global.isDark ? Icons.invert_colors : Icons.invert_colors_off),
            selected: _global.isDark,
          ),
          SwitchListTile(
            value: _global.isMusic ?? false,
            onChanged: (value) {
              _global.changeAppMode(value);
              RestartWidget.restartApp(context);
            },
            title: Text('音乐助手'),
            secondary:
                Icon(_global.isMusic ? Icons.music_video : Icons.video_library),
            selected: _global.isMusic,
          ),
          ListTile(
            title: Text('清除缓存($size)'),
            leading: Icon(Icons.layers_clear),
            onTap: () {
              clearCache();
            },
          ),
          _global.appConfig.showlive
              ? ListTile(
                  title: Text('直播'),
                  leading: Icon(Icons.live_tv),
                  onTap: () {
                    Navigator.of(context).pop();
                    Application.router.navigateTo(
                      context,
                      "/live",
                      transition: TransitionType.native,
                      transitionDuration: Duration(milliseconds: 300),
                    );
                  },
                )
              : Container(),
          ListTile(
            title: Text('自定义片源'),
            leading: Icon(Icons.extension),
            onTap: () {
              Navigator.of(context).pop();
              Application.router.navigateTo(
                context,
                "/custom",
                transition: TransitionType.native,
                transitionDuration: Duration(milliseconds: 300),
              );
            },
          ),
        ],
      ),
    );
  }

  renderAppBar() {
    return AppBar(
      elevation: 1,
      title: Container(
        child: Row(
          children: <Widget>[
            Expanded(
              child: SearchTextFieldWidget(
                hintText: '搜索',
                onTab: () {
                  Application.router.navigateTo(
                    context,
                    "/search",
                    transition: TransitionType.native,
                    transitionDuration: Duration(milliseconds: 300),
                  );
                  // Router.push(context, Router.searchPage, '电影/电视剧/影人');
                },
              ),
            ),
          ],
        ),
        alignment: Alignment(0.0, 0.0),
      ),
    );
  }

  renderBody() {
    return PageView(
      controller: _pageController,
      children: _pageList,
      physics: NeverScrollableScrollPhysics(),
      onPageChanged: (index) {
        _selectIndex = index;
      },
    );
  }

  renderBottomNavigationBar() {
    return BottomNavigationBar(
        items: itemList,
        onTap: (int index) {
          if (mounted) {
            setState(() {
              _selectIndex = index;
            });
          }
          //点击下面tabbar的时候执行动画跳转方法
          _pageController.animateToPage(index,
              duration: new Duration(milliseconds: 500),
              curve: new ElasticOutCurve(4));
        },
        //图标大小
        iconSize: 24,
        //当前选中的索引
        currentIndex: _selectIndex,
        //选中后，底部BottomNavigationBar内容的颜色(选中时，默认为主题色)（仅当type: BottomNavigationBarType.fixed,时生效）
        fixedColor: Theme.of(context).primaryColor,
        type: BottomNavigationBarType.fixed,
        selectedFontSize: 10,
        unselectedFontSize: 10);
  }

  @override
  Widget build(BuildContext context) {
    Global _global = Provider.of<Global>(context);

    return store.isLoading
        ? Container()
        : Scaffold(
            drawer: renderDrawer(context, _global),
            appBar: renderAppBar(),
            body: SafeArea(
              child: renderBody(),
            ), // https://www.jianshu.com/p/86d29a939624
            bottomNavigationBar: renderBottomNavigationBar(),
          );
  }
}
