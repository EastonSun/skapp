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

import 'package:mobx/mobx.dart';
import 'package:shared_preferences/shared_preferences.dart';
import './../../dao/vod_dao.dart';
import './../../http/API.dart';
import './../../http/http_request.dart';

/// 必须, 用于生成.g文件
part 'details.g.dart';

class DetailsStore = DetailsStoreMobx with _$DetailsStore;

abstract class DetailsStoreMobx with Store {
  String playSplit = r'$$$'; // 播放器
  String singleSplit = r'#'; // 每一集
  String split = r'$'; // 每一集再分
  String detailsUrl = API.VOD_DETAILS_URL; // 详情

  @observable
  bool isLoading = true;

  @observable
  String vodId;

  @observable
  VodDao vod;

  @observable
  ObservableList players = ObservableList();

  @observable
  ObservableList pTabs = ObservableList();

  @observable
  int currentTabs = 0; // sid

  @observable
  int currentPlayers = 0; // nid

  @observable
  bool isClickPlayers = false; // 是否点击了切换

  @computed
  String get currentUrl {
    return players[currentTabs][currentPlayers]['url'] ?? '';
  }

  @action
  void formatPD(String vodPlayUrl) {
    players.clear();
    List a = vodPlayUrl.split(playSplit);
    for (var index = 0; index < a.length; index++) {
      players.add([]);
      // 判断是不是有集数
      if (a[index].indexOf(singleSplit) >= 0) {
        List c = a[index].split(singleSplit);
        c.forEach((v) {
          List d = v.split(split);
          players[index].add({
            'label': d[0],
            'url': d[1],
          });
        });
      } else {
        List e = a[index].split(split);
        if (e.length == 1) {
          players[index].add({
            'label': '高清',
            'url': e[0],
          });
        } else {
          players[index].add({
            'label': e[0],
            'url': e[1],
          });
        }
      }
    }
  }

  @action
  void formatPDTbas(String vodPlayFrom) {
    pTabs.addAll(vodPlayFrom.split(playSplit));
  }

  @action
  void changeVodId(String vodId) {
    this.vodId = vodId;
  }

  @action
  Future<dynamic> fetchVodData() async {
    this.isLoading = true;
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String cIp = prefs.getString('ip') ?? API.BASE_SK_URL;
    bool isMusic = prefs.getBool('isMusic') ?? false;
    String preApiUrl = isMusic ? API.PRE_MUSIC_API_URL : API.PRE_API_URL;
    var req = HttpRequest(cIp);
    final res = await req.get(preApiUrl + detailsUrl + vodId);
    this.vod = VodDao.fromJson(res['data']);
    this.isLoading = false;
  }

  @action
  void changeCurrentTabs(int current) {
    currentTabs = current;
  }

  @action
  void changeCurrentPlayers(int current) {
    isClickPlayers = true;
    currentPlayers = current;
  }

  @action
  void changeIsClickPlayers() {
    isClickPlayers = false;
  }
}
