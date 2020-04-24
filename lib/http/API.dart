typedef RequestCallBack<T> = void Function(T value);

class API {
  // static const BASE_SK_URL = 'http://sk.ncer.top';
  static const BASE_SK_URL = 'http://192.168.5.190:8000';
  // static const BASE_SK_URL = 'http://192.168.2.127:8000';
  // static const BASE_SK_URL = 'http://192.168.43.237:8000';
  static const TYPE_URL = '/sk-api/type/list'; // 分类
  static const CLASSIFY_TYPE_URL = '/sk-api/type/one?typeId='; // 子分类
  static const VOD_LIST_URL = '/sk-api/vod/list'; // 列表页
  static const VOD_DETAILS_URL = '/sk-api/vod/one?vodId='; // 详情页
  static const SEARCH_URL = '/sk-api/search/list?keyword='; // 搜索
  // app配置
  static const APP_CONFIG = '/app/config';

  // 直播接口
  static const BASE_LIVE_URL = 'http://api.vipmisss.com:81/xcdsw';
  static const LIVE_ALL_URL = '/json.txt';
}
