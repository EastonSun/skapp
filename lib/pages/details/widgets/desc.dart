import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';
import './../../../store/details/details.dart';

class Desc extends StatelessWidget {
  final DetailsStore store;
  final PanelController pc;
  const Desc({Key key, this.store, this.pc}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (_) => ListTile(
        onTap: () {
          pc.open();
        },
        title: Text(
          store.vod.vodName,
          style: Theme.of(context).textTheme.title,
        ),
        subtitle: Text(
          '${store.vod.vodArea} / ${store.vod.vodYear} / ${store.vod.vodClass} / ${store.vod.vodRemarks}',
          style: Theme.of(context).textTheme.caption,
        ),
        trailing: Text(
          '简介 >',
          style: Theme.of(context).textTheme.caption,
        ),
      ),
    );
  }
}
