import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mobx/mobx.dart';
import './../../../widgets/custom_gridview_widget.dart';

class Like extends StatelessWidget {
  final ObservableList vodDataLists;
  const Like({Key key, this.vodDataLists}) : super(key: key);

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
            CustomGridView(vodDataLists),
          ],
        ),
      ),
    );
  }
}
