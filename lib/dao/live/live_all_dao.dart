class LiveAllDao {
  List<Pingtai> pingtai;

  LiveAllDao({this.pingtai});

  LiveAllDao.fromJson(Map<String, dynamic> json) {
    if (json['pingtai'] != null) {
      pingtai = new List<Pingtai>();
      json['pingtai'].forEach((v) {
        pingtai.add(new Pingtai.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.pingtai != null) {
      data['pingtai'] = this.pingtai.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Pingtai {
  String address;
  String xinimg;
  String number;
  String title;

  Pingtai({this.address, this.xinimg, this.number, this.title});

  Pingtai.fromJson(Map<String, dynamic> json) {
    address = json['address'];
    xinimg = json['xinimg'];
    number = json['Number'];
    title = json['title'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['address'] = this.address;
    data['xinimg'] = this.xinimg;
    data['Number'] = this.number;
    data['title'] = this.title;
    return data;
  }
}
