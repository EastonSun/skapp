import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:package_info/package_info.dart';
import 'package:skapp/widgets/restart_app.dart';
import 'package:upgrader/upgrader.dart';
import 'package:fluro/fluro.dart';
import 'package:yin_umeng/yin_umeng.dart';
import 'routers/routers.dart';
import 'routers/application.dart';
import './store/root.dart';
import './pages/splash/index.dart';
import './http/API.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // 初始化信息
  SharedPreferences prefs = await SharedPreferences.getInstance();
  // 歌单处理
  if (prefs.getStringList('songLists') == null) {
    prefs.setStringList('songLists', []);
  }
  runApp(RestartWidget(
    child: MultiProvider(
      providers: [
        Provider<Global>(
          create: (_) => Global(prefs),
        ),
      ],
      child: MyApp(),
    ),
  ));
}

class MyApp extends StatelessWidget {
  final updataAppUrl = API.BASE_SK_URL + API.APP_UPDATE_URL;

  PackageInfo packageInfo;
  MyApp() {
    final router = new Router();
    Routes.configureRoutes(router);
    Application.router = router;
    //初始化友盟
    YinUmeng.init(
      '5eb61d96167eddfc990001c9',
      channel: '',
      policy: Policy.BATCH,
      encrypt: true,
      reportCrash: true,
    );

    // YinUmeng.beginPageView('/');
    // YinUmeng.endPageView('/');
  }

  @override
  Widget build(BuildContext context) {
    final Global _global = Provider.of<Global>(context);
    _global.getAppConfig();
    Upgrader().clearSavedSettings();
    // Upgrader().isUpdateAvailable();
    final cfg =
        AppcastConfiguration(url: updataAppUrl, supportedOS: ['android']);
    _upgradeApp(_global);

    return Observer(
      builder: (_) => MaterialApp(
        theme: ThemeData(
          brightness: _global.themeMode,
          primarySwatch: _global.theme,
          platform: TargetPlatform.iOS,
        ),
        home: Scaffold(
          resizeToAvoidBottomPadding: false,
          body: _global.updataApp
              ? UpgradeAlert(
                  appcastConfig: cfg,
                  title: '发现新版本',
                  prompt: '',
                  showLater: false,
                  showIgnore: false,
                  buttonTitleUpdate: '立即更新',
                  debugAlwaysUpgrade: true,
                  child: Center(
                    child: Container(),
                  )
                  // debugLogging: true,
                  )
              : SplashWidget(),
        ),
        onGenerateRoute: Application.router.generator,
        navigatorObservers: [AppAnalysis()],
      ),
    );
  }

  _upgradeApp(_global) async {
    final appcast = Appcast();
    await appcast.parseAppcastItemsFromUri(updataAppUrl);
    final bestItem = appcast.bestItem();
    // 判断版本是否一致
    packageInfo = await PackageInfo.fromPlatform();
    if (packageInfo.version != bestItem.versionString) {
      _global.changeUpdataApp();
    }
  }
}

class AppAnalysis extends NavigatorObserver {
  @override
  void didPush(Route<dynamic> route, Route<dynamic> previousRoute) {
    if (route.settings.name != null) {
      YinUmeng.beginPageView(route.settings.name);
      YinUmeng.logEvent(route.settings.name);
    }
  }

  @override
  void didPop(Route<dynamic> route, Route<dynamic> previousRoute) {
    if (route.settings.name != null) {
      YinUmeng.endPageView(route.settings.name);
      YinUmeng.logEvent(route.settings.name);
    }
  }
}
