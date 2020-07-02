import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import './../model/lyric.dart';
import './../utils.dart';
import './lyric_panel.dart';
// 歌词效果
import './subtitle.dart';

class Player extends StatefulWidget {
  /// [AudioPlayer] 播放地址
  final String audioUrl;

  /// 音量
  final double volume;

  /// 错误回调
  final Function(String) onError;

  ///播放完成
  final Function() onCompleted;

  /// 上一首
  final Function() onPrevious;

  ///下一首
  final Function() onNext;

  /// 下载
  final Function() onDownload;

  // 加入或者移除歌单
  final Function() onCollect;

  final Function(bool) onPlaying;

  final Function(int) changeMusic;

  final Function() onTopicTap;

  final Key key;

  final Color color;

  final int current;
  final bool isTopic;
  final bool isFavorite;

  /// 是否是本地资源
  final bool isLocal;
  final String lyric;
  final String interval;
  final types;

  const Player({
    @required this.audioUrl,
    @required this.onCompleted,
    @required this.onError,
    @required this.onNext,
    @required this.onPrevious,
    @required this.changeMusic,
    @required this.onDownload,
    @required this.onTopicTap,
    @required this.onCollect,
    this.lyric,
    this.interval,
    this.key,
    this.volume: 1.0,
    this.types,
    this.current,
    this.isTopic,
    this.isFavorite,
    this.onPlaying,
    this.color: Colors.white,
    this.isLocal: false,
  });

  @override
  State<StatefulWidget> createState() {
    return new PlayerState();
  }
}

class PlayerState extends State<Player> {
  AudioPlayer audioPlayer;
  bool isPlaying = false;
  Duration duration;
  Duration position;
  double sliderValue;
  Lyric lyric;
  LyricPanel panel;
  Subtitle subpanel;
  // 定义index存储当前歌词的索引
  int inSeconds = 0;
  @override
  void initState() {
    super.initState();
    audioPlayer = new AudioPlayer();
    audioPlayer
      ..completionHandler = widget.onCompleted
      ..errorHandler = widget.onError
      ..durationHandler = ((duration) {
        if (mounted) {
          setState(() {
            this.duration = duration;

            if (position != null) {
              this.sliderValue = position.inSeconds.toDouble();
            }
          });
        }
      })
      ..positionHandler = ((position) {
        if (mounted) {
          setState(() {
            this.position = position;
            this.inSeconds = position.inSeconds;
            // if (panel != null) {
            //   panel.handler(position.inSeconds);
            // }

            // if (subpanel != null) {
            //   subpanel.handler(position.inSeconds);
            // }

            if (duration != null) {
              this.sliderValue = position.inSeconds.toDouble();
            }
          });
        }
      });

    lyric = Utils.getLyricFromTxt(widget.lyric);
    // if (mounted) {
    //   setState(() {
    //     this.lyric = lyric;
    //     panel = new LyricPanel(this.lyric, panelIndex, onChangeIndex: () {
    //       print(11111);
    //       if (mounted) {
    //         setState(() {
    //           panelIndex++;
    //           print(panelIndex);
    //         });
    //       }
    //     });
    //     subpanel = new Subtitle(
    //       lyric,
    //       onChangeIndex: () {
    //         if (mounted) {
    //           setState(() {
    //             panelIndex++;
    //             print(panelIndex);
    //           });
    //         }
    //       },
    //       panelIndex: panelIndex,
    //       diameterRatio: 6,
    //       selectedTextStyle: TextStyle(color: Colors.white, fontSize: 18),
    //       unSelectedTextStyle: TextStyle(
    //         color: Colors.white.withOpacity(.6),
    //       ),
    //       itemExtent: 45,
    //     );
    //   });
    // }
  }

  @override
  void deactivate() {
    audioPlayer.stop();
    super.deactivate();
  }

  @override
  void dispose() {
    audioPlayer.release();
    super.dispose();
  }

  String _formatDuration(Duration d) {
    int minute = d.inMinutes;
    int second = (d.inSeconds > 60) ? (d.inSeconds % 60) : d.inSeconds;
    String format = ((minute < 10) ? "0$minute" : "$minute") +
        ":" +
        ((second < 10) ? "0$second" : "$second");
    return format;
  }

  @override
  Widget build(BuildContext context) {
    return new Stack(
      children: _controllers(context),
    );
  }

  Widget _timer(BuildContext context) {
    var style = new TextStyle(color: widget.color);
    return new Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      mainAxisSize: MainAxisSize.max,
      children: <Widget>[
        new Text(
          position == null ? "00:00" : _formatDuration(position),
          style: style,
        ),
        new Text(
          duration == null ? widget.interval : _formatDuration(duration),
          style: style,
        ),
      ],
    );
  }

  List<Widget> _controllers(BuildContext context) {
    return [
      widget.isTopic && lyric != null
          ? Container()
          : Positioned.fill(
              child: GestureDetector(
                onTap: () {
                  widget.onTopicTap();
                },
                child: Subtitle(
                  lyric,
                  inSeconds: inSeconds ?? 0,
                  diameterRatio: 6,
                  selectedTextStyle:
                      TextStyle(color: Colors.white, fontSize: 18),
                  unSelectedTextStyle: TextStyle(
                    color: Colors.white.withOpacity(.6),
                  ),
                  itemExtent: 45,
                ),
              ),
            ),
      Positioned(
          bottom: 0,
          left: 0,
          right: 0,
          child: Column(
            children: <Widget>[
              lyric != null && widget.isTopic
                  ? LyricPanel(
                      this.lyric,
                      inSeconds ?? 0,
                    )
                  : Container(),
              new Padding(
                padding: const EdgeInsets.symmetric(horizontal: 32.0),
                child: new Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  mainAxisSize: MainAxisSize.max,
                  children: <Widget>[
                    DropdownButtonHideUnderline(
                      child: DropdownButton<String>(
                        value: widget.types[widget.current]['type'],
                        dropdownColor: Colors.black,
                        onChanged: (String newValue) {
                          // int currentTabs = store.pTabs.indexOf(newValue);
                          // store.changeCurrentTabs(currentTabs);
                          if (newValue !=
                              widget.types[widget.current]['type']) {
                            int currentTabs = 0;
                            for (int i = 0; i < widget.types.length; i++) {
                              if (newValue == widget.types[i]['type']) {
                                currentTabs = i;
                              }
                            }
                            widget.changeMusic(currentTabs);
                          }
                        },
                        items:
                            widget.types.map<DropdownMenuItem<String>>((value) {
                          return DropdownMenuItem<String>(
                            value: value['type'],
                            child: Text(
                              Utils.getTypeName(value['type']),
                              style: TextStyle(
                                color: Colors.white,
                              ),
                            ),
                          );
                        }).toList(),
                      ),
                    ),
                    new IconButton(
                      onPressed: () {
                        widget.onPrevious();
                      },
                      icon: new Icon(
                        Icons.skip_previous,
                        size: 24.0,
                        color: widget.color,
                      ),
                    ),
                    new IconButton(
                      onPressed: () {
                        if (isPlaying)
                          audioPlayer.pause();
                        else {
                          audioPlayer.play(
                            widget.audioUrl,
                            isLocal: widget.isLocal,
                            volume: widget.volume,
                          );
                        }
                        if (mounted) {
                          setState(() {
                            isPlaying = !isPlaying;
                            widget.onPlaying(isPlaying);
                          });
                        }
                      },
                      padding: const EdgeInsets.all(0.0),
                      icon: new Icon(
                        isPlaying ? Icons.pause : Icons.play_arrow,
                        size: 28.0,
                        color: widget.color,
                      ),
                    ),
                    new IconButton(
                      onPressed: widget.onNext,
                      icon: new Icon(
                        Icons.skip_next,
                        size: 24.0,
                        color: widget.color,
                      ),
                    ),
                    new IconButton(
                      onPressed: widget.onCollect,
                      icon: new Icon(
                        widget.isFavorite
                            ? Icons.favorite
                            : Icons.favorite_border,
                        size: 24.0,
                        color: widget.isFavorite ? Colors.red : widget.color,
                      ),
                    ),
                  ],
                ),
              ),
              new Slider(
                onChanged: (newValue) {
                  if (duration != null) {
                    int seconds = (newValue).round();
                    print("audioPlayer.seek: $seconds");
                    audioPlayer.seek(new Duration(seconds: seconds));
                  }
                },
                min: 0,
                max: duration != null ? duration.inSeconds.toDouble() : 0,
                value: sliderValue ?? 0.0,
                activeColor: widget.color,
              ),
              new Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16.0,
                  vertical: 0.0,
                ),
                child: _timer(context),
              ),
            ],
          )),
    ];
  }
}
