import './model/lyric.dart';

class Utils {
  static getLyricFromTxt(String lrc) {
    List<LyricSlice> slices = new List();
    List<String> list = lrc.split("\n");
    print("lines:" + list.length.toString() + "");
    for (String line in list) {
      print(line);
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
    print(lyricSlice.in_second.toString() + "-----" + lyricSlice.slice);
    return lyricSlice;
  }
}
