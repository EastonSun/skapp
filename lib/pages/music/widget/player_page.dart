import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import './../model/lyric.dart';
import './../utils.dart';
import './lyric_panel.dart';

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

  final Function(bool) onPlaying;

  final Function(int) changeMusic;

  final Key key;

  final Color color;

  final int current;

  /// 是否是本地资源
  final bool isLocal;
  final String lyric;
  final String interval;
  final types;

  const Player(
      {@required this.audioUrl,
      @required this.onCompleted,
      @required this.onError,
      @required this.onNext,
      @required this.onPrevious,
      @required this.changeMusic,
      @required this.onDownload,
      this.lyric,
      this.interval,
      this.key,
      this.volume: 1.0,
      this.types,
      this.current,
      this.onPlaying,
      this.color: Colors.white,
      this.isLocal: false});

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
  PositionChangeHandler handler;

  @override
  void initState() {
    super.initState();
    print("audioUrl:" + widget.audioUrl);

    audioPlayer = new AudioPlayer();
    audioPlayer
      ..completionHandler = widget.onCompleted
      ..errorHandler = widget.onError
      ..durationHandler = ((duration) {
        if (mounted) {
          setState(() {
            this.duration = duration;

            if (position != null) {
              this.sliderValue = (position.inSeconds / duration.inSeconds);
            }
          });
        }
      })
      ..positionHandler = ((position) {
        if (mounted) {
          setState(() {
            this.position = position;

            if (panel != null) {
              panel.handler(position.inSeconds);
            }

            if (duration != null) {
              this.sliderValue = (position.inSeconds / duration.inSeconds);
            }
          });
        }
      });

    Lyric lyric = Utils.getLyricFromTxt(widget.lyric);
    if (mounted) {
      setState(() {
        this.lyric = lyric;
        panel = new LyricPanel(this.lyric);
      });
    }
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
    print(d.inMinutes.toString() + "======" + d.inSeconds.toString());
    String format = ((minute < 10) ? "0$minute" : "$minute") +
        ":" +
        ((second < 10) ? "0$second" : "$second");
    return format;
  }

  @override
  Widget build(BuildContext context) {
    return new Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisAlignment: MainAxisAlignment.end,
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
      lyric != null ? panel : null,
      new Padding(
        padding: const EdgeInsets.symmetric(horizontal: 32.0),
        child: new Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          mainAxisSize: MainAxisSize.max,
          children: <Widget>[
            // new IconButton(
            //   onPressed: () {
            //     widget.onPrevious();
            //   },
            //   icon: new Icon(
            //     Icons.skip_previous,
            //     size: 24.0,
            //     color: widget.color,
            //   ),
            // ),
            DropdownButtonHideUnderline(
              child: DropdownButton<String>(
                value: widget.types[widget.current]['type'],
                dropdownColor: Colors.black,
                onChanged: (String newValue) {
                  // int currentTabs = store.pTabs.indexOf(newValue);
                  // store.changeCurrentTabs(currentTabs);
                  if (newValue != widget.types[widget.current]['type']) {
                    int currentTabs = 0;
                    for (int i = 0; i < widget.types.length; i++) {
                      if (newValue == widget.types[i]['type']) {
                        currentTabs = i;
                      }
                    }
                    widget.changeMusic(currentTabs);
                  }
                },
                items: widget.types.map<DropdownMenuItem<String>>((value) {
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
            // new IconButton(
            //   onPressed: widget.onNext,
            //   icon: new Icon(
            //     Icons.skip_next,
            //     size: 24.0,
            //     color: widget.color,
            //   ),
            // ),
            new IconButton(
              onPressed: widget.onDownload,
              icon: new Icon(
                Icons.file_download,
                size: 24.0,
                color: widget.color,
              ),
            ),
          ],
        ),
      ),
      new Slider(
        onChanged: (newValue) {
          if (duration != null) {
            int seconds = (duration.inSeconds * newValue).round();
            print("audioPlayer.seek: $seconds");
            audioPlayer.seek(new Duration(seconds: seconds));
          }
        },
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
    ];
  }
}
