import 'package:flutter/material.dart';
import './../../../dao/vod_dao.dart';

class Desc extends StatelessWidget {
  final VodDao vod;
  const Desc({Key key, this.vod}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () {
        print('详细信息');
      },
      title: Text(
        vod.vodName,
        style: Theme.of(context).textTheme.title,
      ),
      subtitle: Text(
        '${vod.vodArea} / ${vod.vodYear} / ${vod.vodClass} / ${vod.vodRemarks}',
        style: Theme.of(context).textTheme.caption,
      ),
      trailing: Text(
        '简介 >',
        style: Theme.of(context).textTheme.caption,
      ),
    );
  }
}
