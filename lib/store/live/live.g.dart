// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'live.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$LiveStore on LiveStoreMobx, Store {
  final _$isPassAtom = Atom(name: 'LiveStoreMobx.isPass');

  @override
  bool get isPass {
    _$isPassAtom.reportRead();
    return super.isPass;
  }

  @override
  set isPass(bool value) {
    _$isPassAtom.reportWrite(value, super.isPass, () {
      super.isPass = value;
    });
  }

  final _$isAllLoadingAtom = Atom(name: 'LiveStoreMobx.isAllLoading');

  @override
  bool get isAllLoading {
    _$isAllLoadingAtom.reportRead();
    return super.isAllLoading;
  }

  @override
  set isAllLoading(bool value) {
    _$isAllLoadingAtom.reportWrite(value, super.isAllLoading, () {
      super.isAllLoading = value;
    });
  }

  final _$isItemLoadingAtom = Atom(name: 'LiveStoreMobx.isItemLoading');

  @override
  bool get isItemLoading {
    _$isItemLoadingAtom.reportRead();
    return super.isItemLoading;
  }

  @override
  set isItemLoading(bool value) {
    _$isItemLoadingAtom.reportWrite(value, super.isItemLoading, () {
      super.isItemLoading = value;
    });
  }

  final _$livesObjAtom = Atom(name: 'LiveStoreMobx.livesObj');

  @override
  LiveAllDao get livesObj {
    _$livesObjAtom.reportRead();
    return super.livesObj;
  }

  @override
  set livesObj(LiveAllDao value) {
    _$livesObjAtom.reportWrite(value, super.livesObj, () {
      super.livesObj = value;
    });
  }

  final _$livesAtom = Atom(name: 'LiveStoreMobx.lives');

  @override
  ObservableList<dynamic> get lives {
    _$livesAtom.reportRead();
    return super.lives;
  }

  @override
  set lives(ObservableList<dynamic> value) {
    _$livesAtom.reportWrite(value, super.lives, () {
      super.lives = value;
    });
  }

  final _$liveItemAtom = Atom(name: 'LiveStoreMobx.liveItem');

  @override
  LiveItemDao get liveItem {
    _$liveItemAtom.reportRead();
    return super.liveItem;
  }

  @override
  set liveItem(LiveItemDao value) {
    _$liveItemAtom.reportWrite(value, super.liveItem, () {
      super.liveItem = value;
    });
  }

  final _$liveAtom = Atom(name: 'LiveStoreMobx.live');

  @override
  ObservableList<dynamic> get live {
    _$liveAtom.reportRead();
    return super.live;
  }

  @override
  set live(ObservableList<dynamic> value) {
    _$liveAtom.reportWrite(value, super.live, () {
      super.live = value;
    });
  }

  final _$fetchLivesDataAsyncAction =
      AsyncAction('LiveStoreMobx.fetchLivesData');

  @override
  Future<dynamic> fetchLivesData() {
    return _$fetchLivesDataAsyncAction.run(() => super.fetchLivesData());
  }

  final _$fetchLiveDataAsyncAction = AsyncAction('LiveStoreMobx.fetchLiveData');

  @override
  Future<dynamic> fetchLiveData(String url) {
    return _$fetchLiveDataAsyncAction.run(() => super.fetchLiveData(url));
  }

  final _$fetchSecretLiveAsyncAction =
      AsyncAction('LiveStoreMobx.fetchSecretLive');

  @override
  Future<dynamic> fetchSecretLive(String key) {
    return _$fetchSecretLiveAsyncAction.run(() => super.fetchSecretLive(key));
  }

  final _$LiveStoreMobxActionController =
      ActionController(name: 'LiveStoreMobx');

  @override
  void resetData() {
    final _$actionInfo = _$LiveStoreMobxActionController.startAction(
        name: 'LiveStoreMobx.resetData');
    try {
      return super.resetData();
    } finally {
      _$LiveStoreMobxActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
isPass: ${isPass},
isAllLoading: ${isAllLoading},
isItemLoading: ${isItemLoading},
livesObj: ${livesObj},
lives: ${lives},
liveItem: ${liveItem},
live: ${live}
    ''';
  }
}
