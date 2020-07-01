import './model/lyric.dart';

class Utils {
  static getLyricFromTxt(String lrc) {
    List<LyricSlice> slices = new List();
    List<String> list = lrc.split("\n");
    for (String line in list) {
      if (line.startsWith("[0") || line.startsWith("[1")) {
        slices.add(getLyricSlice(line));
      }
    }
    Lyric lyric = new Lyric(slices);
    return lyric;
  }

  static LyricSlice getLyricSlice(String line) {
    LyricSlice lyricSlice = new LyricSlice();
    lyricSlice.slice = line.substring(10);
    lyricSlice.in_second =
        int.parse(line.substring(1, 3)) * 60 + int.parse(line.substring(4, 6));
    return lyricSlice;
  }

  static String getTypeName(String type) {
    switch (type) {
      case 'flac':
      case 'ape':
      case 'wav':
        return '无损';
      case '320k':
        return '高品质';
      case '192k':
      case '128k':
        return '普通';
      default:
        return '';
    }
  }
}
