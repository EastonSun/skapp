import 'dart:convert';
import 'dart:ui';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter/material.dart';
import './../../store/music/music.dart';
import './anims/needle_anim.dart';
import './anims/record_anim.dart';
import './widget/player_page.dart';

final GlobalKey<PlayerState> musicPlayerKey = new GlobalKey();
const String coverArt =
    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQEKU9rkbdInt9fPTlJMjT_gbwlyBqbE60zELhHy_A2yMsJkBmDTw';

class Music extends StatefulWidget {
  final String songInfo;
  Music({Key key, this.songInfo}) : super(key: key);
  @override
  _MusicState createState() => _MusicState();
}

class _MusicState extends State<Music> with TickerProviderStateMixin {
  final MusicStore store = MusicStore();
  AnimationController controller_record;
  Animation<double> animation_record;
  Animation<double> animation_needle;
  AnimationController controller_needle;
  final _rotateTween = new Tween<double>(begin: -0.15, end: 0.0);
  final _commonTween = new Tween<double>(begin: 0.0, end: 1.0);

  Future<dynamic> requestAPI() async {
    // type
    String type = json.decode(widget.songInfo)['types'][0]['type'];
    await store.fetchData(widget.songInfo, type);
  }

  @override
  void initState() {
    super.initState();
    requestAPI();
    controller_record = new AnimationController(
        duration: const Duration(milliseconds: 15000), vsync: this);
    animation_record =
        new CurvedAnimation(parent: controller_record, curve: Curves.linear);

    controller_needle = new AnimationController(
      duration: const Duration(milliseconds: 500),
      vsync: this,
    );
    animation_needle =
        new CurvedAnimation(parent: controller_needle, curve: Curves.linear);

    animation_record.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        controller_record.repeat();
      } else if (status == AnimationStatus.dismissed) {
        controller_record.forward();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Observer(
        builder: (_) => store.isLoading
            ? Container()
            : Stack(
                children: <Widget>[
                  new Scaffold(
                    backgroundColor: Colors.transparent,
                    appBar: new AppBar(
                      iconTheme: IconThemeData(
                        color: Colors.white, //修改颜色
                      ),
                      // automaticallyImplyLeading: false,
                      backgroundColor: Colors.transparent,
                      elevation: 0.0,
                      title: Container(
                        child: Text(
                          json.decode(widget.songInfo)['name'] +
                              ' - ' +
                              json.decode(widget.songInfo)['singer'],
                          style: new TextStyle(
                              fontSize: 14.0, color: Colors.white),
                        ),
                      ),
                    ),
                    body: new Stack(
                      alignment: const FractionalOffset(0.5, 0.0),
                      children: <Widget>[
                        new Stack(
                          alignment: const FractionalOffset(0.7, 0.1),
                          children: <Widget>[
                            new Container(
                              child: RotateRecord(
                                animation:
                                    _commonTween.animate(controller_record),
                                imgUrl: json.decode(widget.songInfo)['img'],
                              ),
                              margin: EdgeInsets.only(top: 80.0),
                            ),
                            new Container(
                              child: new PivotTransition(
                                turns: _rotateTween.animate(controller_needle),
                                alignment: FractionalOffset.topLeft,
                                child: new Container(
                                  width: 100.0,
                                  child: new Image.asset(
                                      "assets/images/play_needle.png"),
                                ),
                              ),
                            ),
                          ],
                        ),
                        new Padding(
                          padding: const EdgeInsets.only(bottom: 20.0),
                          child: new Player(
                            lyric: store.songInfo['data']['lrc'],
                            interval:
                                json.decode(widget.songInfo)['interval'] ??
                                    "00:00",
                            onError: (e) {
                              Scaffold.of(context).showSnackBar(
                                new SnackBar(
                                  content: new Text(e),
                                ),
                              );
                            },
                            onPrevious: () {},
                            onNext: () {},
                            onCompleted: () {},
                            onPlaying: (isPlaying) {
                              if (isPlaying) {
                                controller_record.forward();
                                controller_needle.forward();
                              } else {
                                controller_record.stop(canceled: false);
                                controller_needle.reverse();
                              }
                            },
                            key: musicPlayerKey,
                            color: Colors.white,
                            audioUrl: store.mp3Url,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ));
  }

  @override
  void dispose() {
    // controller_record.dispose();
    // controller_needle.dispose();
    super.dispose();
  }
}
