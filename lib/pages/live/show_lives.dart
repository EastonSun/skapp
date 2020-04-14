import 'package:flutter_ijkplayer/flutter_ijkplayer.dart';
import 'package:flutter/material.dart';
import './../../widgets/custom_player.dart'; // 自定义播放器样式

///http://vt1.doubanio.com/201902111139/0c06a85c600b915d8c9cbdbbaf06ba9f/view/movie/M/302420330.mp4
///http://g.shumafen.cn/api/user/file_jx_2.php?secret=f3a81974b27a414a&id=be6a5500a342acc3.mp4
//'https://www.sample-videos.com/video123/mp4/720/big_buck_bunny_720p_20mb.mp4',
// 'rtmp://172.16.100.245/live1',
// 'https://www.sample-videos.com/video123/flv/720/big_buck_bunny_720p_10mb.flv',
//              "https://www.sample-videos.com/video123/mp4/720/big_buck_bunny_720p_1mb.mp4",
// 'http://184.72.239.149/vod/smil:BigBuckBunny.smil/playlist.m3u8',
// "file:///sdcard/Download/Sample1.mp4",
class VideoWidget extends StatefulWidget {
  final String address;
  VideoWidget({Key key, this.address}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _VideoWidgetState();
}

class _VideoWidgetState extends State<VideoWidget> {
  IjkMediaController controller = IjkMediaController();
  CustomIJKControllerWidget cusController;

  @override
  void initState() {
    super.initState();
    cusController = CustomIJKControllerWidget(
      controller: controller,
      currentFullScreenState: true,
      showFullScreenButton: false,
      horizontalGesture: false,
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
      ),
    );
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
}
