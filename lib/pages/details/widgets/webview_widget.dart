import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import './../../../store/details/details.dart';

class WebViewPage extends StatefulWidget {
  final DetailsStore store;
  WebViewController _webViewController; // 添加一个controller

  WebViewPage({this.store});

  @override
  _WebViewState createState() => _WebViewState();
}

class _WebViewState extends State<WebViewPage> {
  @override
  void initState() {
    super.initState();
  }

  // JavascriptChannel _jsBridge(BuildContext context) => JavascriptChannel(
  //     name: 'lkMsg', // 与h5 端的一致 不然收不到消息
  //     onMessageReceived: (JavascriptMessage message) async {
  //       print(message.message);
  //     });
  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Observer(
        builder: (_) => AspectRatio(
              aspectRatio: 16.0 / 9.0,
              child: Container(
                color: Colors.black,
                child: WebView(
                  initialUrl: widget.store.currentUrl, // 加载的url
                  // userAgent: "your userAgent", // h5 可以通过navigator.userAgent判断当前环境
                  javascriptMode: JavascriptMode
                      .unrestricted, // 启用 js交互，默认不启用JavascriptMode.disabled
                  // javascriptChannels: <JavascriptChannel>[
                  //   _jsBridge(context) // 与h5 通信
                  // ].toSet(),
                  // onWebViewCreated: (WebViewController web) {
                  //   //  _webViewController = web;
                  //   //   // webview 创建调用，
                  //   //  web.loadUrl(url);此时也可以初始化一个url
                  //   // web.canGoBack().then((res){
                  //   //     print(res); // 是否能返回上一级
                  //   //  });
                  //   //  web.currentUrl().then((url){
                  //   //    print(url);// 返回当前url
                  //   //  });
                  //   //  web.canGoForward().then((res){
                  //   //    print(res); //是否能前进
                  //   //  });
                  // },
                  // navigationDelegate: (NavigationRequest request) {
                  //   ///在页面跳转之前调用，TODO isForMainFrame为false,页面不跳转.导致网页内很多链接点击没效果
                  //   // if(...) {

                  //   //   return NavigationDecision.prevent // 禁止跳转;
                  //   // }
                  //   return NavigationDecision.navigate; // 跳转;
                  // },
                  // onPageFinished: (String value) {
                  //   // webview 页面加载调用
                  //   // flutter 调用h5 端方法
                  //   //  _webViewController
                  //   //     .evaluateJavascript('document.title')
                  //   //     .then((title) {
                  //   //   // 获取网页title
                  //   //   print(title);
                  //   // });
                  // },
                ),
              ),
            ) // 宽高比

        );
  }
}
