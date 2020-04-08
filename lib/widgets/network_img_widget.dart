import 'package:flutter/material.dart';
import 'package:transparent_image/transparent_image.dart';

class NetworkImgWidget extends StatefulWidget {
  final imgUrl;
  final double radius;

  NetworkImgWidget({
    Key key,
    this.imgUrl,
    this.radius,
  }) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _NetworkImgWidgetState(imgUrl, radius);
  }
}

class _NetworkImgWidgetState extends State<NetworkImgWidget> {
  final imgUrl;
  final radius;
  _NetworkImgWidgetState(this.imgUrl, this.radius);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        ClipRRect(
          borderRadius: BorderRadius.all(Radius.circular(radius)),
          child: FadeInImage.memoryNetwork(
            placeholder: kTransparentImage,
            image: imgUrl,
          ),
        ),
      ],
    );
  }
}
