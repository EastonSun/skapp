import 'package:flutter_ijkplayer/flutter_ijkplayer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import './../../store/live/live.dart';
import './../../widgets/custom_player.dart'; // 自定义播放器样式
import './single_live.dart';

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
  final String url; // 接口地址
  final int index; // 第几个
  VideoWidget({Key key, this.address, this.url, this.index}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _VideoWidgetState(this.index);
}

class _VideoWidgetState extends State<VideoWidget> {
  var _currentIndex;
  _VideoWidgetState(this._currentIndex);
  final LiveStore store = LiveStore();
  IjkMediaController controller = IjkMediaController();
  CustomIJKControllerWidget cusController;
  //创建页面控制器
  PageController _pageController;

  Future<dynamic> requestAPI() async {
    await store.fetchLiveData(widget.url);
  }

  @override
  void initState() {
    super.initState();
    requestAPI();
    _pageController = new PageController(initialPage: _currentIndex);
  }

  renderBody() {
    return PageView.builder(
        controller: _pageController,

        /// pageview中 子条目的个数
        itemCount: store.live.length,

        /// 上下滑动
        scrollDirection: Axis.vertical,
        itemBuilder: (BuildContext context, int index) {
          var videoModel = store.live[index];
          return SingleVideoWidget(videoModel.address);
        });
  }

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (_) => store.live.length > 0 ? renderBody() : Container(),
    );
  }
}
