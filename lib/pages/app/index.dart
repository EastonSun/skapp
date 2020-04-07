import 'package:flutter/material.dart';
import './../../store/type/type.dart';
import './../../utils/map.dart';
import './../classify/index.dart';

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

  List<Widget> _pageList;

  List<BottomNavigationBarItem> itemList = [];

  Future<dynamic> requestAPI() async {
    await store.fetchData();
    if (store.type != null && store.type.code == 200) {
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
            .map((item) => Classify(
                  typeId: item.typeId,
                ))
            .toList();
      }
    }
  }

  @override
  void initState() {
    super.initState();
    requestAPI();
  }

  int _selectIndex = 0;

  @override
  void didUpdateWidget(App oldWidget) {
    super.didUpdateWidget(oldWidget);
    print('didUpdateWidget');
  }

  @override
  Widget build(BuildContext context) {
    return store.isLoading
        ? Text('loading')
        : Scaffold(
            body: IndexedStack(
              index: _selectIndex,
              children: _pageList,
            ), // https://www.jianshu.com/p/86d29a939624
            bottomNavigationBar: BottomNavigationBar(
                items: itemList,
                onTap: (int index) {
                  ///这里根据点击的index来显示，非index的page均隐藏
                  setState(() {
                    _selectIndex = index;
                  });
                },
                //图标大小
                iconSize: 24,
                //当前选中的索引
                currentIndex: _selectIndex,
                //选中后，底部BottomNavigationBar内容的颜色(选中时，默认为主题色)（仅当type: BottomNavigationBarType.fixed,时生效）
                fixedColor: Theme.of(context).primaryColor,
                type: BottomNavigationBarType.fixed,
                selectedFontSize: 10,
                unselectedFontSize: 10),
          );
  }
}
