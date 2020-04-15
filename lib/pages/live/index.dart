import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
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

  Future<dynamic> requestAPI() async {
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
        builder: (_) => store.isAllLoading
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
                    height: 20,
                  ),
                  Expanded(
                    flex: 1,
                    child: TabBarView(
                      controller: tabController,
                      children: myTabsView,
                    ),
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
