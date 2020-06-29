import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_ijkplayer/flutter_ijkplayer.dart';
import 'package:flutter_ijkplayer/src/helper/full_screen_helper.dart';
import 'package:flutter_ijkplayer/src/helper/logutil.dart';
import 'package:flutter_ijkplayer/src/helper/time_helper.dart';
import 'package:flutter_ijkplayer/src/helper/ui_helper.dart';
import 'package:flutter_ijkplayer/src/route/fullscreen_route.dart';
import './progress_bar.dart';

part 'full_screen.part.dart';

/// Using mediaController to Construct a Controller UI
typedef Widget IJKControllerWidgetBuilder(IjkMediaController controller);

/// default create IJK Controller UI
Widget defaultBuildIjkControllerWidget(IjkMediaController controller) {
  return CustomIJKControllerWidget(
    controller: controller,
    fullscreenControllerWidgetBuilder: (ctl) =>
        buildFullscreenMediaController(ctl),
  );
}

/// Default Controller Widget
///
/// see [IjkPlayer] and [IJKControllerWidgetBuilder]
class CustomIJKControllerWidget extends StatefulWidget {
  final IjkMediaController controller;

  /// If [doubleTapPlay] is true, can double tap to play or pause media.
  final bool doubleTapPlay;

  /// If [verticalGesture] is false, vertical gesture will be ignored.
  final bool verticalGesture;

  /// If [horizontalGesture] is false, horizontal gesture will be ignored.
  final bool horizontalGesture;

  /// Controlling [verticalGesture] is controlling system volume or media volume.
  final VolumeType volumeType;

  final bool playWillPauseOther;

  /// Control whether there is a full-screen button.
  final bool showFullScreenButton;

  /// The current full-screen button style should not be changed by users.
  final bool currentFullScreenState;

  /// Build widget for full screen.
  final IJKControllerWidgetBuilder fullscreenControllerWidgetBuilder;

  /// See [FullScreenType]
  final FullScreenType fullScreenType;

  /// Whether to automatically hide the status bar when it is full screen.
  final bool hideSystemBarOnFullScreen;

  /// Callback in full screen, full screen when enter true, false to exit full screen.
  final void Function(bool enter) onFullScreen;

  /// The UI of the controller.
  const CustomIJKControllerWidget({
    Key key,
    @required this.controller,
    this.doubleTapPlay = false,
    this.verticalGesture = true,
    this.horizontalGesture = true,
    this.volumeType = VolumeType.system,
    this.playWillPauseOther = true,
    this.currentFullScreenState = false,
    this.showFullScreenButton = true,
    this.fullscreenControllerWidgetBuilder,
    this.fullScreenType = FullScreenType.rotateBox,
    this.hideSystemBarOnFullScreen = true,
    this.onFullScreen,
  }) : super(key: key);

  @override
  CustomIJKControllerWidgetState createState() =>
      CustomIJKControllerWidgetState();

  CustomIJKControllerWidget copyWith({
    Key key,
    IjkMediaController controller,
    bool doubleTapPlay,
    bool verticalGesture,
    bool horizontalGesture,
    VolumeType volumeType,
    bool playWillPauseOther,
    bool currentFullScreenState,
    bool showFullScreenButton,
    IJKControllerWidgetBuilder fullscreenControllerWidgetBuilder,
    FullScreenType fullScreenType,
  }) {
    return CustomIJKControllerWidget(
      controller: controller ?? this.controller,
      doubleTapPlay: doubleTapPlay ?? this.doubleTapPlay,
      fullscreenControllerWidgetBuilder: fullscreenControllerWidgetBuilder ??
          this.fullscreenControllerWidgetBuilder,
      horizontalGesture: horizontalGesture ?? this.horizontalGesture,
      currentFullScreenState:
          currentFullScreenState ?? this.currentFullScreenState,
      key: key,
      volumeType: volumeType ?? this.volumeType,
      playWillPauseOther: playWillPauseOther ?? this.playWillPauseOther,
      showFullScreenButton: showFullScreenButton ?? this.showFullScreenButton,
      verticalGesture: verticalGesture ?? this.verticalGesture,
      fullScreenType: fullScreenType ?? this.fullScreenType,
    );
  }
}

class CustomIJKControllerWidgetState extends State<CustomIJKControllerWidget>
    implements TooltipDelegate {
  IjkMediaController get controller => widget.controller;

  GlobalKey currentKey = GlobalKey();

  bool _isShow = false;

  bool _isClock = false;

  String _speed = '1.0';

  set isShow(bool value) {
    _isShow = value;
    if (mounted) {
      setState(() {});
    }
    if (value == true) {
      controller.refreshVideoInfo();
    }
  }

  set isClock(bool value) {
    _isClock = value;
    if (mounted) {
      setState(() {});
    }
    if (value == true) {
      controller.refreshVideoInfo();
    }
  }

  set speed(String value) {
    _speed = value;
    if (mounted) {
      setState(() {});
    }
  }

  bool get isShow => _isShow;

  bool get isClock => _isClock;

  String get speed => _speed;

  Timer progressTimer;

  StreamSubscription controllerSubscription;

  @override
  void initState() {
    super.initState();
    startTimer();
    controllerSubscription =
        controller.textureIdStream.listen(_onTextureIdChange);
  }

  void _onTextureIdChange(int textureId) {
    LogUtils.debug("onTextureChange $textureId");
    if (textureId != null) {
      startTimer();
    } else {
      stopTimer();
    }
  }

  @override
  void deactivate() {
    super.deactivate();
  }

  @override
  void dispose() {
    controllerSubscription.cancel();
    stopTimer();
    IjkManager.resetBrightness();
    super.dispose();
  }

  void startTimer() {
    if (controller.textureId == null) {
      return;
    }

    progressTimer?.cancel();
    progressTimer = Timer.periodic(Duration(milliseconds: 350), (timer) {
      LogUtils.verbose("timer will call refresh info");
      controller.refreshVideoInfo();
    });
  }

  void stopTimer() {
    progressTimer?.cancel();
  }

  @override
  Widget build(BuildContext context) {
    controller.setSpeed(double.parse(speed));
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      child: buildContent(),
      onDoubleTap: onDoubleTap(),
      onHorizontalDragStart: wrapHorizontalGesture(_onHorizontalDragStart),
      onHorizontalDragUpdate: wrapHorizontalGesture(_onHorizontalDragUpdate),
      onHorizontalDragEnd: wrapHorizontalGesture(_onHorizontalDragEnd),
      onVerticalDragStart: wrapVerticalGesture(_onVerticalDragStart),
      onVerticalDragUpdate: wrapVerticalGesture(_onVerticalDragUpdate),
      onVerticalDragEnd: wrapVerticalGesture(_onVerticalDragEnd),
      onTap: onTap,
      key: currentKey,
    );
  }

  Widget buildContent() {
    if (!isShow) {
      return Container();
    }
    // 在此处定义定时器，隐藏下面的bar 等待 6000ms
    Future.delayed(const Duration(milliseconds: 6000)).then((_) {
      isShow = false;
    });
    return StreamBuilder<VideoInfo>(
      stream: controller.videoInfoStream,
      builder: (context, snapshot) {
        var info = snapshot.data;
        if (info == null || !info.hasData) {
          return Container();
        }
        return buildPortrait(info);
      },
    );
  }

  Widget _buildFullScreenButton(context) {
    if (widget.showFullScreenButton != true) {
      return Container();
    }
    var isFull = widget.currentFullScreenState;

    return IconButton(
      color: Colors.white,
      icon: Icon(isFull ? Icons.fullscreen_exit : Icons.fullscreen),
      onPressed: fullScreen,
    );
  }

  void fullScreen() {
    var isFull = widget.currentFullScreenState;

    IJKControllerWidgetBuilder fullscreenBuilder =
        widget.fullscreenControllerWidgetBuilder ??
            (ctx) => widget.copyWith(currentFullScreenState: true);

    if (isFull) {
      Navigator.pop(context);
    } else {
      showFullScreenIJKPlayer(
        context,
        controller,
        fullscreenControllerWidgetBuilder: fullscreenBuilder,
        fullScreenType: widget.fullScreenType,
        hideSystemBar: widget.hideSystemBarOnFullScreen,
        onFullscreen: widget.onFullScreen,
      );
    }
  }

  int _overlayTurns = 0;

  Widget buildPortrait(VideoInfo info) {
    _overlayTurns = FullScreenHelper.getQuarterTurns(info, context);
    return PortraitController(
        controller: controller,
        info: info,
        tooltipDelegate: this,
        playWillPauseOther: widget.playWillPauseOther,
        fullScreenWidget: _buildFullScreenButton(context),
        changeSpeed: changeSpeed,
        speed: speed,
        currentFullScreenState: widget.currentFullScreenState,
        isShow: isShow,
        isClock: isClock,
        onTapClock: onTapClock);
  }

  changeSpeed(value) {
    speed = value;
  }

  OverlayEntry _tipOverlay;

  Widget createTooltipWidgetWrapper(Widget widget) {
    var typography = Typography(platform: TargetPlatform.android);
    var theme = typography.white;
    const style = const TextStyle(
      fontSize: 15.0,
      color: Colors.white,
      fontWeight: FontWeight.normal,
    );
    var mergedTextStyle = theme.body2.merge(style);
    return Container(
      decoration: BoxDecoration(
        color: Colors.black.withOpacity(0.5),
        borderRadius: BorderRadius.circular(20.0),
      ),
      height: 100.0,
      width: 100.0,
      child: DefaultTextStyle(
        child: widget,
        style: mergedTextStyle,
      ),
    );
  }

  void showTooltip(Widget widget) {
    hideTooltip();
    _tipOverlay = OverlayEntry(
      builder: (BuildContext context) {
        Widget w = IgnorePointer(
          child: Center(
            child: widget,
          ),
        );

        if (this.widget.fullScreenType == FullScreenType.rotateBox &&
            this.widget.currentFullScreenState &&
            _overlayTurns != 0) {
          w = RotatedBox(
            child: w,
            quarterTurns: _overlayTurns,
          );
        }

        return w;
      },
    );
    Overlay.of(context).insert(_tipOverlay);
  }

  void hideTooltip() {
    _tipOverlay?.remove();
    _tipOverlay = null;
  }

  _ProgressCalculator _calculator;

  onTap() => isShow = !isShow;

  onTapClock() => isClock = !isClock;

  Function onDoubleTap() {
    return widget.doubleTapPlay
        ? () {
            LogUtils.debug("ondouble tap");
            controller.playOrPause();
          }
        : null;
  }

  Function wrapHorizontalGesture(Function function) =>
      isClock ? null : widget.horizontalGesture == true ? function : null;

  Function wrapVerticalGesture(Function function) =>
      isClock ? null : widget.verticalGesture == true ? function : null;

  void _onHorizontalDragStart(DragStartDetails details) async {
    var videoInfo = await controller.getVideoInfo();
    _calculator = _ProgressCalculator(details, videoInfo);
  }

  void _onHorizontalDragUpdate(DragUpdateDetails details) {
    if (_calculator == null || details == null) {
      return;
    }
    var updateText = _calculator.calcUpdate(details);

    var offsetPosition = _calculator.getOffsetPosition();

    IconData iconData =
        offsetPosition > 0 ? Icons.fast_forward : Icons.fast_rewind;
    var w = Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Icon(
          iconData,
          color: Colors.white,
          size: 40.0,
        ),
        Text(
          updateText,
          textAlign: TextAlign.center,
        ),
      ],
    );

    showTooltip(createTooltipWidgetWrapper(w));
  }

  void _onHorizontalDragEnd(DragEndDetails details) async {
    hideTooltip();
    var targetSeek = _calculator?.getTargetSeek(details);
    _calculator = null;
    if (targetSeek == null) {
      return;
    }
    await controller.seekTo(targetSeek);
    var videoInfo = await controller.getVideoInfo();
    if (targetSeek < videoInfo.duration) await controller.play();
  }

  bool verticalDragging = false;
  bool leftVerticalDrag;

  void _onVerticalDragStart(DragStartDetails details) {
    verticalDragging = true;
    var width = UIHelper.findGlobalRect(currentKey).width;
    var dx =
        UIHelper.globalOffsetToLocal(currentKey, details.globalPosition).dx;
    leftVerticalDrag = dx / width <= 0.5;
  }

  void _onVerticalDragUpdate(DragUpdateDetails details) async {
    if (verticalDragging == false) return;

    String text = "";
    IconData iconData = Icons.volume_up;

    if (leftVerticalDrag == false) {
      if (details.delta.dy > 0) {
        await volumeDown();
      } else if (details.delta.dy < 0) {
        await volumeUp();
      }

      var currentVolume = await getVolume();

      if (currentVolume <= 0) {
        iconData = Icons.volume_mute;
      } else if (currentVolume < 50) {
        iconData = Icons.volume_down;
      } else {
        iconData = Icons.volume_up;
      }

      text = currentVolume.toString();
    } else if (leftVerticalDrag == true) {
      var currentBright = await IjkManager.getSystemBrightness();
      double target;
      if (details.delta.dy > 0) {
        target = currentBright - 0.03;
      } else {
        target = currentBright + 0.03;
      }

      if (target > 1) {
        target = 1;
      } else if (target < 0) {
        target = 0;
      }

      await IjkManager.setSystemBrightness(target);

      if (target >= 0.66) {
        iconData = Icons.brightness_high;
      } else if (target < 0.66 && target > 0.33) {
        iconData = Icons.brightness_medium;
      } else {
        iconData = Icons.brightness_low;
      }

      text = (target * 100).toStringAsFixed(0);
    } else {
      return;
    }
    var column = Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Icon(
          iconData,
          color: Colors.white,
          size: 25.0,
        ),
        Padding(
          padding: const EdgeInsets.only(top: 10.0),
          child: Text(text),
        ),
      ],
    );

    showTooltip(createTooltipWidgetWrapper(column));
  }

  void _onVerticalDragEnd(DragEndDetails details) async {
    verticalDragging = false;
    leftVerticalDrag = null;
    hideTooltip();

    Future.delayed(const Duration(milliseconds: 2000), () {
      hideTooltip();
    });
  }

  Future<int> getVolume() async {
    switch (widget.volumeType) {
      case VolumeType.media:
        return controller.volume;
      case VolumeType.system:
        return controller.getSystemVolume();
    }
    return 0;
  }

  Future<void> volumeUp() async {
    var volume = await getVolume();
    volume++;
    switch (widget.volumeType) {
      case VolumeType.media:
        controller.volume = volume;
        break;
      case VolumeType.system:
        await IjkManager.systemVolumeUp();
        break;
    }
  }

  Future<void> volumeDown() async {
    var volume = await getVolume();
    volume--;
    switch (widget.volumeType) {
      case VolumeType.media:
        controller.volume = volume;
        break;
      case VolumeType.system:
        await IjkManager.systemVolumeDown();
        break;
    }
  }
}

class _ProgressCalculator {
  DragStartDetails startDetails;
  VideoInfo info;

  double dx;

  _ProgressCalculator(this.startDetails, this.info);

  String calcUpdate(DragUpdateDetails details) {
    dx = details.globalPosition.dx - startDetails.globalPosition.dx;
    var f = dx > 0 ? "+" : "-";
    var offset = getOffsetPosition().round().abs();
    return "$f${offset}s";
  }

  double getTargetSeek(DragEndDetails details) {
    var target = info.currentPosition + getOffsetPosition();
    if (target < 0) {
      target = 0;
    } else if (target > info.duration) {
      target = info.duration;
    }
    return target;
  }

  double getOffsetPosition() {
    return dx / 10;
  }
}

class PortraitController extends StatelessWidget {
  final IjkMediaController controller;
  final VideoInfo info;
  final TooltipDelegate tooltipDelegate;
  final bool playWillPauseOther;
  final Widget fullScreenWidget;
  final String speed;
  final bool currentFullScreenState;
  final bool isShow;
  final bool isClock;
  final Function onTapClock;
  final changeSpeed;

  PortraitController({
    Key key,
    this.controller,
    this.info,
    this.tooltipDelegate,
    this.playWillPauseOther = true,
    this.fullScreenWidget,
    this.changeSpeed,
    this.speed,
    this.isShow,
    this.isClock,
    this.onTapClock,
    this.currentFullScreenState,
  }) : super(key: key);

  bool get haveTime {
    return info.hasData && info.duration > 0;
  }

  @override
  Widget build(BuildContext context) {
    if (!info.hasData) {
      return Container();
    }
    Widget bottomBar = buildBottomBar(context);
    return Stack(
      children: <Widget>[
        Align(
          //对齐底部
          alignment: Alignment.centerLeft,
          child: GestureDetector(
            onTap: onTapClock,
            child: Padding(
              padding: EdgeInsets.only(
                left: 12.0,
                right: 6.0,
                top: 6.0,
                bottom: 6.0,
              ),
              child: Icon(
                isClock ? Icons.lock_outline : Icons.lock_open,
                color: Colors.white,
              ),
            ),
          ),
        ),
        Align(
          //对齐底部
          alignment: Alignment.bottomCenter,
          child: isClock ? Container() : bottomBar,
        ),
      ],
    );
    // Column(
    //   crossAxisAlignment: CrossAxisAlignment.start,
    //   children: <Widget>[
    //     Expanded(
    //       child: Container(
    //         child: Column(
    //           mainAxisAlignment: MainAxisAlignment.center,
    //           children: <Widget>[
    //             GestureDetector(
    //                 onTap: onTapClock,
    //                 child: Padding(
    //                   padding: EdgeInsets.only(
    //                     left: 20.0,
    //                     right: 6.0,
    //                     top: 6.0,
    //                     bottom: 6.0,
    //                   ),
    //                   child: Icon(
    //                     isClock ? Icons.lock_outline : Icons.lock_open,
    //                     color: Colors.white,
    //                   ),
    //                 ))
    //           ],
    //         ),
    //       ),
    //     ),
    //     isClock ? Container() : bottomBar,
    //   ],
    // );
  }

  Widget buildBottomBar(BuildContext context) {
    var currentTime = buildCurrentText(context);
    var maxTime = buildMaxTimeText(context);
    var progress = buildProgress(context, info);

    var playButton = buildPlayButton(context);

    var fullScreenButton = buildFullScreenButton(context);

    Widget widget = Container(
      height: 40,
      child: Row(
        children: <Widget>[
          playButton,
          Padding(
            padding: const EdgeInsets.all(6.0),
            child: currentTime,
          ),
          Expanded(child: progress),
          Padding(
            padding: const EdgeInsets.all(6.0),
            child: maxTime,
          ),
          currentFullScreenState
              ? Padding(
                  padding: const EdgeInsets.all(6.0),
                  child: buildSpeed(context, info),
                )
              : Container(),
          fullScreenButton,
        ],
      ),
    );
    widget = DefaultTextStyle(
      style: const TextStyle(
        color: Colors.white,
      ),
      child: widget,
    );
    widget = Container(
      color: Colors.black.withOpacity(0.0),
      child: widget,
    );
    return widget;
  }

  Widget buildSpeed(context, VideoInfo info) {
    if (!info.hasData || info.duration == 0) {
      return Container();
    }
    return Theme(
      data: Theme.of(context).copyWith(
        canvasColor: Color.fromRGBO(0, 0, 0, 1.00),
      ),
      // DropdownButtonHideUnderline 没有下划线的下拉栏
      child: DropdownButtonHideUnderline(
        child: DropdownButton<String>(
          value: speed,
          hint: Text('倍数'),
          onChanged: (String newValue) {
            changeSpeed(newValue);
          },
          iconSize: 0,
          style: TextStyle(color: Colors.white),
          items: ['0.5', '1.0', '1.5', '2.0']
              .map<DropdownMenuItem<String>>((value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Text(value),
            );
          }).toList(),
        ),
      ),
    );
  }

  Widget buildProgress(context, VideoInfo info) {
    if (!info.hasData || info.duration == 0) {
      return Container();
    }
    return Container(
      height: 16,
      // child: Slider(
      //   value: info.currentPosition,
      //   max: info.duration,
      //   min: 0.0,
      //   divisions: (info.duration).ceil(),
      //   activeColor: Theme.of(context).primaryColorDark,
      //   label: TimeHelper.getTimeText(info.currentPosition),
      //   onChanged: (double progress) async {
      //     // showProgressTooltip(info, progress);
      //     // 先暂停
      //     await controller.pause();
      //     await controller.seekTo(progress);
      //     await controller.play();
      //     tooltipDelegate?.hideTooltip();
      //   },
      //   onChangeStart: (double progress) async {},
      //   onChangeEnd: (double progress) async {
      //     await controller.seekTo(progress);
      //     // await controller.play();
      //     // tooltipDelegate?.hideTooltip();
      //   },
      // ),
      child: ProgressBar(
        playedColor: Theme.of(context).primaryColorDark,
        bufferColor: Colors.white,
        backgroundColor: Colors.grey,
        current: info.currentPosition,
        max: info.duration,
        changeProgressHandler: (progress) async {
          await controller.seekToProgress(progress);
          tooltipDelegate?.hideTooltip();
        },
        tapProgressHandler: (progress) {
          showProgressTooltip(info, progress);
        },
      ),
    );
  }

  buildCurrentText(context) {
    return haveTime
        ? Text(
            TimeHelper.getTimeText(info.currentPosition),
            style: TextStyle(color: Colors.white),
          )
        : Container();
  }

  buildMaxTimeText(context) {
    return haveTime
        ? Text(
            TimeHelper.getTimeText(info.duration),
            style: TextStyle(color: Colors.white),
          )
        : Container();
  }

  buildPlayButton(BuildContext context) {
    return IconButton(
      onPressed: () {
        controller.playOrPause(pauseOther: playWillPauseOther);
      },
      color: Colors.white,
      icon: Icon(info.isPlaying ? Icons.pause : Icons.play_arrow),
      iconSize: 22.0,
    );
  }

  void showProgressTooltip(VideoInfo info, double progress) {
    var target = info.duration * progress;

    var diff = info.currentPosition - target;

    String diffString;
    if (diff < 1 && diff > -1) {
      diffString = "0s";
    } else if (diff < 0) {
      diffString = "+${TimeHelper.getTimeText(diff.abs())}";
    } else if (diff > 0) {
      diffString = "-${TimeHelper.getTimeText(diff.abs())}";
    } else {
      diffString = "0s";
    }

    Widget text = Container(
      alignment: Alignment.center,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            TimeHelper.getTimeText(target),
            style: TextStyle(fontSize: 20),
          ),
          Container(
            height: 10,
          ),
          Text(diffString),
        ],
      ),
    );

    var tooltip = tooltipDelegate?.createTooltipWidgetWrapper(text);
    tooltipDelegate?.showTooltip(tooltip);
  }

  Widget buildFullScreenButton(context) {
    return fullScreenWidget ?? Container();
  }
}

abstract class TooltipDelegate {
  void showTooltip(Widget widget);

  Widget createTooltipWidgetWrapper(Widget widget);

  void hideTooltip();
}

enum VolumeType {
  system,
  media,
}
