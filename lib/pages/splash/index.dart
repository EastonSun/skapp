import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import './../app/index.dart';
import './../../utils/screen_utils.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import './../../store/root.dart';

enum Action { Ok, Cancel }

///打开APP首页
class SplashWidget extends StatefulWidget {
  @override
  _SplashWidgetState createState() => _SplashWidgetState();
}

class _SplashWidgetState extends State<SplashWidget> {
  String protocol =
      "1.本软件的数据来源原理是从各视频网站和各官方音乐平台的公开服务器中拉取数据，经过对数据简单地筛选与合并后进行展示，因此本软件不对数据的准确性负责\n2.使用本软件的过程中可能会产生版权数据，对于这些版权数据，本软件不拥有它们的所有权，为了避免造成侵权，使用者务必在24小时内清除使用本软件的过程中所产生的版权数据。\n3.本软件内的音乐助手别名为本软件内对官方音乐平台的一个称呼，不包含恶意，如果官方音乐平台觉得不妥，可联系本软件更改或移除。\n4.本软件内使用的部分包括但不限于字体、图片等资源来源于互联网，如果出现侵权可联系本软件移除。5.由于使用本软件产生的包括由于本协议或由于使用或无法使用本软件而引起的任何性质的任何直接、间接、特殊、偶然或结果性损害（包括但不限于因商誉损失、停工、计算机故障或故障引起的损害赔偿，或任何及所有其他商业损害或损失）由使用者负责。\n6.本软件完全免费，且开源发布于 GitHub 面向全世界人用作对技术的学习交流，本软件不对软件内的技术可能存在违反当地法律法规的行为作保证，禁止在违反当地法律法规的情况下使用本软件，对于使用者在明知或不知当地法律法规不允许的情况下使用本软件所造成的任何违法违规行为由使用者承担，本软件不承担由此造成的任何直接、间接、特殊、偶然或结果性责任。\n\n若你使用了本软件，将代表你接收以上协议，请尊重版权，支持正版。";

  _checkProtocol(_global, context) async {
    if (!_global.isAllowProtocol) {
      _showAlertDialog(_global, context);
    }
  }

  _showAlertDialog(_global, BuildContext context) {
    //设置按钮
    Widget cancelButton = FlatButton(
      child: Text("取消"),
      onPressed: () {
        Navigator.pop(context, Action.Cancel);
        SystemNavigator.pop();
      },
    );
    Widget continueButton = FlatButton(
      child: Text("确定"),
      onPressed: () {
        _global.changeProtocol(true);
        Navigator.pop(context, Action.Ok);
      },
    );

    //设置对话框
    AlertDialog alert = AlertDialog(
      title: Text("软件协议"),
      content: Text(protocol),
      scrollable: true,
      actions: [
        cancelButton,
        continueButton,
      ],
    );

    //显示对话框
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final Global _global = Provider.of<Global>(context);
    Timer(Duration(seconds: 1), () => _checkProtocol(_global, context));

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
      if (mounted) {
        setState(() {});
      }
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
