class AppConfigDao {
  bool showlive;

  AppConfigDao({this.showlive});

  AppConfigDao.fromJson(Map<String, dynamic> json) {
    showlive = json['showlive'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['showlive'] = this.showlive;
    return data;
  }
}
