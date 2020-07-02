import 'dart:convert';
import 'dart:ui';
import 'package:fluro/fluro.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:skapp/routers/application.dart';
import 'package:skapp/widgets/smart_drawer.dart';
import './../../store/music/music.dart';
import './anims/needle_anim.dart';
import './anims/record_anim.dart';
import './widget/player_page.dart';
import './widget/dialog_panel.dart';

final GlobalKey<PlayerState> musicPlayerKey = new GlobalKey();

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
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  Future<dynamic> requestAPI() async {
    // type
    var types = json.decode(widget.songInfo)['types'];
    // store.changeTypes(types);
    String type = types[store.current]['type'];
    await store.fetchData(widget.songInfo, type);
  }

  Future<dynamic> requestMusicList() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List songLists = prefs.getStringList('songLists');
    store.changeMusicLists(songLists);
    if (widget.songInfo != "") {
      bool isRepeat = false;
      for (int i = 0; i < songLists.length; i++) {
        if ((json.decode(songLists[i])['singer'] ==
                json.decode(widget.songInfo)['singer']) &&
            (json.decode(songLists[i])['name'] ==
                json.decode(widget.songInfo)['name'])) {
          isRepeat = true;
          store.changeCurrentPlayIndex(i);
        }
      }
      if (!isRepeat) {
        store.changeFavorite(false);
      } else {
        store.changeFavorite(true);
      }
    }
  }

// 移除歌单
  Future<dynamic> removeMusicList() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    if (widget.songInfo != "") {
      List songLists = prefs.getStringList('songLists');
      if (songLists.length >= 100) {
        Fluttertoast.showToast(
          msg: '最多加入100首音乐',
          toastLength: Toast.LENGTH_LONG,
        );
      } else {
// 循环判断是否有重复数据
        bool isRepeat = false;
        int index = 0;
        for (int i = 0; i < songLists.length; i++) {
          if ((json.decode(songLists[i])['singer'] ==
                  json.decode(widget.songInfo)['singer']) &&
              (json.decode(songLists[i])['name'] ==
                  json.decode(widget.songInfo)['name'])) {
            isRepeat = true;
            index = i;
          }
        }
        if (isRepeat) {
          songLists.removeAt(index);
          prefs.setStringList('songLists', songLists);
          store.changeFavorite(false);
          store.changeMusicLists(songLists);
          Fluttertoast.showToast(
            msg: '已从歌单中移除',
            toastLength: Toast.LENGTH_LONG,
          );
        }
      }
    }
  }

  // 获取歌单
  Future<dynamic> setMusicList() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    if (widget.songInfo != "") {
      List songLists = prefs.getStringList('songLists');
      if (songLists.length >= 100) {
        Fluttertoast.showToast(
          msg: '最多加入100首音乐',
          toastLength: Toast.LENGTH_LONG,
        );
      } else {
// 循环判断是否有重复数据
        bool isRepeat = false;
        for (int i = 0; i < songLists.length; i++) {
          if ((json.decode(songLists[i])['singer'] ==
                  json.decode(widget.songInfo)['singer']) &&
              (json.decode(songLists[i])['name'] ==
                  json.decode(widget.songInfo)['name'])) {
            isRepeat = true;
          }
        }
        if (!isRepeat) {
          songLists.add(widget.songInfo);
          prefs.setStringList('songLists', songLists);
          store.changeFavorite(true);
          store.changeMusicLists(songLists);
          Fluttertoast.showToast(
            msg: '已加入播放歌单',
            toastLength: Toast.LENGTH_LONG,
          );
        } else {
          Fluttertoast.showToast(
            msg: '已经加入过相同的歌曲',
            toastLength: Toast.LENGTH_LONG,
          );
        }
      }
    }
  }

  // 右侧抽屉
  renderDrawer(context) {
    return SmartDrawer(
      widthPercent: 0.65,
      child: store.musicLists.length == 0
          ? Center(
              child: ListTile(
                title: Text(
                  '歌单空空如也',
                  textAlign: TextAlign.center,
                ),
                onTap: null,
              ),
            )
          : ListView.builder(
              // scrollDirection: Axis.horizontal,
              // // physics: NeverScrollableScrollPhysics(),
              // shrinkWrap: true,
              itemCount: store.musicLists.length,
              itemBuilder: (BuildContext context, int index) {
                final item = store.musicLists[index];
                return Padding(
                  padding: EdgeInsets.only(right: 10),
                  child: Dismissible(
                    onDismissed: (_) async {
                      SharedPreferences prefs =
                          await SharedPreferences.getInstance();
                      List songLists = prefs.getStringList('songLists');
                      songLists.removeAt(index);
                      prefs.setStringList('songLists', songLists);
                      store.changeMusicLists(songLists);
                      Fluttertoast.showToast(
                        msg: '已从歌单中移除',
                        toastLength: Toast.LENGTH_LONG,
                      );
                    }, // 监听
                    movementDuration: Duration(milliseconds: 100),
                    key: Key(item),
                    child: ListTile(
                      title: Text(json.decode(store.musicLists[index])['name']),
                      subtitle:
                          Text(json.decode(store.musicLists[index])['singer']),
                      dense: true,
                      selected: (json.decode(store.musicLists[index])['name'] ==
                              json.decode(widget.songInfo)['name']) &&
                          (json.decode(store.musicLists[index])['singer'] ==
                              json.decode(widget.songInfo)['singer']),
                      onTap: () {
                        // 跳转其他路由
                        Application.router.navigateTo(context,
                            "/music?songInfo=${Uri.encodeComponent(store.musicLists[index])}",
                            // transition: TransitionType.native,
                            transitionDuration: Duration(milliseconds: 300),
                            replace: true);
                      },
                    ),
                    background: Container(
                      color: Color(0x000000),
                    ),
                  ),
                );
              }),
    );
  }

  @override
  void initState() {
    super.initState();
    requestAPI();
    requestMusicList();
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
                    endDrawer: renderDrawer(context),
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
                      actions: <Widget>[
                        new IconButton(
                          onPressed: () {
                            var newType = List();
                            newType.add({'type': 'progress', 'size': null});
                            newType.addAll(
                                json.decode(widget.songInfo)['types'].toList());
                            showDialog<Null>(
                              context: context,
                              builder: (BuildContext context) {
                                return DialogPanel(
                                  songInfo: widget.songInfo,
                                  types: newType,
                                );
                              },
                            ).then((val) {
                              print(val);
                            });
                          },
                          icon: new Icon(
                            Icons.file_download,
                            size: 24.0,
                            color: Colors.white,
                          ),
                        ),
                        Builder(
                          builder: (context) => new IconButton(
                            onPressed: () {
                              Scaffold.of(context).openEndDrawer();
                            },
                            icon: new Icon(
                              Icons.menu,
                              size: 24.0,
                              color: Colors.white,
                            ),
                          ),
                        )
                      ],
                    ),
                    body: new Stack(
                      alignment: const FractionalOffset(0.5, 0.0),
                      children: <Widget>[
                        new Stack(
                          alignment: const FractionalOffset(0.7, 0.1),
                          children: <Widget>[
                            AnimatedOpacity(
                                opacity: store.isTopic ? 1 : 0,
                                duration:
                                    new Duration(milliseconds: 600), //过渡时间：1
                                child: Container(
                                  child: RotateRecord(
                                    animation:
                                        _commonTween.animate(controller_record),
                                    imgUrl: json.decode(widget.songInfo)['img'],
                                    onCusTap: () {
                                      store.changeTopic(false);
                                    },
                                  ),
                                  margin: EdgeInsets.only(top: 80.0),
                                )),
                            AnimatedOpacity(
                                opacity: store.isTopic ? 1 : 0,
                                duration:
                                    new Duration(milliseconds: 600), //过渡时间：1
                                child: Container(
                                  child: new PivotTransition(
                                    turns:
                                        _rotateTween.animate(controller_needle),
                                    alignment: FractionalOffset.topLeft,
                                    child: new Container(
                                      width: 100.0,
                                      child: new Image.asset(
                                          "assets/images/play_needle.png"),
                                    ),
                                  ),
                                )),
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
                            onPrevious: () {
                              if (store.currentPlayIndex != 0) {
                                var index = store.currentPlayIndex - 1;
                                Application.router.navigateTo(context,
                                    "/music?songInfo=${Uri.encodeComponent(store.musicLists[index])}",
                                    // transition: TransitionType.native,
                                    transitionDuration:
                                        Duration(milliseconds: 300),
                                    replace: true);
                              }
                            },
                            onNext: () {
                              var index = 0;
                              if (store.currentPlayIndex == 0 &&
                                  !store.isFavorite) {
                                index = store.currentPlayIndex;
                              } else {
                                index = store.currentPlayIndex + 1;
                              }
                              if (index <= store.musicLists.length - 1) {
                                Application.router.navigateTo(context,
                                    "/music?songInfo=${Uri.encodeComponent(store.musicLists[index])}",
                                    // transition: TransitionType.native,
                                    transitionDuration:
                                        Duration(milliseconds: 300),
                                    replace: true);
                              }
                            },
                            onCompleted: () {},
                            onCollect: () async {
                              if (store.isFavorite) {
                                // 移除
                                removeMusicList();
                              } else {
                                //加入
                                setMusicList();
                              }
                            },
                            changeMusic: (i) {
                              store.changeCurrent(i);
                              requestAPI();
                            },
                            onDownload: () {},
                            onPlaying: (isPlaying) {
                              if (isPlaying) {
                                controller_record.forward();
                                controller_needle.forward();
                              } else {
                                controller_record.stop(canceled: false);
                                controller_needle.reverse();
                              }
                            },
                            onTopicTap: () {
                              store.changeTopic(true);
                            },
                            key: musicPlayerKey,
                            color: Colors.white,
                            audioUrl: store.mp3Url,
                            types: [
                              json.decode(widget.songInfo)['types'][0]
                            ], //todo:目前只支持普通音质的音乐
                            current: store.current,
                            isTopic: store.isTopic,
                            isFavorite: store.isFavorite,
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
    controller_record.dispose();
    controller_needle.dispose();
    super.dispose();
  }
}
