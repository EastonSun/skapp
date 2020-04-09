// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'root.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$Global on GlobalMobx, Store {
  final _$showAdAtom = Atom(name: 'GlobalMobx.showAd');

  @override
  bool get showAd {
    _$showAdAtom.context.enforceReadPolicy(_$showAdAtom);
    _$showAdAtom.reportObserved();
    return super.showAd;
  }

  @override
  set showAd(bool value) {
    _$showAdAtom.context.conditionallyRunInAction(() {
      super.showAd = value;
      _$showAdAtom.reportChanged();
    }, _$showAdAtom, name: '${_$showAdAtom.name}_set');
  }

  final _$titleAtom = Atom(name: 'GlobalMobx.title');

  @override
  String get title {
    _$titleAtom.context.enforceReadPolicy(_$titleAtom);
    _$titleAtom.reportObserved();
    return super.title;
  }

  @override
  set title(String value) {
    _$titleAtom.context.conditionallyRunInAction(() {
      super.title = value;
      _$titleAtom.reportChanged();
    }, _$titleAtom, name: '${_$titleAtom.name}_set');
  }

  final _$themeAtom = Atom(name: 'GlobalMobx.theme');

  @override
  Color get theme {
    _$themeAtom.context.enforceReadPolicy(_$themeAtom);
    _$themeAtom.reportObserved();
    return super.theme;
  }

  @override
  set theme(Color value) {
    _$themeAtom.context.conditionallyRunInAction(() {
      super.theme = value;
      _$themeAtom.reportChanged();
    }, _$themeAtom, name: '${_$themeAtom.name}_set');
  }

  final _$themeModeAtom = Atom(name: 'GlobalMobx.themeMode');

  @override
  Brightness get themeMode {
    _$themeModeAtom.context.enforceReadPolicy(_$themeModeAtom);
    _$themeModeAtom.reportObserved();
    return super.themeMode;
  }

  @override
  set themeMode(Brightness value) {
    _$themeModeAtom.context.conditionallyRunInAction(() {
      super.themeMode = value;
      _$themeModeAtom.reportChanged();
    }, _$themeModeAtom, name: '${_$themeModeAtom.name}_set');
  }

  final _$isDarkAtom = Atom(name: 'GlobalMobx.isDark');

  @override
  bool get isDark {
    _$isDarkAtom.context.enforceReadPolicy(_$isDarkAtom);
    _$isDarkAtom.reportObserved();
    return super.isDark;
  }

  @override
  set isDark(bool value) {
    _$isDarkAtom.context.conditionallyRunInAction(() {
      super.isDark = value;
      _$isDarkAtom.reportChanged();
    }, _$isDarkAtom, name: '${_$isDarkAtom.name}_set');
  }

  final _$GlobalMobxActionController = ActionController(name: 'GlobalMobx');

  @override
  void changeShowAd(bool showAd) {
    final _$actionInfo = _$GlobalMobxActionController.startAction();
    try {
      return super.changeShowAd(showAd);
    } finally {
      _$GlobalMobxActionController.endAction(_$actionInfo);
    }
  }

  @override
  void changeTheme(Color color) {
    final _$actionInfo = _$GlobalMobxActionController.startAction();
    try {
      return super.changeTheme(color);
    } finally {
      _$GlobalMobxActionController.endAction(_$actionInfo);
    }
  }

  @override
  void changeThemeMode(dynamic value) {
    final _$actionInfo = _$GlobalMobxActionController.startAction();
    try {
      return super.changeThemeMode(value);
    } finally {
      _$GlobalMobxActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    final string =
        'showAd: ${showAd.toString()},title: ${title.toString()},theme: ${theme.toString()},themeMode: ${themeMode.toString()},isDark: ${isDark.toString()}';
    return '{$string}';
  }
}
