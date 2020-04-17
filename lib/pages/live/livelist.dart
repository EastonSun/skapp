import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:pk_skeleton/pk_skeleton.dart';
import 'package:provider/provider.dart';
import 'package:skapp/store/root.dart';
import 'package:skapp/widgets/custom_gridview_live_widget.dart';
import './../../store/live/live.dart';

class LiveList extends StatefulWidget {
  final String url;
  LiveList(this.url);
  @override
  _LiveListState createState() => _LiveListState();
}

class _LiveListState extends State<LiveList>
    with AutomaticKeepAliveClientMixin {
  final LiveStore store = LiveStore();

  Future<dynamic> requestAPI() async {
    await store.fetchLiveData(widget.url);
  }

  @override
  void initState() {
    super.initState();
    requestAPI();
  }

  // 下拉刷新
  Future onRefresh() {
    // 重新请求接口
    store.resetData();
    return Future(() {
      requestAPI();
    });
  }

  @override
  Widget build(BuildContext context) {
    final Global _global = Provider.of<Global>(context);
    return Observer(
      builder: (_) => Container(
        child: RefreshIndicator(
          onRefresh: this.onRefresh,
          child: store.isItemLoading
              ? // list skeleton
              _global.isDark
                  ? PKDarkCardListSkeleton(
                      isCircularImage: true,
                      isBottomLinesActive: true,
                      length: 10,
                    )
                  : PKCardListSkeleton(
                      isCircularImage: true,
                      isBottomLinesActive: true,
                      length: 10,
                    )
              : ListView(
                  children: <Widget>[CustomGridView(store.live, widget.url)],
                ),
        ),
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
