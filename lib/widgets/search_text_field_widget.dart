import 'package:flutter/material.dart';
import './../utils/screen_utils.dart';

///文本搜索框
class SearchTextFieldWidget extends StatelessWidget {
  final ValueChanged<String> onSubmitted;
  final VoidCallback onTab;
  final String hintText;
  final EdgeInsetsGeometry margin;
  final TextEditingController controller;
  final FocusNode focus;

  SearchTextFieldWidget(
      {Key key,
      this.hintText,
      this.onSubmitted,
      this.onTab,
      this.controller,
      this.focus,
      this.margin})
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
        controller: controller,
        onSubmitted: onSubmitted,
        cursorColor: Color.fromARGB(255, 0, 189, 96),
        style: Theme.of(context).textTheme.body1,
        minLines: 1,
        autofocus: true,
        enableInteractiveSelection: false,
        focusNode: focus,
        decoration: InputDecoration(
          contentPadding: EdgeInsets.zero,
          border: InputBorder.none,
          hintText: hintText,
          hintStyle: Theme.of(context).textTheme.caption,
          // hintStyle: Theme.of(context).textTheme.caption,
          enabledBorder: OutlineInputBorder(
            /*边角*/
            borderRadius: BorderRadius.circular(20),
            borderSide: BorderSide(
              color: Color.fromARGB(255, 237, 236, 237), //边线颜色为白色
              width: 1, //边线宽度为2
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: Color.fromARGB(255, 237, 236, 237), //边框颜色为白色
              width: 1, //宽度为5
            ),
            borderRadius: BorderRadius.circular(20),
          ),
          prefixIcon: Icon(
            Icons.search,
            size: 18,
            color: Color.fromARGB(255, 128, 128, 128),
          ),
        ),
      ),
    );
  }
}
