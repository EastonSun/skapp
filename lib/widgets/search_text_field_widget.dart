import 'package:flutter/material.dart';
import './../utils/screen_utils.dart';

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
    return Container(
      margin: margin == null ? EdgeInsets.all(0.0) : margin,
      width: MediaQuery.of(context).size.width,
      alignment: Alignment.center,
      height: ScreenUtils.screenH(context) * 0.05,
      decoration: BoxDecoration(
        color: Color.fromARGB(255, 237, 236, 237),
        borderRadius: BorderRadius.circular(4.0),
      ),
      child: TextField(
        onSubmitted: onSubmitted,
        onTap: onTab,
        cursorColor: Color.fromARGB(255, 0, 189, 96),
        style: Theme.of(context).textTheme.body2,
        decoration: InputDecoration(
          contentPadding: EdgeInsets.zero,
          border: InputBorder.none,
          hintText: hintText,
          hintStyle: Theme.of(context).textTheme.caption,
          prefixIcon: Icon(
            Icons.search,
            size: 20,
            color: Color.fromARGB(255, 128, 128, 128),
          ),
        ),
      ),
    );
  }
}
