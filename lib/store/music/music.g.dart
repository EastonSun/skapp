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

  final _$fetchDataAsyncAction = AsyncAction('fetchData');

  @override
  Future<dynamic> fetchData(String song, String type) {
    return _$fetchDataAsyncAction.run(() => super.fetchData(song, type));
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
  String toString() {
    final string =
        'isLoading: ${isLoading.toString()},songInfo: ${songInfo.toString()},mp3Url: ${mp3Url.toString()}';
    return '{$string}';
  }
}
