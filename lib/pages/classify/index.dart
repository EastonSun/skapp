import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import './../../store/classify/classify.dart';
import './sklist.dart';

// ignore: must_be_immutable
class Classify extends StatefulWidget {
  num typeId;
  Classify({Key key, @required this.typeId}) : super(key: key);

  @override
  _ClassifyState createState() => _ClassifyState(typeId);
}

class _ClassifyState extends State<Classify>
    with SingleTickerProviderStateMixin {
  num typeId;
  _ClassifyState(this.typeId);
  TabController tabController;
  final ClassifyStore store = ClassifyStore();
  List<Tab> myTabs = <Tab>[];
  List<Widget> myTabsView = <Widget>[];

  Future<dynamic> requestAPI() async {
    await store.fetchTypeData(typeId: typeId);

    if (store.type != null && store.type.code == 200) {
      if (myTabs.length == 0) {
        myTabs = store.type.data
            .map(
              (item) => Tab(
                text: item.typeName,
              ),
            )
            .cast<Tab>()
            .toList();

        // 初始化
        myTabsView = store.type.data
            .map(
              (item) => SKList(typeId: item.typeId),
            )
            .toList();

        this.tabController = TabController(
          initialIndex: 0,
          length: myTabs.length,
          vsync: this,
        );
        this.tabController.addListener(() => _onTabChanged());
        store.changeLoading();
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
    return Observer(
        builder: (_) => store.isLoading
            ? Container()
            : Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  TabBar(
                    indicatorColor: Theme.of(context).primaryColor,
                    controller: tabController,
                    isScrollable: true,
                    labelColor: Theme.of(context).primaryColor,
                    unselectedLabelColor: Colors.black87,
                    indicatorSize: TabBarIndicatorSize.tab,
                    indicatorWeight: 1,
                    // labelStyle: TextStyle(fontSize: 12),
                    tabs: myTabs,
                  ),
                  Expanded(
                    flex: 1,
                    child: TabBarView(
                      controller: tabController,
                      children: myTabsView,
                    ),
                  ),
                ],
              ));
  }

  @override
  void dispose() {
    super.dispose();
    tabController.dispose();
  }
}
