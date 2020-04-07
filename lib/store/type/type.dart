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

  @action
  void fetchData() async {
    this.isLoading = true;
    var req = HttpRequest(API.BASE_SK_URL);
    final res = await req.get(url);
    this.type = SkType.fromJson(res);
    print(this.type);
    this.isLoading = false;
  }
}
