// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'music.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$MusicStore on MusicStoreMobx, Store {
  final _$isLoadingAtom = Atom(name: 'MusicStoreMobx.isLoading');

  @override
  bool get isLoading {
    _$isLoadingAtom.reportRead();
    return super.isLoading;
  }

  @override
  set isLoading(bool value) {
    _$isLoadingAtom.reportWrite(value, super.isLoading, () {
      super.isLoading = value;
    });
  }

  final _$downloadingAtom = Atom(name: 'MusicStoreMobx.downloading');

  @override
  bool get downloading {
    _$downloadingAtom.reportRead();
    return super.downloading;
  }

  @override
  set downloading(bool value) {
    _$downloadingAtom.reportWrite(value, super.downloading, () {
      super.downloading = value;
    });
  }

  final _$progressAtom = Atom(name: 'MusicStoreMobx.progress');

  @override
  double get progress {
    _$progressAtom.reportRead();
    return super.progress;
  }

  @override
  set progress(double value) {
    _$progressAtom.reportWrite(value, super.progress, () {
      super.progress = value;
    });
  }

  final _$songInfoAtom = Atom(name: 'MusicStoreMobx.songInfo');

  @override
  Map<dynamic, dynamic> get songInfo {
    _$songInfoAtom.reportRead();
    return super.songInfo;
  }

  @override
  set songInfo(Map<dynamic, dynamic> value) {
    _$songInfoAtom.reportWrite(value, super.songInfo, () {
      super.songInfo = value;
    });
  }

  final _$mp3UrlAtom = Atom(name: 'MusicStoreMobx.mp3Url');

  @override
  String get mp3Url {
    _$mp3UrlAtom.reportRead();
    return super.mp3Url;
  }

  @override
  set mp3Url(String value) {
    _$mp3UrlAtom.reportWrite(value, super.mp3Url, () {
      super.mp3Url = value;
    });
  }

  final _$downloadUrlAtom = Atom(name: 'MusicStoreMobx.downloadUrl');

  @override
  String get downloadUrl {
    _$downloadUrlAtom.reportRead();
    return super.downloadUrl;
  }

  @override
  set downloadUrl(String value) {
    _$downloadUrlAtom.reportWrite(value, super.downloadUrl, () {
      super.downloadUrl = value;
    });
  }

  final _$currentAtom = Atom(name: 'MusicStoreMobx.current');

  @override
  int get current {
    _$currentAtom.reportRead();
    return super.current;
  }

  @override
  set current(int value) {
    _$currentAtom.reportWrite(value, super.current, () {
      super.current = value;
    });
  }

  final _$fetchDataAsyncAction = AsyncAction('MusicStoreMobx.fetchData');

  @override
  Future<dynamic> fetchData(String song, String type) {
    return _$fetchDataAsyncAction.run(() => super.fetchData(song, type));
  }

  final _$fetchDownloadDataAsyncAction =
      AsyncAction('MusicStoreMobx.fetchDownloadData');

  @override
  Future<dynamic> fetchDownloadData(String song, String type) {
    return _$fetchDownloadDataAsyncAction
        .run(() => super.fetchDownloadData(song, type));
  }

  final _$MusicStoreMobxActionController =
      ActionController(name: 'MusicStoreMobx');

  @override
  void resetSongInfo() {
    final _$actionInfo = _$MusicStoreMobxActionController.startAction(
        name: 'MusicStoreMobx.resetSongInfo');
    try {
      return super.resetSongInfo();
    } finally {
      _$MusicStoreMobxActionController.endAction(_$actionInfo);
    }
  }

  @override
  void changeProgress(double value) {
    final _$actionInfo = _$MusicStoreMobxActionController.startAction(
        name: 'MusicStoreMobx.changeProgress');
    try {
      return super.changeProgress(value);
    } finally {
      _$MusicStoreMobxActionController.endAction(_$actionInfo);
    }
  }

  @override
  void resetProgress() {
    final _$actionInfo = _$MusicStoreMobxActionController.startAction(
        name: 'MusicStoreMobx.resetProgress');
    try {
      return super.resetProgress();
    } finally {
      _$MusicStoreMobxActionController.endAction(_$actionInfo);
    }
  }

  @override
  void changeCurrent(int c) {
    final _$actionInfo = _$MusicStoreMobxActionController.startAction(
        name: 'MusicStoreMobx.changeCurrent');
    try {
      return super.changeCurrent(c);
    } finally {
      _$MusicStoreMobxActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
isLoading: ${isLoading},
downloading: ${downloading},
progress: ${progress},
songInfo: ${songInfo},
mp3Url: ${mp3Url},
downloadUrl: ${downloadUrl},
current: ${current}
    ''';
  }
}
