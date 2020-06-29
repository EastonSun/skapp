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
import './../../dao/type_dao.dart';
import './../../http/API.dart';
import './../../http/http_request.dart';

/// 必须, 用于生成.g文件
part 'type.g.dart';

class Type = TypeMobx with _$Type;

abstract class TypeMobx with Store {
  String url = API.TYPE_URL;

  @observable
  bool isLoading = true;

  @observable
  SkType type; // 分类

  @observable
  int currentSearchTypeIndex = 0;

  @action
  Future<dynamic> fetchData() async {
    this.isLoading = true;
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String cIp = prefs.getString('ip') ?? API.BASE_SK_URL;
    bool isMusic = prefs.getBool('isMusic') ?? false;
    String preApiUrl = isMusic ? API.PRE_MUSIC_API_URL : API.PRE_API_URL;
    var req = HttpRequest(cIp);
    final res = await req.get(preApiUrl + url);
    this.type = SkType.fromJson(res);
  }

  @action
  void changeLoading() {
    this.isLoading = false;
  }

  @action
  void changeCurrentSearchTypeIndex(int index) {
    this.currentSearchTypeIndex = index;
  }
}
