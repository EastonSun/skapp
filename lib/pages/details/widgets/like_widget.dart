import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mobx/mobx.dart';
import 'package:skapp/store/root.dart';
import './../../../widgets/custom_gridview_widget.dart';

class Like extends StatelessWidget {
  final ObservableList vodDataLists;
  final Global global;
  const Like({Key key, this.vodDataLists, this.global}) : super(key: key);

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
            CustomGridView(vodDataLists, global),
          ],
        ),
      ),
    );
  }
}
