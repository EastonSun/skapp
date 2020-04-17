import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import './../routers/application.dart';
import 'network_img_widget.dart';

class CustomGridView extends StatelessWidget {
  final List lists;
  final String url; // 地址
  CustomGridView(this.lists, this.url);
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
              Application.router.navigateTo(
                context,
                "/showLives?address=${Uri.encodeComponent(vod.address)}&index=$index&url=$url",
                transition: TransitionType.native,
                transitionDuration: Duration(milliseconds: 300),
              );
            },
            child: Container(
              child: Column(
                children: <Widget>[
                  AspectRatio(
                    aspectRatio: 0.73, // 宽高比
                    child: Container(
                      child: Image.asset('assets/images/hgf.jpeg'),
                      // child: NetworkImgWidget(
                      //   imgUrl: vod.img,
                      //   radius: 4,
                      // ),
                    ),
                  ),
                  Padding(
                    padding:
                        EdgeInsets.only(top: 8, left: 6, right: 6, bottom: 8),
                    child: Text(
                      vod.title,
                      maxLines: 2,
                      style: Theme.of(context).textTheme.body2,
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
