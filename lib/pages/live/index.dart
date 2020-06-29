import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:fluttertoast/fluttertoast.dart';
import './../../store/live/live.dart';
import 'livelist.dart';

// ignore: must_be_immutable
class Live extends StatefulWidget {
  Live({Key key}) : super(key: key);

  @override
  _LiveState createState() => _LiveState();
}

class _LiveState extends State<Live> with SingleTickerProviderStateMixin {
  TabController tabController;
  final LiveStore store = LiveStore();
  List<Tab> myTabs = <Tab>[];
  List<Widget> myTabsView = <Widget>[];

  String currentVal = '';

  Future<dynamic> requestAPI() async {
    // await store.fetchSecretLive('865273');
    await store.fetchLivesData();

    if (store.lives.length != 0) {
      if (myTabs.length == 0) {
        myTabs = store.lives
            .map(
              (item) => Tab(
                text: item.title,
              ),
            )
            .cast<Tab>()
            .toList();

        // 初始化
        myTabsView = store.lives
            .map(
              (item) => LiveList(item.address),
            )
            .toList();

        this.tabController = TabController(
          initialIndex: 0,
          length: myTabs.length,
          vsync: this,
        );
        this.tabController.addListener(() => _onTabChanged());
      }
    }
  }

  _onTabChanged() {
    if (this.tabController.index.toDouble() ==
        this.tabController.animation.value) {}
  }

  @override
  void initState() {
    super.initState();
    requestAPI();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('直播'),
      ),
      body: Observer(
        builder: (_) => store.isPass
            ? (store.isAllLoading
                ? Container()
                : Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      TabBar(
                        indicatorColor: Theme.of(context).primaryColorDark,
                        controller: tabController,
                        isScrollable: true,
                        labelColor: Theme.of(context).primaryColorDark,
                        unselectedLabelColor:
                            Theme.of(context).textTheme.title.color,
                        indicatorSize: TabBarIndicatorSize.tab,
                        indicatorWeight: 1,
                        // labelStyle: TextStyle(fontSize: 12),
                        tabs: myTabs,
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Expanded(
                        flex: 1,
                        child: TabBarView(
                          controller: tabController,
                          children: myTabsView,
                        ),
                      ),
                    ],
                  ))
            : Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  SizedBox(
                    height: 10,
                  ),
                  TextField(
                    // autofocus: true,
                    decoration: InputDecoration(
                      labelText: "验证码",
                      hintText: "请输入验证码",
                      prefixIcon: Icon(Icons.near_me),
                    ),
                    onChanged: (val) {
                      if (mounted) {
                        setState(() {
                          currentVal = val;
                        });
                      }
                    },
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Expanded(
                        child: Container(
                          height: 48,
                          margin: EdgeInsets.all(30),
                          child: RaisedButton(
                            child: Text('确定'),
                            color: Theme.of(context).primaryColor,
                            textColor: Colors.white,
                            // elevation: 10,
                            onPressed: currentVal.trim().length > 0
                                ? () async {
                                    try {
                                      await store.fetchSecretLive(currentVal);
                                      if (!store.isPass) {
                                        Fluttertoast.showToast(
                                          msg: '验证码错误',
                                        );
                                      }
                                    } catch (_) {
                                      Fluttertoast.showToast(msg: '未知错误');
                                    }
                                  }
                                : null,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    tabController.dispose();
  }
}
