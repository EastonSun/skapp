import './../model/lyric.dart';
import 'package:flutter/material.dart';

typedef void PositionChangeHandler(int second);

///
/// des: 字幕
///
// ignore: must_be_immutable
class Subtitle extends StatefulWidget {
  Subtitle(
    this.data, {
    // this.currentIndex = 0,
    this.inSeconds,
    this.selectedTextStyle,
    this.unSelectedTextStyle,
    this.itemExtent = 45,
    this.diameterRatio = 2.0,
  });
  PositionChangeHandler handler;

  ///
  /// 当前时间
  ///
  // final int currentIndex;

  ///
  /// 字幕数据
  ///
  // final List<SubtitleEntry> data;
  final Lyric data;

  final int inSeconds;

  ///
  /// 选中字体样式
  ///
  final TextStyle selectedTextStyle;

  ///
  /// 未选中字体样式
  ///
  final TextStyle unSelectedTextStyle;

  ///
  /// 圆筒直径和主轴渲染窗口的尺寸的比，默认值是2，越小表示圆筒越圆
  ///
  final double diameterRatio;

  ///
  /// 每一个item的高度
  ///
  final double itemExtent;

  @override
  State<StatefulWidget> createState() => _SubtitleState();
}

class _SubtitleState extends State<Subtitle> {
  ScrollController _controller;

  int num = 0;
  _getCurrentIndex(inSeconds, allSeconds) {
    for (int i = 0; i < allSeconds.length - 1; i++) {
      if (inSeconds >= allSeconds[i].in_second &&
          inSeconds <= allSeconds[i + 1].in_second) {
        if (mounted) {
          setState(() {
            num = i;
          });
        }
      }
    }
    if (inSeconds >= allSeconds[allSeconds.length - 1].in_second) {
      num = allSeconds.length - 1;
    }
    return num;
  }

  @override
  void initState() {
    _controller = ScrollController();
    _startAni();
    super.initState();
  }

  ///
  ///启动
  ///
  _startAni() async {
    if (!_controller.hasClients) {
      Future.delayed(Duration(milliseconds: 50), () {
        _startAni();
      });
      return;
    }
    if (num >= widget.data.slices.length - 1) {
      return -1;
    }
    var delay = _computeDelay();
    Future.delayed(Duration(seconds: delay), () {
      _animateNext();
    });
  }

  ///
  /// 移动到下一个
  ///
  _animateNext() {
    _controller.animateTo((num * widget.itemExtent),
        duration: Duration(milliseconds: 200), curve: Curves.linear);
    _startAni();
  }

  ///
  /// 计算下一个字幕什么时候移动
  /// -1:最后一个不在移动
  /// >0:几秒后移动
  ///
  _computeDelay() {
    if (num >= widget.data.slices.length - 1) {
      return -1;
    }

    int currentTime = widget.data.slices[num].in_second;

    int nextTime = widget.data.slices[num + 1].in_second;

    int delay = nextTime - currentTime;
    return delay;
  }

  @override
  Widget build(BuildContext context) {
    if (widget.data == null || widget.data.slices.length == 0) {
      return Container();
    }
    int currentIndex = _getCurrentIndex(widget.inSeconds, widget.data.slices);
    return ListWheelScrollView.useDelegate(
      controller: _controller,
      diameterRatio: widget.diameterRatio,
      itemExtent: widget.itemExtent,
      childDelegate: ListWheelChildBuilderDelegate(
          builder: (context, index) {
            return Container(
              alignment: Alignment.center,
              child: Text(
                '${widget.data.slices[index].slice}',
                style: currentIndex == index
                    ? widget.selectedTextStyle
                    : widget.unSelectedTextStyle,
              ),
            );
          },
          childCount: widget.data.slices.length),
    );
  }
}
