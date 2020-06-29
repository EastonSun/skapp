// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'classify.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$ClassifyStore on ClassifyStoreMobx, Store {
  final _$isLoadingAtom = Atom(name: 'ClassifyStoreMobx.isLoading');

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

  final _$isVodLoadingAtom = Atom(name: 'ClassifyStoreMobx.isVodLoading');

  @override
  bool get isVodLoading {
    _$isVodLoadingAtom.reportRead();
    return super.isVodLoading;
  }

  @override
  set isVodLoading(bool value) {
    _$isVodLoadingAtom.reportWrite(value, super.isVodLoading, () {
      super.isVodLoading = value;
    });
  }

  final _$typeAtom = Atom(name: 'ClassifyStoreMobx.type');

  @override
  ClassifyTypeDao get type {
    _$typeAtom.reportRead();
    return super.type;
  }

  @override
  set type(ClassifyTypeDao value) {
    _$typeAtom.reportWrite(value, super.type, () {
      super.type = value;
    });
  }

  final _$vodDataAtom = Atom(name: 'ClassifyStoreMobx.vodData');

  @override
  VodListDao get vodData {
    _$vodDataAtom.reportRead();
    return super.vodData;
  }

  @override
  set vodData(VodListDao value) {
    _$vodDataAtom.reportWrite(value, super.vodData, () {
      super.vodData = value;
    });
  }

  final _$hasNextPageAtom = Atom(name: 'ClassifyStoreMobx.hasNextPage');

  @override
  bool get hasNextPage {
    _$hasNextPageAtom.reportRead();
    return super.hasNextPage;
  }

  @override
  set hasNextPage(bool value) {
    _$hasNextPageAtom.reportWrite(value, super.hasNextPage, () {
      super.hasNextPage = value;
    });
  }

  final _$vodDataListsAtom = Atom(name: 'ClassifyStoreMobx.vodDataLists');

  @override
  ObservableList<dynamic> get vodDataLists {
    _$vodDataListsAtom.reportRead();
    return super.vodDataLists;
  }

  @override
  set vodDataLists(ObservableList<dynamic> value) {
    _$vodDataListsAtom.reportWrite(value, super.vodDataLists, () {
      super.vodDataLists = value;
    });
  }

  final _$qPageAtom = Atom(name: 'ClassifyStoreMobx.qPage');

  @override
  num get qPage {
    _$qPageAtom.reportRead();
    return super.qPage;
  }

  @override
  set qPage(num value) {
    _$qPageAtom.reportWrite(value, super.qPage, () {
      super.qPage = value;
    });
  }

  final _$qLimitAtom = Atom(name: 'ClassifyStoreMobx.qLimit');

  @override
  num get qLimit {
    _$qLimitAtom.reportRead();
    return super.qLimit;
  }

  @override
  set qLimit(num value) {
    _$qLimitAtom.reportWrite(value, super.qLimit, () {
      super.qLimit = value;
    });
  }

  final _$qTypeAtom = Atom(name: 'ClassifyStoreMobx.qType');

  @override
  String get qType {
    _$qTypeAtom.reportRead();
    return super.qType;
  }

  @override
  set qType(String value) {
    _$qTypeAtom.reportWrite(value, super.qType, () {
      super.qType = value;
    });
  }

  final _$fetchTypeDataAsyncAction =
      AsyncAction('ClassifyStoreMobx.fetchTypeData');

  @override
  Future<dynamic> fetchTypeData({@required dynamic typeId}) {
    return _$fetchTypeDataAsyncAction
        .run(() => super.fetchTypeData(typeId: typeId));
  }

  final _$fetchVodDataAsyncAction =
      AsyncAction('ClassifyStoreMobx.fetchVodData');

  @override
  Future<dynamic> fetchVodData({@required dynamic typeId}) {
    return _$fetchVodDataAsyncAction
        .run(() => super.fetchVodData(typeId: typeId));
  }

  final _$ClassifyStoreMobxActionController =
      ActionController(name: 'ClassifyStoreMobx');

  @override
  void changeQuery({dynamic page, dynamic limit = 10, dynamic type = 'hot'}) {
    final _$actionInfo = _$ClassifyStoreMobxActionController.startAction(
        name: 'ClassifyStoreMobx.changeQuery');
    try {
      return super.changeQuery(page: page, limit: limit, type: type);
    } finally {
      _$ClassifyStoreMobxActionController.endAction(_$actionInfo);
    }
  }

  @override
  void changeLoading() {
    final _$actionInfo = _$ClassifyStoreMobxActionController.startAction(
        name: 'ClassifyStoreMobx.changeLoading');
    try {
      return super.changeLoading();
    } finally {
      _$ClassifyStoreMobxActionController.endAction(_$actionInfo);
    }
  }

  @override
  void changeVodLoading() {
    final _$actionInfo = _$ClassifyStoreMobxActionController.startAction(
        name: 'ClassifyStoreMobx.changeVodLoading');
    try {
      return super.changeVodLoading();
    } finally {
      _$ClassifyStoreMobxActionController.endAction(_$actionInfo);
    }
  }

  @override
  void resetData() {
    final _$actionInfo = _$ClassifyStoreMobxActionController.startAction(
        name: 'ClassifyStoreMobx.resetData');
    try {
      return super.resetData();
    } finally {
      _$ClassifyStoreMobxActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
isLoading: ${isLoading},
isVodLoading: ${isVodLoading},
type: ${type},
vodData: ${vodData},
hasNextPage: ${hasNextPage},
vodDataLists: ${vodDataLists},
qPage: ${qPage},
qLimit: ${qLimit},
qType: ${qType}
    ''';
  }
}
