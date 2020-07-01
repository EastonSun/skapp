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

  final _$musicListsAtom = Atom(name: 'MusicStoreMobx.musicLists');

  @override
  ObservableList<dynamic> get musicLists {
    _$musicListsAtom.reportRead();
    return super.musicLists;
  }

  @override
  set musicLists(ObservableList<dynamic> value) {
    _$musicListsAtom.reportWrite(value, super.musicLists, () {
      super.musicLists = value;
    });
  }

  final _$currentPlayIndexAtom = Atom(name: 'MusicStoreMobx.currentPlayIndex');

  @override
  int get currentPlayIndex {
    _$currentPlayIndexAtom.reportRead();
    return super.currentPlayIndex;
  }

  @override
  set currentPlayIndex(int value) {
    _$currentPlayIndexAtom.reportWrite(value, super.currentPlayIndex, () {
      super.currentPlayIndex = value;
    });
  }

  final _$isFavoriteAtom = Atom(name: 'MusicStoreMobx.isFavorite');

  @override
  bool get isFavorite {
    _$isFavoriteAtom.reportRead();
    return super.isFavorite;
  }

  @override
  set isFavorite(bool value) {
    _$isFavoriteAtom.reportWrite(value, super.isFavorite, () {
      super.isFavorite = value;
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

  final _$isTopicAtom = Atom(name: 'MusicStoreMobx.isTopic');

  @override
  bool get isTopic {
    _$isTopicAtom.reportRead();
    return super.isTopic;
  }

  @override
  set isTopic(bool value) {
    _$isTopicAtom.reportWrite(value, super.isTopic, () {
      super.isTopic = value;
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
  void changeTopic(bool c) {
    final _$actionInfo = _$MusicStoreMobxActionController.startAction(
        name: 'MusicStoreMobx.changeTopic');
    try {
      return super.changeTopic(c);
    } finally {
      _$MusicStoreMobxActionController.endAction(_$actionInfo);
    }
  }

  @override
  void changeMusicLists(dynamic list) {
    final _$actionInfo = _$MusicStoreMobxActionController.startAction(
        name: 'MusicStoreMobx.changeMusicLists');
    try {
      return super.changeMusicLists(list);
    } finally {
      _$MusicStoreMobxActionController.endAction(_$actionInfo);
    }
  }

  @override
  void changeCurrentPlayIndex(int i) {
    final _$actionInfo = _$MusicStoreMobxActionController.startAction(
        name: 'MusicStoreMobx.changeCurrentPlayIndex');
    try {
      return super.changeCurrentPlayIndex(i);
    } finally {
      _$MusicStoreMobxActionController.endAction(_$actionInfo);
    }
  }

  @override
  void changeFavorite(bool b) {
    final _$actionInfo = _$MusicStoreMobxActionController.startAction(
        name: 'MusicStoreMobx.changeFavorite');
    try {
      return super.changeFavorite(b);
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
musicLists: ${musicLists},
currentPlayIndex: ${currentPlayIndex},
isFavorite: ${isFavorite},
current: ${current},
isTopic: ${isTopic}
    ''';
  }
}
