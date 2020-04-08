import 'package:flutter/material.dart';
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
    return Container(
      child: Container(
          height: 140,
          // color: ConstantSystem.colorBgWhite,
          margin: const EdgeInsets.only(bottom: 10.0),
          padding: const EdgeInsets.only(
            left: 15,
            right: 15,
            top: 15,
            bottom: 8.0,
          ),
          child: GestureDetector(
            onTap: () {
              // Router.push(context, Router.detailPage, item.id);
            },
            child: Row(
              children: <Widget>[
                Expanded(
                    flex: 1,
                    child: NetworkImgWidget(
                      imgUrl: vod.vodPic,
                      radius: 4,
                    )),
                Expanded(
                  flex: 2,
                  child: Padding(
                    padding: EdgeInsets.all(8),
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
                      mainAxisAlignment: MainAxisAlignment.center,
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
                    )),
              ],
            ),
          )),
    );
  }
}
