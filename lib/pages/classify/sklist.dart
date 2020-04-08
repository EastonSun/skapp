import 'package:flutter/material.dart';

class SKList extends StatefulWidget {
  SKList({Key key}) : super(key: key);

  @override
  _SKListState createState() => _SKListState();
}

class _SKListState extends State<SKList> with AutomaticKeepAliveClientMixin {
  @override
  void initState() {
    super.initState();
    print(123);
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Container(
      child: Text('测试'),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
