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
      height: kToolbarHeight * 0.7,
      decoration: BoxDecoration(
        color: Color.fromARGB(255, 237, 236, 237),
        borderRadius: BorderRadius.circular(4.0),
      ),
      child: TextField(
        onSubmitted: onSubmitted,
        onTap: onTab,
        cursorColor: Color.fromARGB(255, 0, 189, 96),
        style: Theme.of(context).textTheme.body1,
        minLines: 1,
        autofocus: false,
        enableInteractiveSelection: false,
        decoration: InputDecoration(
          contentPadding: EdgeInsets.zero,
          border: InputBorder.none,
          hintText: hintText,
          // hintStyle: Theme.of(context).textTheme.caption,
          enabledBorder: OutlineInputBorder(
            /*边角*/
            borderRadius: BorderRadius.circular(20),
            borderSide: BorderSide(
              color: Colors.white, //边线颜色为白色
              width: 1, //边线宽度为2
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: Colors.white, //边框颜色为白色
              width: 1, //宽度为5
            ),
            borderRadius: BorderRadius.circular(20),
          ),
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
