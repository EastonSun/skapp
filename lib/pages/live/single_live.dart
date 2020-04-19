import 'package:flutter_ijkplayer/flutter_ijkplayer.dart';
import 'package:flutter/material.dart';
import 'package:wakelock/wakelock.dart';
import './../../widgets/custom_player.dart'; // 自定义播放器样式

///http://vt1.doubanio.com/201902111139/0c06a85c600b915d8c9cbdbbaf06ba9f/view/movie/M/302420330.mp4
///http://g.shumafen.cn/api/user/file_jx_2.php?secret=f3a81974b27a414a&id=be6a5500a342acc3.mp4
//'https://www.sample-videos.com/video123/mp4/720/big_buck_bunny_720p_20mb.mp4',
// 'rtmp://172.16.100.245/live1',
// 'https://www.sample-videos.com/video123/flv/720/big_buck_bunny_720p_10mb.flv',
//              "https://www.sample-videos.com/video123/mp4/720/big_buck_bunny_720p_1mb.mp4",
// 'http://184.72.239.149/vod/smil:BigBuckBunny.smil/playlist.m3u8',
// "file:///sdcard/Download/Sample1.mp4",
class SingleVideoWidget extends StatefulWidget {
  final String address;
  SingleVideoWidget(this.address, {Key key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _SingleVideoWidgetState();
}

class _SingleVideoWidgetState extends State<SingleVideoWidget> {
  IjkMediaController controller = IjkMediaController();
  CustomIJKControllerWidget cusController;

  @override
  void initState() {
    super.initState();
    Wakelock.enable();
    cusController = CustomIJKControllerWidget(
      controller: controller,
      currentFullScreenState: true,
      showFullScreenButton: false,
      horizontalGesture: false,
      verticalGesture: false,
      fullscreenControllerWidgetBuilder: (IJKControllerWidgetBuilder) {
        return Container();
      },
    );
    // 初始化
    controller.setNetworkDataSource(
      widget.address,
      autoPlay: true,
    );
  }

  @override
  Widget build(BuildContext context) {
    return buildIjkPlayer();
  }

  Widget buildIjkPlayer() {
    return Container(
      child: IjkPlayer(
        mediaController: controller,
        controllerWidgetBuilder: (mediaController) {
          return cusController; // 自定义
        },
        statusWidgetBuilder: _buildStatusWidget,
      ),
    );
  }

  Widget _buildStatusWidget(
    BuildContext context,
    IjkMediaController controller,
    IjkStatus status,
  ) {
    if (status == IjkStatus.prepared) {
      return Center(
        child: CircularProgressIndicator(
          strokeWidth: 1.4,
        ),
      );
    }

    // you can custom your self status widget
    return IjkStatusWidget.buildStatusWidget(context, controller, status);
  }

  @override
  void dispose() {
    controller.dispose();
    Wakelock.disable();
    super.dispose();
  }
}
