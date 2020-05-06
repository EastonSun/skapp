import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import './../../http/API.dart';

class Custom extends StatefulWidget {
  @override
  _CustomState createState() => _CustomState();
}

class _CustomState extends State<Custom> {
  String ip = API.BASE_SK_URL;
  bool isIp = false; // 是否是一个ip地址
  bool isAvailableIp = false; // ip是否可用

  Future<dynamic> getIP() async {
    // 初始化信息
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String cIp = prefs.getString('ip') ?? API.BASE_SK_URL;
    setState(() {
      ip = cIp;
    });
  }

  @override
  void initState() {
    super.initState();
    getIP();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('自定义设置'),
      ),
      body: Column(
        children: <Widget>[
          SizedBox(
            height: 10,
          ),
          TextField(
            // autofocus: true,
            decoration: InputDecoration(
                labelText: "IP地址",
                hintText: "当前地址：$ip",
                prefixIcon: Icon(Icons.near_me)),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Expanded(
                child: Container(
                  height: 30,
                  margin: EdgeInsets.all(20),
                  child: RaisedButton(
                    child: Text('测试连接'),
                    color: Theme.of(context).primaryColor,
                    textColor: Colors.white,
                    elevation: 10,
                    onPressed: isIp ? () {} : null,
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  height: 30,
                  margin: EdgeInsets.all(20),
                  child: RaisedButton(
                    child: Text('连接'),
                    color: Theme.of(context).primaryColor,
                    textColor: Colors.white,
                    elevation: 10,
                    onPressed: isAvailableIp ? () {} : null,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
