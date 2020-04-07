/*
 * Created: 2020-04-07 15:42:00
 * Author : Mockingbird
 * Email : 1768385508@qq.com
 * -----
 * Description: 分类相关
 */
class SkType {
  int code;
  List<Data> data;

  SkType({this.code, this.data});

  SkType.fromJson(Map<String, dynamic> json) {
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
  int typeId;
  String typeName;

  Data({this.typeId, this.typeName});

  Data.fromJson(Map<String, dynamic> json) {
    typeId = json['type_id'];
    typeName = json['type_name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['type_id'] = this.typeId;
    data['type_name'] = this.typeName;
    return data;
  }
}
