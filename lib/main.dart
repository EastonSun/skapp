import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import './store/root.dart';
import './pages/splash/index.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  MyApp({Key key}) : super(key: key);
  final Global _global = Global();

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (_) => MaterialApp(
        theme: ThemeData(
            brightness: _global.themeMode, primaryColor: _global.theme),
        home: Scaffold(
          resizeToAvoidBottomPadding: false,
          body: SplashWidget(),
        ),
      ),
    );
  }
}
