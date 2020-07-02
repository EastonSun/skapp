import 'package:flutter/animation.dart';
import 'package:flutter/material.dart';

class RotateRecord extends AnimatedWidget {
  final String imgUrl;
  final Function() onCusTap;
  RotateRecord(
      {Key key,
      Animation<double> animation,
      this.imgUrl,
      @required this.onCusTap})
      : super(
          key: key,
          listenable: animation,
        );

  Widget build(BuildContext context) {
    final Animation<double> animation = listenable;
    return new Container(
      margin: new EdgeInsets.symmetric(vertical: 10.0),
      height: 250.0,
      width: 250.0,
      child: new RotationTransition(
          turns: animation,
          child: GestureDetector(
            onTap: () {
              this.onCusTap();
            },
            child: new Container(
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(
                  image: NetworkImage(imgUrl),
                ),
              ),
            ),
          )),
    );
  }
}
