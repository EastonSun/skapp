/*
 * Created: 2020-04-07 15:55:59
 * Author : Mockingbird
 * Email : 1768385508@qq.com
 * -----
 * Description:
              1. 执行命令: flutter packages pub run build_runner build
              2. 删除之内再生成: flutter packages pub run build_runner build --delete-conflicting-outputs
              3. 实时更新.g文件: flutter packages pub run build_runner watch
 */

import 'package:fluttertoast/fluttertoast.dart';
import 'package:mobx/mobx.dart';
import 'package:shared_preferences/shared_preferences.dart';
import './../../http/API.dart';
import './../../http/http_request.dart';

/// 必须, 用于生成.g文件
part 'music.g.dart';

class MusicStore = MusicStoreMobx with _$MusicStore;

abstract class MusicStoreMobx with Store {
  String musicUrl = API.MUSIC_URL;
  String musicDownLoadUrl = API.MUSIC_DOWNLOAD_URL;

  @observable
  bool isLoading = true;

  @observable
  bool downloading = false;

  @observable
  double progress = 0;

  @observable
  var songInfo = {};

  @observable
  String mp3Url = "";

  @observable
  String downloadUrl = "";
  // @observable
  // ObservableList types = ObservableList();

  @observable
  ObservableList musicLists = ObservableList(); // 歌单

  @observable
  int currentPlayIndex = 0; // 当前索引

  @observable
  bool isFavorite = false; // 当前不是最爱

  @observable
  int current = 0;

  @observable
  bool isTopic = true;

  @action
  Future<dynamic> fetchData(String song, String type) async {
    this.isLoading = true;
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String cIp = prefs.getString('ip') ?? API.BASE_SK_URL;
    bool isMusic = prefs.getBool('isMusic') ?? false;
    String preApiUrl = isMusic ? API.PRE_MUSIC_API_URL : API.PRE_API_URL;
    var req = HttpRequest(cIp);
    final res = await req.get(preApiUrl + musicUrl + song + '&type=' + type);
    if (res['code'] == 200) {
      this.songInfo = res;
      mp3Url = res['data']['typeUrl'][type]['url'];
      this.isLoading = false;
    } else {
      Fluttertoast.showToast(
        msg: res['msg'],
        toastLength: Toast.LENGTH_LONG,
      );
    }
  }

  @action
  Future<dynamic> fetchDownloadData(String song, String type) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String cIp = prefs.getString('ip') ?? API.BASE_SK_URL;
    bool isMusic = prefs.getBool('isMusic') ?? false;
    String preApiUrl = isMusic ? API.PRE_MUSIC_API_URL : API.PRE_API_URL;
    var req = HttpRequest(cIp);
    final res =
        await req.get(preApiUrl + musicDownLoadUrl + song + '&type=' + type);
    if (res['code'] == 200) {
      downloadUrl = res['data']['url'];
    } else {
      Fluttertoast.showToast(
        msg: res['msg'],
        toastLength: Toast.LENGTH_LONG,
      );
    }
  }

  @action
  void resetSongInfo() {
    songInfo = {};
    mp3Url = "";
  }

  @action
  void changeProgress(double value) {
    downloading = true;
    progress = value;
  }

  @action
  void resetProgress() {
    downloading = false;
    progress = 0;
    downloadUrl = "";
  }

  // @action
  // void changeTypes(type) {
  //   types.addAll(type);
  // }

  @action
  void changeCurrent(int c) {
    current = c;
  }

  @action
  void changeTopic(bool c) {
    isTopic = c;
  }

  @action
  void changeMusicLists(list) {
    musicLists.clear();
    musicLists.addAll(list);
  }

  @action
  void changeCurrentPlayIndex(int i) {
    currentPlayIndex = i;
  }

  @action
  void changeFavorite(bool b) {
    isFavorite = b;
  }
}
