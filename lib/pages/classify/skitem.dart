import 'dart:convert';

import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';
import 'package:skapp/store/root.dart';
import './../../routers/application.dart';
import './../../widgets/network_img_widget.dart';
import './../../widgets/rating_bar.dart';
import './../../dao/vod_list_dao.dart';

// ignore: must_be_immutable
class SKItem extends StatefulWidget {
  Data vod;
  SKItem({Key key, @required this.vod}) : super(key: key);

  @override
  _SKItemState createState() => _SKItemState();
}

class _SKItemState extends State<SKItem> {
  Data vod;
  @override
  void initState() {
    vod = widget.vod;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Global _global = Provider.of<Global>(context);
    return GestureDetector(
      onTap: () {
        // 此处需要判断是音乐还是电影
        if (_global.isMusic) {
          if (vod.songInfo['types'].length > 0) {
            Application.router.navigateTo(
              context,
              "/music?songInfo=${Uri.encodeComponent(json.encode(vod.songInfo))}",
              transition: TransitionType.native,
              transitionDuration: Duration(milliseconds: 300),
            );
          } else {
            Fluttertoast.showToast(
              msg: '该歌曲暂无播放源',
              toastLength: Toast.LENGTH_LONG,
            );
          }
        } else {
          Application.router.navigateTo(
            context,
            "/details?vodId=${vod.vodId}",
            transition: TransitionType.native,
            transitionDuration: Duration(milliseconds: 300),
          );
        }
      },
      child: Container(
        color: Theme.of(context).cardColor,
        height: 148,
        //margin: EdgeInsets.only(bottom: 10.0),
        padding: EdgeInsets.only(
          left: 15,
          right: 15,
          top: 15,
          bottom: 15.0,
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              width: 86,
              child: AspectRatio(
                aspectRatio: 0.73, // 宽高比
                child: NetworkImgWidget(
                  imgUrl: vod.vodPic,
                  radius: 4,
                ),
              ),
            ),
            Expanded(
              flex: 2,
              child: Padding(
                padding: EdgeInsets.only(left: 10, right: 8, top: 0, bottom: 8),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      vod.vodName,
                      overflow: TextOverflow.ellipsis,
                      style: Theme.of(context).textTheme.subtitle,
                    ),
                    Container(
                      padding: EdgeInsets.only(top: 4, bottom: 4),
                      child: vod.vodScore < 0
                          ? Text('暂无评分',
                              style: TextStyle(
                                fontSize: 11,
                              ))
                          : RatingBar(
                              vod.vodScore,
                              size: 13,
                              fontSize: 11,
                            ),
                    ),
                    Text(
                      //item.casts[0].name,
                      '${vod.vodYear} / ${vod.vodClass} / ${vod.vodArea} ${vod.vodRemarks}/${vod.vodLang}',
                      overflow: TextOverflow.ellipsis,
                      maxLines: 2,
                      style: Theme.of(context).textTheme.caption,
                    ),
                  ],
                ),
              ),
            ),
            Container(
              decoration: BoxDecoration(
                border: Border(
                  right: BorderSide(
                      width: 0.2, color: Theme.of(context).dividerColor),
                ),
              ),
            ),
            Expanded(
              flex: 1,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.only(left: 15, right: 0),
                    child: Text(
                      vod.vodActor,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 6,
                      style: Theme.of(context).textTheme.caption,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
