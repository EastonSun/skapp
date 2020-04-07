import 'package:flutter/material.dart';
import './../../store/classify/classify.dart';

// ignore: must_be_immutable
class Classify extends StatefulWidget {
  num typeId;
  Classify({Key key, @required this.typeId}) : super(key: key);

  @override
  _ClassifyState createState() => _ClassifyState();
}

class _ClassifyState extends State<Classify> {
  final ClassifyStore store = ClassifyStore();

  Future<dynamic> requestAPI() async {
    await store.fetchTypeData(typeId: widget.typeId);
    if (store.type != null && store.type.code == 200) {
      print(store.type.data);
    }
  }

  @override
  void initState() {
    super.initState();
    requestAPI();
  }

  @override
  Widget build(BuildContext context) {
    return Container(child: Text('分类'));
  }
}
