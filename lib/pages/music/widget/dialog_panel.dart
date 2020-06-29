import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:file_utils/file_utils.dart';
import 'dart:io';
import '../utils.dart';
import './../../../store/music/music.dart';

class DialogPanel extends StatefulWidget {
  final String songInfo;
  final List types;
  DialogPanel({Key key, this.songInfo, this.types}) : super(key: key);

  @override
  _DialogPanelState createState() => _DialogPanelState();
}

class _DialogPanelState extends State<DialogPanel> {
  final MusicStore store = MusicStore();
  Dio dio = Dio();

  // 下载
  Future<void> downloadFile(String fileURl, String fileName) async {
    var checkPermission =
        //1、权限检查
        await Permission.storage.status;
    if (checkPermission.isGranted == false) {
      await [Permission.storage].request();
      checkPermission =
          //1、权限检查
          await Permission.storage.status;
    }
    if (checkPermission.isGranted == true) {
      String dirloc = "";
      if (Platform.isAndroid) {
        dirloc = "/sdcard/download/";
      } else {
        dirloc = (await getApplicationDocumentsDirectory()).path;
      }
      try {
        //2、创建文件
        FileUtils.mkdir([dirloc]);
        //3、使用 dio 下载文件
        await dio.download(fileURl, dirloc + fileName + ".mp3",
            onReceiveProgress: (receivedBytes, totalBytes) {
          double value = (receivedBytes / totalBytes);
          store.changeProgress(value);
          if (value == 1) {
            Fluttertoast.showToast(
              msg: '下载完成',
              toastLength: Toast.LENGTH_LONG,
            );
            store.resetProgress();
          }
        });
      } catch (e) {
        print(e);
      }

      store.resetProgress();
    } else {
      store.resetProgress();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (_) => SimpleDialog(
        title: new Text(json.decode(widget.songInfo)['name']),
        children: widget.types.map<SimpleDialogOption>((item) {
          if (item['type'] == 'progress') {
            if (store.downloading) {
              return SimpleDialogOption(
                child: Padding(
                  padding: EdgeInsets.all(0),
                  child: LinearProgressIndicator(
                    backgroundColor: Colors.grey[200],
                    value: store.progress,
                  ),
                ),
                onPressed: () {},
              );
            } else {
              return SimpleDialogOption(
                child: Container(),
                onPressed: () {},
              );
            }
          } else {
            return SimpleDialogOption(
              child: new Text(
                  Utils.getTypeName(item['type']) + ' ' + item['type']),
              onPressed: () async {
                // 下载音乐
                await store.fetchDownloadData(widget.songInfo, item['type']);
                if (store.downloadUrl != "") {
                  downloadFile(
                      store.downloadUrl,
                      json.decode(widget.songInfo)['name'] +
                          ' - ' +
                          json.decode(widget.songInfo)['singer']);
                }
                // Navigator.of(context).pop();
              },
            );
          }
        }).toList(),
      ),
    );
  }
}
