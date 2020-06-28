// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'details.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$DetailsStore on DetailsStoreMobx, Store {
  Computed<String> _$currentUrlComputed;

  @override
  String get currentUrl =>
      (_$currentUrlComputed ??= Computed<String>(() => super.currentUrl,
              name: 'DetailsStoreMobx.currentUrl'))
          .value;

  final _$isLoadingAtom = Atom(name: 'DetailsStoreMobx.isLoading');

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

  final _$vodIdAtom = Atom(name: 'DetailsStoreMobx.vodId');

  @override
  String get vodId {
    _$vodIdAtom.reportRead();
    return super.vodId;
  }

  @override
  set vodId(String value) {
    _$vodIdAtom.reportWrite(value, super.vodId, () {
      super.vodId = value;
    });
  }

  final _$vodAtom = Atom(name: 'DetailsStoreMobx.vod');

  @override
  VodDao get vod {
    _$vodAtom.reportRead();
    return super.vod;
  }

  @override
  set vod(VodDao value) {
    _$vodAtom.reportWrite(value, super.vod, () {
      super.vod = value;
    });
  }

  final _$playersAtom = Atom(name: 'DetailsStoreMobx.players');

  @override
  ObservableList<dynamic> get players {
    _$playersAtom.reportRead();
    return super.players;
  }

  @override
  set players(ObservableList<dynamic> value) {
    _$playersAtom.reportWrite(value, super.players, () {
      super.players = value;
    });
  }

  final _$pTabsAtom = Atom(name: 'DetailsStoreMobx.pTabs');

  @override
  ObservableList<dynamic> get pTabs {
    _$pTabsAtom.reportRead();
    return super.pTabs;
  }

  @override
  set pTabs(ObservableList<dynamic> value) {
    _$pTabsAtom.reportWrite(value, super.pTabs, () {
      super.pTabs = value;
    });
  }

  final _$currentTabsAtom = Atom(name: 'DetailsStoreMobx.currentTabs');

  @override
  int get currentTabs {
    _$currentTabsAtom.reportRead();
    return super.currentTabs;
  }

  @override
  set currentTabs(int value) {
    _$currentTabsAtom.reportWrite(value, super.currentTabs, () {
      super.currentTabs = value;
    });
  }

  final _$currentPlayersAtom = Atom(name: 'DetailsStoreMobx.currentPlayers');

  @override
  int get currentPlayers {
    _$currentPlayersAtom.reportRead();
    return super.currentPlayers;
  }

  @override
  set currentPlayers(int value) {
    _$currentPlayersAtom.reportWrite(value, super.currentPlayers, () {
      super.currentPlayers = value;
    });
  }

  final _$isClickPlayersAtom = Atom(name: 'DetailsStoreMobx.isClickPlayers');

  @override
  bool get isClickPlayers {
    _$isClickPlayersAtom.reportRead();
    return super.isClickPlayers;
  }

  @override
  set isClickPlayers(bool value) {
    _$isClickPlayersAtom.reportWrite(value, super.isClickPlayers, () {
      super.isClickPlayers = value;
    });
  }

  final _$fetchVodDataAsyncAction =
      AsyncAction('DetailsStoreMobx.fetchVodData');

  @override
  Future<dynamic> fetchVodData() {
    return _$fetchVodDataAsyncAction.run(() => super.fetchVodData());
  }

  final _$DetailsStoreMobxActionController =
      ActionController(name: 'DetailsStoreMobx');

  @override
  void formatPD(String vodPlayUrl) {
    final _$actionInfo = _$DetailsStoreMobxActionController.startAction(
        name: 'DetailsStoreMobx.formatPD');
    try {
      return super.formatPD(vodPlayUrl);
    } finally {
      _$DetailsStoreMobxActionController.endAction(_$actionInfo);
    }
  }

  @override
  void formatPDTbas(String vodPlayFrom) {
    final _$actionInfo = _$DetailsStoreMobxActionController.startAction(
        name: 'DetailsStoreMobx.formatPDTbas');
    try {
      return super.formatPDTbas(vodPlayFrom);
    } finally {
      _$DetailsStoreMobxActionController.endAction(_$actionInfo);
    }
  }

  @override
  void changeVodId(String vodId) {
    final _$actionInfo = _$DetailsStoreMobxActionController.startAction(
        name: 'DetailsStoreMobx.changeVodId');
    try {
      return super.changeVodId(vodId);
    } finally {
      _$DetailsStoreMobxActionController.endAction(_$actionInfo);
    }
  }

  @override
  void changeCurrentTabs(int current) {
    final _$actionInfo = _$DetailsStoreMobxActionController.startAction(
        name: 'DetailsStoreMobx.changeCurrentTabs');
    try {
      return super.changeCurrentTabs(current);
    } finally {
      _$DetailsStoreMobxActionController.endAction(_$actionInfo);
    }
  }

  @override
  void changeCurrentPlayers(int current) {
    final _$actionInfo = _$DetailsStoreMobxActionController.startAction(
        name: 'DetailsStoreMobx.changeCurrentPlayers');
    try {
      return super.changeCurrentPlayers(current);
    } finally {
      _$DetailsStoreMobxActionController.endAction(_$actionInfo);
    }
  }

  @override
  void changeIsClickPlayers() {
    final _$actionInfo = _$DetailsStoreMobxActionController.startAction(
        name: 'DetailsStoreMobx.changeIsClickPlayers');
    try {
      return super.changeIsClickPlayers();
    } finally {
      _$DetailsStoreMobxActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
isLoading: ${isLoading},
vodId: ${vodId},
vod: ${vod},
players: ${players},
pTabs: ${pTabs},
currentTabs: ${currentTabs},
currentPlayers: ${currentPlayers},
isClickPlayers: ${isClickPlayers},
currentUrl: ${currentUrl}
    ''';
  }
}
