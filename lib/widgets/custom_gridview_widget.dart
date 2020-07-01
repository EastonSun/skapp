import 'dart:convert';

import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:skapp/store/root.dart';
import './../routers/application.dart';
import 'network_img_widget.dart';

class CustomGridView extends StatelessWidget {
  final List lists;
  final Global global;
  CustomGridView(this.lists, this.global);
  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (_) => GridView.builder(
        shrinkWrap: true,
        itemCount: lists.length,
        physics: NeverScrollableScrollPhysics(),
        padding: EdgeInsets.symmetric(horizontal: 8),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          mainAxisSpacing: 10,
          crossAxisSpacing: 10,
          childAspectRatio: 0.5,
        ),
        itemBuilder: (context, index) {
          var vod = lists[index];
          return GestureDetector(
            onTap: () {
              if (global.isMusic) {
                if (vod.songInfo['types'].length > 0) {
                  Application.router.navigateTo(
                    context,
                    "/music?songInfo=${Uri.encodeComponent(json.encode(vod.songInfo))}",
                    transition: TransitionType.native,
                    transitionDuration: Duration(milliseconds: 300),
                    replace: true,
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
                  replace: true,
                );
              }
            },
            child: Container(
              child: Column(
                children: <Widget>[
                  AspectRatio(
                    aspectRatio: 0.73, // 宽高比
                    child: Container(
                      child: NetworkImgWidget(
                        imgUrl: vod.vodPic,
                        radius: 4,
                      ),
                    ),
                  ),
                  Padding(
                    padding:
                        EdgeInsets.only(top: 8, left: 6, right: 6, bottom: 8),
                    child: Text(
                      vod.vodName,
                      maxLines: 2,
                      style: Theme.of(context).textTheme.bodyText2,
                    ),
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
