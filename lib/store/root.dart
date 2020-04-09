/*
 * Created: 2020-04-07 10:43:03
 * Author : Mockingbird
 * Email : 1768385508@qq.com
 * -----
 * Description: 
 */

import 'package:mobx/mobx.dart';
import 'package:flutter/material.dart';

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

  /// 可观察的值
  @observable
  bool showAd = false; // 是否显示loading

  @observable
  String title = 'SK'; // 标题

  @observable
  Color theme = Colors.lightBlue; //在主题色

  @observable
  Brightness themeMode = Brightness.light; //夜间模式

  @observable
  bool isDark = false;

  @action
  void changeShowAd(bool showAd) {
    this.showAd = showAd;
  }

  @action
  void changeTheme(Color color) {
    theme = color;
  }

  @action
  void changeThemeMode(value) {
    if (value) {
      themeMode = Brightness.dark;
      isDark = true;
    } else {
      themeMode = Brightness.light;
      isDark = false;
    }
  }
}
