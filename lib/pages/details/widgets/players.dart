import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import './../../../store/details/details.dart';

class Players extends StatelessWidget {
  final DetailsStore store;

  Players({Key key, this.store}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (_) {
        String dropdownValue = store.pTabs[store.currentTabs];
        return Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Row(
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.only(right: 8),
                    child: Text(
                      '选择播放源',
                      style: Theme.of(context).textTheme.subhead,
                    ),
                  ),
                  DropdownButtonHideUnderline(
                    child: DropdownButton<String>(
                      value: dropdownValue,
                      onChanged: (String newValue) {
                        int currentTabs = store.pTabs.indexOf(newValue);
                        store.changeCurrentTabs(currentTabs);
                      },
                      items: store.pTabs.map<DropdownMenuItem<String>>((value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsets.only(left: 6, right: 6, top: 6, bottom: 16),
                child: Container(
                  height: 70,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    // physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: store.players[store.currentTabs].length,
                    itemBuilder: (BuildContext context, int index) => Padding(
                      padding: EdgeInsets.only(right: 10),
                      child: MaterialButton(
                        elevation: 0,
                        color: Theme.of(context).dividerColor,
                        textColor: index == store.currentPlayers
                            ? Theme.of(context).primaryColorDark
                            : Theme.of(context).textTheme.body2.color,
                        child: Text(
                            store.players[store.currentTabs][index]['label']),
                        onPressed: () {
                          store.changeCurrentPlayers(index);
                        },
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
