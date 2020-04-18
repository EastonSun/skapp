import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:wakelock/wakelock.dart';
import 'package:fluro/fluro.dart';
import 'routers/routers.dart';
import 'routers/application.dart';
import './store/root.dart';
import './pages/splash/index.dart';

void main() async {
  Wakelock.enable();
  WidgetsFlutterBinding.ensureInitialized();
  // 初始化信息
  SharedPreferences prefs = await SharedPreferences.getInstance();

  runApp(MultiProvider(
    providers: [
      Provider<Global>(
        create: (_) => Global(prefs),
      ),
    ],
    child: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  MyApp() {
    final router = new Router();
    Routes.configureRoutes(router);
    Application.router = router;
  }

  @override
  Widget build(BuildContext context) {
    final Global _global = Provider.of<Global>(context);

    return Observer(
      builder: (_) => MaterialApp(
        theme: ThemeData(
          brightness: _global.themeMode,
          primarySwatch: _global.theme,
          platform: TargetPlatform.iOS,
        ),
        home: Scaffold(
          resizeToAvoidBottomPadding: false,
          body: SplashWidget(),
        ),
        onGenerateRoute: Application.router.generator,
      ),
    );
  }
}
