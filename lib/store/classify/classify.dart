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

import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import './../../dao/classify_type_dao.dart';
import './../../http/API.dart';
import './../../http/http_request.dart';

/// 必须, 用于生成.g文件
part 'classify.g.dart';

class ClassifyStore = ClassifyStoreMobx with _$ClassifyStore;

abstract class ClassifyStoreMobx with Store {
  String typeUrl = API.CLASSIFY_TYPE_URL; // 子分类

  @observable
  bool isLoading = true;

  @observable
  ClassifyTypeDao type; // 分类

  @action
  Future<dynamic> fetchTypeData({@required typeId}) async {
    this.isLoading = true;
    var req = HttpRequest(API.BASE_SK_URL);
    final res = await req.get(typeUrl + typeId.toString());
    this.type = ClassifyTypeDao.fromJson(res);
  }

  @action
  void changeLoading() {
    this.isLoading = false;
  }
}
