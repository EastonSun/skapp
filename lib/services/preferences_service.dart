/*
 * Created: 2020-04-09 10:41:09
 * Author : Mockingbird
 * Email : 1768385508@qq.com
 * -----
 * Description: 预加载设置
 */

import 'package:shared_preferences/shared_preferences.dart';

class PreferencesService {
  final String _useDarkModeKey = 'useDarkMode';
  final String _openInAppKey = 'openInApp';
  final String _favouritesKey = 'favourites';

  final SharedPreferences _sharedPreferences;

  const PreferencesService(this._sharedPreferences);

  set useDarkMode(bool useDarkMode) {
    _sharedPreferences.setBool(_useDarkModeKey, useDarkMode);
  }

  bool get useDarkMode => _sharedPreferences.getBool(_useDarkModeKey) ?? false;

  bool get openInApp => _sharedPreferences.getBool(_openInAppKey) ?? true;

  List<String> get favourites =>
      _sharedPreferences.getStringList(_favouritesKey) ?? List<String>();

  set openInApp(bool openInApp) {
    _sharedPreferences.setBool(_openInAppKey, openInApp);
  }

  set favourites(List<String> favourites) {
    _sharedPreferences.setStringList(_favouritesKey, favourites);
  }
}
