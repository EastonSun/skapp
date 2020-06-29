class SearchDao {
  int code;
  List<Data> data;

  SearchDao({this.code, this.data});

  SearchDao.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    if (json['data'] != null) {
      data = new List<Data>();
      json['data'].forEach((v) {
        data.add(new Data.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['code'] = this.code;
    if (this.data != null) {
      data['data'] = this.data.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Data {
  var vodId;
  var typeId;
  String vodName;
  String vodPic;
  var songInfo;

  Data({this.vodId, this.typeId, this.vodName, this.vodPic});

  Data.fromJson(Map<String, dynamic> json) {
    vodId = json['vod_id'];
    typeId = json['type_id'];
    vodName = json['vod_name'];
    vodPic = json['vod_pic'];
    songInfo = json['song_info'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['vod_id'] = this.vodId;
    data['type_id'] = this.typeId;
    data['vod_name'] = this.vodName;
    data['vod_pic'] = this.vodPic;
    data['song_info'] = this.songInfo;
    return data;
  }
}
