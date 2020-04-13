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
import './../../http/API.dart';
import './../../http/http_request.dart';
import './../../dao/search_dao.dart';

/// 必须, 用于生成.g文件
part 'search.g.dart';

class SearchStore = SearchStoreMobx with _$SearchStore;

abstract class SearchStoreMobx with Store {
  String searchUrl = API.SEARCH_URL;

  @observable
  bool isLoading = false;

  @observable
  ObservableList searchLists = ObservableList();

  @action
  Future<dynamic> fetchData(String keyword) async {
    this.isLoading = true;
    var req = HttpRequest(API.BASE_SK_URL);
    final res = await req.get(searchUrl + keyword);
    searchLists.addAll(SearchDao.fromJson(res).data);
    this.isLoading = false;
  }

  @action
  void resetSearchList() {
    searchLists.clear();
  }
}
