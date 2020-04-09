import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:incrementally_loading_listview/incrementally_loading_listview.dart';
import 'package:flutter_skeleton/flutter_skeleton.dart';
import './../../store/classify/classify.dart';
import './skitem.dart';

// ignore: must_be_immutable
class SKList extends StatefulWidget {
  num typeId;
  SKList({Key key, @required this.typeId}) : super(key: key);

  @override
  _SKListState createState() => _SKListState(typeId);
}

class _SKListState extends State<SKList> with AutomaticKeepAliveClientMixin {
  num typeId;
  _SKListState(this.typeId);
  final ClassifyStore store = ClassifyStore();
  ScrollController scrollController = ScrollController(); // 下拉加载

  Future<dynamic> requestAPI() async {
    await store.fetchVodData(typeId: typeId);
    store.changeVodLoading();
  }

  // 下拉刷新
  Future onRefresh() {
    // 重新请求接口
    store.resetData();
    return Future(() {
      store.fetchVodData(typeId: typeId);
    });
  }

  //上拉加载
  Future loadMoreData() {
    return Future(() async {
      store.changeQuery(page: store.qPage + 1);
      await store.fetchVodData(typeId: typeId);
    });
  }

  @override
  void initState() {
    super.initState();
    requestAPI();
    // 给列表滚动添加监听
    scrollController.addListener(() {
      // 滑动到底部的关键判断
      if (scrollController.position.pixels >=
          this.scrollController.position.maxScrollExtent) {
        loadMoreData();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Observer(
      builder: (_) => Container(
        child: RefreshIndicator(
          onRefresh: this.onRefresh,
          child: store.isVodLoading
              ? // list skeleton
              CardListSkeleton(
                  style: SkeletonStyle(
                    isShowAvatar: true,
                    isCircleAvatar: false,
                    barCount: 0,
                  ),
                )
              : IncrementallyLoadingListView(
                  loadMore: () async {
                    await loadMoreData();
                  },
                  hasMore: () => store.hasNextPage,
                  itemCount: () => store.vodDataLists.length + 1 ?? 1,
                  itemBuilder: (BuildContext context, int index) {
                    if (index < store.vodDataLists.length) {
                      return Column(
                        children: <Widget>[
                          SKItem(
                            vod: store.vodDataLists[index],
                          )
                        ],
                      );
                    } else {
                      return Center(
                          child: Container(
                        padding: EdgeInsets.all(14.0),
                        child: Text(
                          '-- THE END --',
                          style: TextStyle(
                            fontSize: 12,
                          ),
                        ),
                      ));
                    }
                  }),
        ),
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
