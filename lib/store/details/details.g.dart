// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'details.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$DetailsStore on DetailsStoreMobx, Store {
  Computed<String> _$currentUrlComputed;

  @override
  String get currentUrl =>
      (_$currentUrlComputed ??= Computed<String>(() => super.currentUrl)).value;

  final _$isLoadingAtom = Atom(name: 'DetailsStoreMobx.isLoading');

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

  final _$vodIdAtom = Atom(name: 'DetailsStoreMobx.vodId');

  @override
  String get vodId {
    _$vodIdAtom.context.enforceReadPolicy(_$vodIdAtom);
    _$vodIdAtom.reportObserved();
    return super.vodId;
  }

  @override
  set vodId(String value) {
    _$vodIdAtom.context.conditionallyRunInAction(() {
      super.vodId = value;
      _$vodIdAtom.reportChanged();
    }, _$vodIdAtom, name: '${_$vodIdAtom.name}_set');
  }

  final _$vodAtom = Atom(name: 'DetailsStoreMobx.vod');

  @override
  VodDao get vod {
    _$vodAtom.context.enforceReadPolicy(_$vodAtom);
    _$vodAtom.reportObserved();
    return super.vod;
  }

  @override
  set vod(VodDao value) {
    _$vodAtom.context.conditionallyRunInAction(() {
      super.vod = value;
      _$vodAtom.reportChanged();
    }, _$vodAtom, name: '${_$vodAtom.name}_set');
  }

  final _$playersAtom = Atom(name: 'DetailsStoreMobx.players');

  @override
  ObservableList<dynamic> get players {
    _$playersAtom.context.enforceReadPolicy(_$playersAtom);
    _$playersAtom.reportObserved();
    return super.players;
  }

  @override
  set players(ObservableList<dynamic> value) {
    _$playersAtom.context.conditionallyRunInAction(() {
      super.players = value;
      _$playersAtom.reportChanged();
    }, _$playersAtom, name: '${_$playersAtom.name}_set');
  }

  final _$pTabsAtom = Atom(name: 'DetailsStoreMobx.pTabs');

  @override
  ObservableList<dynamic> get pTabs {
    _$pTabsAtom.context.enforceReadPolicy(_$pTabsAtom);
    _$pTabsAtom.reportObserved();
    return super.pTabs;
  }

  @override
  set pTabs(ObservableList<dynamic> value) {
    _$pTabsAtom.context.conditionallyRunInAction(() {
      super.pTabs = value;
      _$pTabsAtom.reportChanged();
    }, _$pTabsAtom, name: '${_$pTabsAtom.name}_set');
  }

  final _$currentTabsAtom = Atom(name: 'DetailsStoreMobx.currentTabs');

  @override
  int get currentTabs {
    _$currentTabsAtom.context.enforceReadPolicy(_$currentTabsAtom);
    _$currentTabsAtom.reportObserved();
    return super.currentTabs;
  }

  @override
  set currentTabs(int value) {
    _$currentTabsAtom.context.conditionallyRunInAction(() {
      super.currentTabs = value;
      _$currentTabsAtom.reportChanged();
    }, _$currentTabsAtom, name: '${_$currentTabsAtom.name}_set');
  }

  final _$currentPlayersAtom = Atom(name: 'DetailsStoreMobx.currentPlayers');

  @override
  int get currentPlayers {
    _$currentPlayersAtom.context.enforceReadPolicy(_$currentPlayersAtom);
    _$currentPlayersAtom.reportObserved();
    return super.currentPlayers;
  }

  @override
  set currentPlayers(int value) {
    _$currentPlayersAtom.context.conditionallyRunInAction(() {
      super.currentPlayers = value;
      _$currentPlayersAtom.reportChanged();
    }, _$currentPlayersAtom, name: '${_$currentPlayersAtom.name}_set');
  }

  final _$isClickPlayersAtom = Atom(name: 'DetailsStoreMobx.isClickPlayers');

  @override
  bool get isClickPlayers {
    _$isClickPlayersAtom.context.enforceReadPolicy(_$isClickPlayersAtom);
    _$isClickPlayersAtom.reportObserved();
    return super.isClickPlayers;
  }

  @override
  set isClickPlayers(bool value) {
    _$isClickPlayersAtom.context.conditionallyRunInAction(() {
      super.isClickPlayers = value;
      _$isClickPlayersAtom.reportChanged();
    }, _$isClickPlayersAtom, name: '${_$isClickPlayersAtom.name}_set');
  }

  final _$fetchVodDataAsyncAction = AsyncAction('fetchVodData');

  @override
  Future<dynamic> fetchVodData() {
    return _$fetchVodDataAsyncAction.run(() => super.fetchVodData());
  }

  final _$DetailsStoreMobxActionController =
      ActionController(name: 'DetailsStoreMobx');

  @override
  void formatPD(String vodPlayUrl) {
    final _$actionInfo = _$DetailsStoreMobxActionController.startAction();
    try {
      return super.formatPD(vodPlayUrl);
    } finally {
      _$DetailsStoreMobxActionController.endAction(_$actionInfo);
    }
  }

  @override
  void formatPDTbas(String vodPlayFrom) {
    final _$actionInfo = _$DetailsStoreMobxActionController.startAction();
    try {
      return super.formatPDTbas(vodPlayFrom);
    } finally {
      _$DetailsStoreMobxActionController.endAction(_$actionInfo);
    }
  }

  @override
  void changeVodId(String vodId) {
    final _$actionInfo = _$DetailsStoreMobxActionController.startAction();
    try {
      return super.changeVodId(vodId);
    } finally {
      _$DetailsStoreMobxActionController.endAction(_$actionInfo);
    }
  }

  @override
  void changeCurrentTabs(int current) {
    final _$actionInfo = _$DetailsStoreMobxActionController.startAction();
    try {
      return super.changeCurrentTabs(current);
    } finally {
      _$DetailsStoreMobxActionController.endAction(_$actionInfo);
    }
  }

  @override
  void changeCurrentPlayers(int current) {
    final _$actionInfo = _$DetailsStoreMobxActionController.startAction();
    try {
      return super.changeCurrentPlayers(current);
    } finally {
      _$DetailsStoreMobxActionController.endAction(_$actionInfo);
    }
  }

  @override
  void changeIsClickPlayers() {
    final _$actionInfo = _$DetailsStoreMobxActionController.startAction();
    try {
      return super.changeIsClickPlayers();
    } finally {
      _$DetailsStoreMobxActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    final string =
        'isLoading: ${isLoading.toString()},vodId: ${vodId.toString()},vod: ${vod.toString()},players: ${players.toString()},pTabs: ${pTabs.toString()},currentTabs: ${currentTabs.toString()},currentPlayers: ${currentPlayers.toString()},isClickPlayers: ${isClickPlayers.toString()},currentUrl: ${currentUrl.toString()}';
    return '{$string}';
  }
}
