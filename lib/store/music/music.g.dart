// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'music.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$MusicStore on MusicStoreMobx, Store {
  final _$isLoadingAtom = Atom(name: 'MusicStoreMobx.isLoading');

  @override
  bool get isLoading {
    _$isLoadingAtom.context.enforceReadPolicy(_$isLoadingAtom);
    _$isLoadingAtom.reportObserved();
    return super.isLoading;
  }

  @override
  set isLoading(bool value) {
    _$isLoadingAtom.context.conditionallyRunInAction(() {
      super.isLoading = value;
      _$isLoadingAtom.reportChanged();
    }, _$isLoadingAtom, name: '${_$isLoadingAtom.name}_set');
  }

  final _$downloadingAtom = Atom(name: 'MusicStoreMobx.downloading');

  @override
  bool get downloading {
    _$downloadingAtom.context.enforceReadPolicy(_$downloadingAtom);
    _$downloadingAtom.reportObserved();
    return super.downloading;
  }

  @override
  set downloading(bool value) {
    _$downloadingAtom.context.conditionallyRunInAction(() {
      super.downloading = value;
      _$downloadingAtom.reportChanged();
    }, _$downloadingAtom, name: '${_$downloadingAtom.name}_set');
  }

  final _$progressAtom = Atom(name: 'MusicStoreMobx.progress');

  @override
  double get progress {
    _$progressAtom.context.enforceReadPolicy(_$progressAtom);
    _$progressAtom.reportObserved();
    return super.progress;
  }

  @override
  set progress(double value) {
    _$progressAtom.context.conditionallyRunInAction(() {
      super.progress = value;
      _$progressAtom.reportChanged();
    }, _$progressAtom, name: '${_$progressAtom.name}_set');
  }

  final _$songInfoAtom = Atom(name: 'MusicStoreMobx.songInfo');

  @override
  Map<dynamic, dynamic> get songInfo {
    _$songInfoAtom.context.enforceReadPolicy(_$songInfoAtom);
    _$songInfoAtom.reportObserved();
    return super.songInfo;
  }

  @override
  set songInfo(Map<dynamic, dynamic> value) {
    _$songInfoAtom.context.conditionallyRunInAction(() {
      super.songInfo = value;
      _$songInfoAtom.reportChanged();
    }, _$songInfoAtom, name: '${_$songInfoAtom.name}_set');
  }

  final _$mp3UrlAtom = Atom(name: 'MusicStoreMobx.mp3Url');

  @override
  String get mp3Url {
    _$mp3UrlAtom.context.enforceReadPolicy(_$mp3UrlAtom);
    _$mp3UrlAtom.reportObserved();
    return super.mp3Url;
  }

  @override
  set mp3Url(String value) {
    _$mp3UrlAtom.context.conditionallyRunInAction(() {
      super.mp3Url = value;
      _$mp3UrlAtom.reportChanged();
    }, _$mp3UrlAtom, name: '${_$mp3UrlAtom.name}_set');
  }

  final _$downloadUrlAtom = Atom(name: 'MusicStoreMobx.downloadUrl');

  @override
  String get downloadUrl {
    _$downloadUrlAtom.context.enforceReadPolicy(_$downloadUrlAtom);
    _$downloadUrlAtom.reportObserved();
    return super.downloadUrl;
  }

  @override
  set downloadUrl(String value) {
    _$downloadUrlAtom.context.conditionallyRunInAction(() {
      super.downloadUrl = value;
      _$downloadUrlAtom.reportChanged();
    }, _$downloadUrlAtom, name: '${_$downloadUrlAtom.name}_set');
  }

  final _$currentAtom = Atom(name: 'MusicStoreMobx.current');

  @override
  int get current {
    _$currentAtom.context.enforceReadPolicy(_$currentAtom);
    _$currentAtom.reportObserved();
    return super.current;
  }

  @override
  set current(int value) {
    _$currentAtom.context.conditionallyRunInAction(() {
      super.current = value;
      _$currentAtom.reportChanged();
    }, _$currentAtom, name: '${_$currentAtom.name}_set');
  }

  final _$fetchDataAsyncAction = AsyncAction('fetchData');

  @override
  Future<dynamic> fetchData(String song, String type) {
    return _$fetchDataAsyncAction.run(() => super.fetchData(song, type));
  }

  final _$fetchDownloadDataAsyncAction = AsyncAction('fetchDownloadData');

  @override
  Future<dynamic> fetchDownloadData(String song, String type) {
    return _$fetchDownloadDataAsyncAction
        .run(() => super.fetchDownloadData(song, type));
  }

  final _$MusicStoreMobxActionController =
      ActionController(name: 'MusicStoreMobx');

  @override
  void resetSongInfo() {
    final _$actionInfo = _$MusicStoreMobxActionController.startAction();
    try {
      return super.resetSongInfo();
    } finally {
      _$MusicStoreMobxActionController.endAction(_$actionInfo);
    }
  }

  @override
  void changeProgress(double value) {
    final _$actionInfo = _$MusicStoreMobxActionController.startAction();
    try {
      return super.changeProgress(value);
    } finally {
      _$MusicStoreMobxActionController.endAction(_$actionInfo);
    }
  }

  @override
  void resetProgress() {
    final _$actionInfo = _$MusicStoreMobxActionController.startAction();
    try {
      return super.resetProgress();
    } finally {
      _$MusicStoreMobxActionController.endAction(_$actionInfo);
    }
  }

  @override
  void changeCurrent(int c) {
    final _$actionInfo = _$MusicStoreMobxActionController.startAction();
    try {
      return super.changeCurrent(c);
    } finally {
      _$MusicStoreMobxActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    final string =
        'isLoading: ${isLoading.toString()},downloading: ${downloading.toString()},progress: ${progress.toString()},songInfo: ${songInfo.toString()},mp3Url: ${mp3Url.toString()},downloadUrl: ${downloadUrl.toString()},current: ${current.toString()}';
    return '{$string}';
  }
}
