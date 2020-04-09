import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';
import './store/root.dart';
import './pages/splash/index.dart';

void main() => runApp(MultiProvider(
      providers: [
        Provider<Global>(
          create: (_) => Global(),
        ),
      ],
      child: MyApp(),
    ));

class MyApp extends StatelessWidget {
  MyApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Global _global = Provider.of<Global>(context);
    return Observer(
      builder: (_) => MaterialApp(
        theme: ThemeData(
            brightness: _global.themeMode, primarySwatch: _global.theme),
        home: Scaffold(
          resizeToAvoidBottomPadding: false,
          body: SplashWidget(),
        ),
      ),
    );
  }
}
