import 'dart:async';

import 'package:flutter/material.dart';
import './../app/index.dart';
import './../../utils/screen_utils.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import './../../store/root.dart';

///打开APP首页
class SplashWidget extends StatefulWidget {
  @override
  _SplashWidgetState createState() => _SplashWidgetState();
}

class _SplashWidgetState extends State<SplashWidget> {
  /// 创建管理者
  final Global _global = Global();

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Observer(
          builder: (_) => Offstage(
            child: App(),
            offstage: _global.showAd,
          ),
        ),
        Observer(
          builder: (_) => Offstage(
            child: Container(
              child: Stack(
                children: <Widget>[
                  Align(
                    alignment: Alignment(0.0, 0.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        CircleAvatar(
                          radius: ScreenUtils.screenW(context) / 4,
                          backgroundImage: AssetImage('assets/images/home.png'),
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                            left: 20.0,
                            top: 20.0,
                            right: 20.0,
                            bottom: 0,
                          ),
                          child: Text(
                              '    所以我选择了你，因为强者的力量与生俱来，他们失去了对力量的敬畏，而弱者才懂得力量的价值。有爱心，懂得怜悯。',
                              maxLines: 3,
                              overflow: TextOverflow.ellipsis,
                              style: Theme.of(context).textTheme.caption),
                        )
                      ],
                    ),
                  ),
                  SafeArea(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        CountDownWidget(
                          onCountDownFinishCallBack: (bool value) {
                            if (value) {
                              _global.changeShowAd(false);
                            }
                          },
                        ),
                        Padding(
                          padding: const EdgeInsets.only(bottom: 40.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Image.asset(
                                'assets/images/ic_launcher.png',
                                width: 50.0,
                                height: 50.0,
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 10.0),
                                child: Text(
                                  'SK',
                                  style: Theme.of(context).textTheme.title,
                                ),
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
              width: ScreenUtils.screenW(context),
              height: ScreenUtils.screenH(context),
            ),
            offstage: !_global.showAd,
          ),
        )
      ],
    );
  }
}

class CountDownWidget extends StatefulWidget {
  final onCountDownFinishCallBack;

  CountDownWidget({Key key, @required this.onCountDownFinishCallBack})
      : super(key: key);

  @override
  _CountDownWidgetState createState() => _CountDownWidgetState();
}

class _CountDownWidgetState extends State<CountDownWidget> {
  var _seconds = 2;
  Timer _timer;

  @override
  void initState() {
    super.initState();
    _startTimer();
  }

  @override
  Widget build(BuildContext context) {
    return Text('');
  }

  /// 启动倒计时的计时器。
  void _startTimer() {
    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      setState(() {});
      if (_seconds <= 1) {
        widget.onCountDownFinishCallBack(true);
        _cancelTimer();
        return;
      }
      _seconds--;
    });
  }

  /// 取消倒计时的计时器。
  void _cancelTimer() {
    _timer?.cancel();
  }
}
