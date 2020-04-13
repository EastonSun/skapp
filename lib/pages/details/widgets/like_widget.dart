import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mobx/mobx.dart';
import './../../../routers/application.dart';
import './../../../dao/vod_list_dao.dart';
import './../../../widgets/network_img_widget.dart';

class Like extends StatelessWidget {
  final ObservableList vodDataLists;
  const Like({Key key, this.vodDataLists}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (_) => Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.all(8),
              child: Text(
                '猜你喜欢',
                style: Theme.of(context).textTheme.subhead,
              ),
            ),
            GridView.builder(
              shrinkWrap: true,
              itemCount: vodDataLists.length,
              physics: NeverScrollableScrollPhysics(),
              padding: EdgeInsets.symmetric(horizontal: 8),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                mainAxisSpacing: 10,
                crossAxisSpacing: 10,
                childAspectRatio: 0.5,
              ),
              itemBuilder: (context, index) {
                Data vod = vodDataLists[index];
                return GestureDetector(
                  onTap: () {
                    Application.router.navigateTo(
                        context, "/details?vodId=${vod.vodId}",
                        transition: TransitionType.native,
                        transitionDuration: Duration(milliseconds: 300),
                        replace: true);
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
                          padding: EdgeInsets.only(
                              top: 8, left: 6, right: 6, bottom: 8),
                          child: Text(
                            vod.vodName,
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
          ],
        ),
      ),
    );
  }
}
