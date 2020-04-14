// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'live.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$LiveStore on LiveStoreMobx, Store {
  final _$isAllLoadingAtom = Atom(name: 'LiveStoreMobx.isAllLoading');

  @override
  bool get isAllLoading {
    _$isAllLoadingAtom.context.enforceReadPolicy(_$isAllLoadingAtom);
    _$isAllLoadingAtom.reportObserved();
    return super.isAllLoading;
  }

  @override
  set isAllLoading(bool value) {
    _$isAllLoadingAtom.context.conditionallyRunInAction(() {
      super.isAllLoading = value;
      _$isAllLoadingAtom.reportChanged();
    }, _$isAllLoadingAtom, name: '${_$isAllLoadingAtom.name}_set');
  }

  final _$isItemLoadingAtom = Atom(name: 'LiveStoreMobx.isItemLoading');

  @override
  bool get isItemLoading {
    _$isItemLoadingAtom.context.enforceReadPolicy(_$isItemLoadingAtom);
    _$isItemLoadingAtom.reportObserved();
    return super.isItemLoading;
  }

  @override
  set isItemLoading(bool value) {
    _$isItemLoadingAtom.context.conditionallyRunInAction(() {
      super.isItemLoading = value;
      _$isItemLoadingAtom.reportChanged();
    }, _$isItemLoadingAtom, name: '${_$isItemLoadingAtom.name}_set');
  }

  final _$livesObjAtom = Atom(name: 'LiveStoreMobx.livesObj');

  @override
  LiveAllDao get livesObj {
    _$livesObjAtom.context.enforceReadPolicy(_$livesObjAtom);
    _$livesObjAtom.reportObserved();
    return super.livesObj;
  }

  @override
  set livesObj(LiveAllDao value) {
    _$livesObjAtom.context.conditionallyRunInAction(() {
      super.livesObj = value;
      _$livesObjAtom.reportChanged();
    }, _$livesObjAtom, name: '${_$livesObjAtom.name}_set');
  }

  final _$livesAtom = Atom(name: 'LiveStoreMobx.lives');

  @override
  ObservableList<dynamic> get lives {
    _$livesAtom.context.enforceReadPolicy(_$livesAtom);
    _$livesAtom.reportObserved();
    return super.lives;
  }

  @override
  set lives(ObservableList<dynamic> value) {
    _$livesAtom.context.conditionallyRunInAction(() {
      super.lives = value;
      _$livesAtom.reportChanged();
    }, _$livesAtom, name: '${_$livesAtom.name}_set');
  }

  final _$liveItemAtom = Atom(name: 'LiveStoreMobx.liveItem');

  @override
  LiveItemDao get liveItem {
    _$liveItemAtom.context.enforceReadPolicy(_$liveItemAtom);
    _$liveItemAtom.reportObserved();
    return super.liveItem;
  }

  @override
  set liveItem(LiveItemDao value) {
    _$liveItemAtom.context.conditionallyRunInAction(() {
      super.liveItem = value;
      _$liveItemAtom.reportChanged();
    }, _$liveItemAtom, name: '${_$liveItemAtom.name}_set');
  }

  final _$liveAtom = Atom(name: 'LiveStoreMobx.live');

  @override
  ObservableList<dynamic> get live {
    _$liveAtom.context.enforceReadPolicy(_$liveAtom);
    _$liveAtom.reportObserved();
    return super.live;
  }

  @override
  set live(ObservableList<dynamic> value) {
    _$liveAtom.context.conditionallyRunInAction(() {
      super.live = value;
      _$liveAtom.reportChanged();
    }, _$liveAtom, name: '${_$liveAtom.name}_set');
  }

  final _$fetchLivesDataAsyncAction = AsyncAction('fetchLivesData');

  @override
  Future<dynamic> fetchLivesData() {
    return _$fetchLivesDataAsyncAction.run(() => super.fetchLivesData());
  }

  final _$fetchLiveDataAsyncAction = AsyncAction('fetchLiveData');

  @override
  Future<dynamic> fetchLiveData(String url) {
    return _$fetchLiveDataAsyncAction.run(() => super.fetchLiveData(url));
  }

  final _$LiveStoreMobxActionController =
      ActionController(name: 'LiveStoreMobx');

  @override
  void resetData() {
    final _$actionInfo = _$LiveStoreMobxActionController.startAction();
    try {
      return super.resetData();
    } finally {
      _$LiveStoreMobxActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    final string =
        'isAllLoading: ${isAllLoading.toString()},isItemLoading: ${isItemLoading.toString()},livesObj: ${livesObj.toString()},lives: ${lives.toString()},liveItem: ${liveItem.toString()},live: ${live.toString()}';
    return '{$string}';
  }
}
