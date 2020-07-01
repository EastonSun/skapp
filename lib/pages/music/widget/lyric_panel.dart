import 'package:flutter/material.dart';
import './../model/lyric.dart';

typedef void PositionChangeHandler(int second);

class LyricPanel extends StatefulWidget {
  final Lyric lyric;
  final int inSeconds;
  PositionChangeHandler handler;

  LyricPanel(@required this.lyric, this.inSeconds);

  @override
  State<StatefulWidget> createState() {
    return new LyricState();
  }
}

class LyricState extends State<LyricPanel> {
  LyricSlice currentSlice;
  int num = 0;
  _getCurrentIndex(inSeconds, allSeconds) {
    for (int i = 0; i < allSeconds.length - 1; i++) {
      if (inSeconds >= allSeconds[i].in_second &&
          inSeconds <= allSeconds[i + 1].in_second) {
        num = i;
      }
    }
    if (inSeconds >= allSeconds[allSeconds.length - 1].in_second) {
      num = allSeconds.length - 1;
    }
    return num;
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    int currentIndex = _getCurrentIndex(widget.inSeconds, widget.lyric.slices);
    LyricSlice slice = widget.lyric.slices[currentIndex];

    currentSlice = slice;
    return new Container(
      child: new Center(
        child: new Container(
          padding: EdgeInsets.only(bottom: 0.0),
          child: Text(
            currentSlice != null ? currentSlice.slice : "",
            style: new TextStyle(
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }

  List<Widget> buildLyricItems(Lyric lyric) {
    List<Widget> items = new List();
    for (LyricSlice slice in lyric.slices) {
      if (slice != null && slice.slice != null) {
        items.add(new Center(
          child: new Container(
            padding: EdgeInsets.only(bottom: 10.0),
            child: Text(
              slice.slice,
              style: new TextStyle(
                color: Colors.white,
              ),
            ),
          ),
        ));
      }
    }
    return items;
  }
}
