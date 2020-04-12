import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';
import './../../../store/details/details.dart';

class SlideUpPage extends StatelessWidget {
  final DetailsStore store;
  final PanelController pc;
  SlideUpPage({Key key, this.store, this.pc}) : super(key: key);
  double _panelHeightOpen;
  double _panelHeightClosed = 0;

  @override
  Widget build(BuildContext context) {
    _panelHeightOpen = MediaQuery.of(context).size.height -
        ((MediaQuery.of(context).size.width / 16.0) * 9.0) -
        _panelHeightClosed -
        20.0;
    //store.openPanel ? _pc.open() : _pc.close();

    return Observer(builder: (_) {
      return Container(
        child: Material(
          child: Stack(
            alignment: Alignment.topCenter,
            children: <Widget>[
              SlidingUpPanel(
                controller: pc,
                maxHeight: _panelHeightOpen,
                minHeight: _panelHeightClosed,
                parallaxEnabled: true,
                parallaxOffset: 0,
                color: Theme.of(context).cardColor,
                panelBuilder: (sc) => _panel(sc, context),
                defaultPanelState: PanelState.CLOSED,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(0), topRight: Radius.circular(0)),
              )
            ],
          ),
        ),
      );
    });
  }

  Widget _panel(ScrollController sc, context) {
    return MediaQuery.removePadding(
        context: context,
        removeTop: true,
        child: ListView(
          controller: sc,
          children: <Widget>[
            SizedBox(
              height: 12.0,
            ),
          ],
        ));
  }
}
