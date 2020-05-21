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
import './../../dao/live/live_all_dao.dart';
import './../../dao/live/live_item_dao.dart';
import './../../http/API.dart';
import './../../http/http_request.dart';

/// 必须, 用于生成.g文件
part 'live.g.dart';

class LiveStore = LiveStoreMobx with _$LiveStore;

abstract class LiveStoreMobx with Store {
  String liveAllUrl = API.LIVE_ALL_URL; // 详情

  @observable
  bool isPass = false; // 是否输入正确

  @observable
  bool isAllLoading = true;

  @observable
  bool isItemLoading = true;

  @observable
  LiveAllDao livesObj;

  @observable
  ObservableList lives = ObservableList(); // 平台

  @observable
  LiveItemDao liveItem;

  @observable
  ObservableList live = ObservableList(); // 主播

  @action
  Future<dynamic> fetchLivesData() async {
    this.isAllLoading = true;
    var req = HttpRequest(API.BASE_LIVE_URL);
    final res = await req.get(liveAllUrl);
    this.livesObj = LiveAllDao.fromJson(res);
    lives.addAll(livesObj.pingtai);
    this.isAllLoading = false;
  }

  @action
  Future<dynamic> fetchLiveData(String url) async {
    this.isItemLoading = true;
    var req = HttpRequest(API.BASE_LIVE_URL);
    final res = await req.get('/$url');
    this.liveItem = LiveItemDao.fromJson(res);
    live.addAll(liveItem.zhubo);
    this.isItemLoading = false;
  }

  @action
  Future<dynamic> fetchSecretLive(String key) async {
    var req = HttpRequest(API.BASE_SK_URL);
    final res = await req.get('/${API.APP_SECRET_LIVE_KEY}?key=$key');
    if (res['result'] == true) {
      isPass = true;
    } else {
      isPass = false;
    }
  }

  @action
  void resetData() {
    live.clear();
  }
}
