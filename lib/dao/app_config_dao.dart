class AppConfigDao {
  bool showlive;
  String title;
  String version;
  bool force;
  List<String> contents;
  String apkDownloadUrl;

  AppConfigDao(
      {this.showlive,
      this.title,
      this.version,
      this.force,
      this.contents,
      this.apkDownloadUrl});

  AppConfigDao.fromJson(Map<String, dynamic> json) {
    showlive = json['showlive'];
    title = json['title'];
    version = json['version'];
    force = json['force'];
    contents = json['contents'].cast<String>();
    apkDownloadUrl = json['apkDownloadUrl'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['showlive'] = this.showlive;
    data['title'] = this.title;
    data['version'] = this.version;
    data['force'] = this.force;
    data['contents'] = this.contents;
    data['apkDownloadUrl'] = this.apkDownloadUrl;
    return data;
  }
}
