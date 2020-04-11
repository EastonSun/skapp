import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:pk_skeleton/pk_skeleton.dart';
import './../../store/details/details.dart';
import './widgets/video_widget.dart';
import './widgets/desc.dart';
import './widgets/players.dart';

class Details extends StatefulWidget {
  final String vodId;
  Details({this.vodId});
  @override
  _DetailsState createState() => _DetailsState();
}

class _DetailsState extends State<Details> {
  final DetailsStore store = DetailsStore();

  Future<dynamic> requestAPI() async {
    await store.fetchVodData();
    store.formatPDTbas(store.vod.vodPlayFrom);
    store.formatPD(store.vod.vodPlayUrl);
  }

  @override
  void initState() {
    super.initState();
    // 改变vodId
    store.changeVodId(widget.vodId);
    requestAPI();
  }

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (_) => store.isLoading
          ? PKCardProfileSkeleton(
              isCircularImage: true,
              isBottomLinesActive: true,
            )
          : Scaffold(
              // appBar: AppBar(
              //   title: Text(store.vod.vodName),
              // ),
              body: SafeArea(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Container(
                      color: Colors.black,
                      child: Stack(
                        children: <Widget>[
                          VideoWidget(
                            url: store.currentUrl,
                            store: store,
                          ),
                          IconButton(
                              icon: Icon(
                                Icons.arrow_back_ios,
                                color: Colors.white,
                              ),
                              onPressed: () {
                                Navigator.pop(context);
                              }),
                        ],
                      ),
                    ),
                    Expanded(
                      child: Container(
                        child: ListView.separated(
                          padding: new EdgeInsets.all(5.0),
                          itemCount: 3,
                          itemBuilder: (BuildContext context, int index) {
                            switch (index) {
                              case 0:
                                return Desc(vod: store.vod);
                              case 1:
                                return Players(store: store);
                              default:
                                return Container();
                            }
                          },
                          separatorBuilder: (context, index) {
                            return Divider(
                              height: .1,
                              indent: 0,
                              color: Theme.of(context).dividerColor,
                            );
                          },
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
    );
  }
}
