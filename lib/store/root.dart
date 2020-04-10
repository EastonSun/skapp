/*
 * Created: 2020-04-07 10:43:03
 * Author : Mockingbird
 * Email : 1768385508@qq.com
 * -----
 * Description: 
 */

import 'package:mobx/mobx.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_statusbarcolor/flutter_statusbarcolor.dart';

/// 必须, 用于生成.g文件
part 'root.g.dart';

class Global = GlobalMobx with _$Global;

/// 步骤:
/// 1. 创建counter.dart
/// 2. 添加 part 'counter.g.dart';
/// 3. 添加 class Counter = CounterMobx with _$Counter;
/// 4. 执行命令: flutter packages pub run build_runner build
/// 5. 删除之内再生成: flutter packages pub run build_runner build --delete-conflicting-outputs
/// 6. 实时更新.g文件: flutter packages pub run build_runner watch

/// Counter可观察对象
abstract class GlobalMobx with Store {
  SharedPreferences prefs;
  var colorList = [
    Colors.red,
    Colors.pink,
    Colors.purple,
    Colors.lightBlue,
    Colors.cyan,
    Colors.teal,
    Colors.green,
    Colors.lime,
    Colors.amber,
    Colors.orange,
    Colors.deepOrange,
    Colors.blueGrey,
  ];

  Future getThemeIndex() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    int themeIndex = prefs.getInt('themeIndex') ?? 0;
    return themeIndex;
  }

  /// 可观察的值
  @observable
  bool showAd = false; // 是否显示loading

  @observable
  String title = 'SK'; // 标题

  @observable
  Color theme; //在主题色

  @computed
  Brightness get themeMode {
    return isDark ? Brightness.dark : Brightness.light;
  }

  @observable
  bool isDark;

  GlobalMobx(this.prefs) {
    theme = colorList[prefs.getInt('themeIndex') ?? 4];
    isDark = prefs.getBool('isDark') ?? false;
    FlutterStatusbarcolor.setStatusBarColor(theme);
  }

  @action
  void changeShowAd(bool showAd) {
    this.showAd = showAd;
  }

  @action
  void changeTheme(Color color) {
    theme = color;
    // 获取index存储
    int index = colorList.indexOf(color);
    prefs.setInt('themeIndex', index);
    FlutterStatusbarcolor.setStatusBarColor(theme);
  }

  @action
  void changeThemeMode(bool value) {
    isDark = value;
    prefs.setBool('isDark', value);
  }
}
