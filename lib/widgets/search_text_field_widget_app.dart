import 'package:flutter/material.dart';

///文本搜索框
class SearchTextFieldWidget extends StatelessWidget {
  final ValueChanged<String> onSubmitted;
  final VoidCallback onTab;
  final String hintText;
  final EdgeInsetsGeometry margin;

  SearchTextFieldWidget(
      {Key key, this.hintText, this.onSubmitted, this.onTab, this.margin})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTab,
      child: Container(
          margin: margin == null ? EdgeInsets.all(0.0) : margin,
          padding: EdgeInsets.only(left: 18),
          width: MediaQuery.of(context).size.width,
          alignment: Alignment.center,
          height: kToolbarHeight * 0.7,
          decoration: BoxDecoration(
            color: Color.fromARGB(255, 237, 236, 237),
            borderRadius: BorderRadius.circular(4.0),
          ),
          child: Row(
            children: <Widget>[
              Icon(
                Icons.search,
                size: 18,
                color: Theme.of(context).textTheme.caption.color,
              ),
              SizedBox(
                width: 10,
              ),
              Text(
                hintText,
                style: Theme.of(context).textTheme.caption,
              ),
            ],
          )),
    );
  }
}
