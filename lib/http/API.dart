typedef RequestCallBack<T> = void Function(T value);

class API {
  static const BASE_SK_URL = 'http://sk.ncer.top';
  // static const BASE_SK_URL = 'http://192.168.5.190:8000';
  // static const BASE_SK_URL = 'http://192.168.2.127:8000';
  // static const BASE_SK_URL = 'http://192.168.43.237:8000';
  static const TYPE_URL = '/sk-api/type/list'; // 分类
  static const CLASSIFY_TYPE_URL = '/sk-api/type/one?typeId='; // 子分类
  static const VOD_LIST_URL = '/sk-api/vod/list'; // 列表页
  static const VOD_DETAILS_URL = '/sk-api/vod/one?vodId='; // 详情页
  static const SEARCH_URL = '/sk-api/search/list?keyword='; // 搜索

  // 直播接口
  static const BASE_LIVE_URL = 'http://api.vipmisss.com:81/xcdsw';
  static const LIVE_ALL_URL = '/json.txt';

  //正在热映
  static const BASE_SG_SHOWTIME = '/Showtime/LocationMovies.api?locationId=290';
  //即将上映
  static const BASE_SG_COMING = '/Movie/MovieComingNew.api?locationId=290';
  //影片详情
  static const BASE_SG_DETAIL_MOVIE =
      '/movie/detail.api?locationId=290&movieId=';
  //评论列表
  static const BASE_SG_COMMENT = '/Movie/Comment.api?movieId=';
  //预告片
  static const BASE_SG_YG = '/Movie/Video.api?pageIndex=1&movieId=';
  //演员列表
  static const BASE_SG_STAR = '/Movie/MovieCreditsWithTypes.api?movieId=';
  //剧照列表
  static const BASE_SG_JZ = '/Movie/ImageAll.api?movieId=';
}
