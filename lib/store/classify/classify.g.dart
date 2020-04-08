// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'classify.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$ClassifyStore on ClassifyStoreMobx, Store {
  final _$isLoadingAtom = Atom(name: 'ClassifyStoreMobx.isLoading');

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

  final _$isVodLoadingAtom = Atom(name: 'ClassifyStoreMobx.isVodLoading');

  @override
  bool get isVodLoading {
    _$isVodLoadingAtom.context.enforceReadPolicy(_$isVodLoadingAtom);
    _$isVodLoadingAtom.reportObserved();
    return super.isVodLoading;
  }

  @override
  set isVodLoading(bool value) {
    _$isVodLoadingAtom.context.conditionallyRunInAction(() {
      super.isVodLoading = value;
      _$isVodLoadingAtom.reportChanged();
    }, _$isVodLoadingAtom, name: '${_$isVodLoadingAtom.name}_set');
  }

  final _$typeAtom = Atom(name: 'ClassifyStoreMobx.type');

  @override
  ClassifyTypeDao get type {
    _$typeAtom.context.enforceReadPolicy(_$typeAtom);
    _$typeAtom.reportObserved();
    return super.type;
  }

  @override
  set type(ClassifyTypeDao value) {
    _$typeAtom.context.conditionallyRunInAction(() {
      super.type = value;
      _$typeAtom.reportChanged();
    }, _$typeAtom, name: '${_$typeAtom.name}_set');
  }

  final _$vodDataAtom = Atom(name: 'ClassifyStoreMobx.vodData');

  @override
  VodListDao get vodData {
    _$vodDataAtom.context.enforceReadPolicy(_$vodDataAtom);
    _$vodDataAtom.reportObserved();
    return super.vodData;
  }

  @override
  set vodData(VodListDao value) {
    _$vodDataAtom.context.conditionallyRunInAction(() {
      super.vodData = value;
      _$vodDataAtom.reportChanged();
    }, _$vodDataAtom, name: '${_$vodDataAtom.name}_set');
  }

  final _$qPageAtom = Atom(name: 'ClassifyStoreMobx.qPage');

  @override
  num get qPage {
    _$qPageAtom.context.enforceReadPolicy(_$qPageAtom);
    _$qPageAtom.reportObserved();
    return super.qPage;
  }

  @override
  set qPage(num value) {
    _$qPageAtom.context.conditionallyRunInAction(() {
      super.qPage = value;
      _$qPageAtom.reportChanged();
    }, _$qPageAtom, name: '${_$qPageAtom.name}_set');
  }

  final _$qLimitAtom = Atom(name: 'ClassifyStoreMobx.qLimit');

  @override
  num get qLimit {
    _$qLimitAtom.context.enforceReadPolicy(_$qLimitAtom);
    _$qLimitAtom.reportObserved();
    return super.qLimit;
  }

  @override
  set qLimit(num value) {
    _$qLimitAtom.context.conditionallyRunInAction(() {
      super.qLimit = value;
      _$qLimitAtom.reportChanged();
    }, _$qLimitAtom, name: '${_$qLimitAtom.name}_set');
  }

  final _$qTypeAtom = Atom(name: 'ClassifyStoreMobx.qType');

  @override
  String get qType {
    _$qTypeAtom.context.enforceReadPolicy(_$qTypeAtom);
    _$qTypeAtom.reportObserved();
    return super.qType;
  }

  @override
  set qType(String value) {
    _$qTypeAtom.context.conditionallyRunInAction(() {
      super.qType = value;
      _$qTypeAtom.reportChanged();
    }, _$qTypeAtom, name: '${_$qTypeAtom.name}_set');
  }

  final _$fetchTypeDataAsyncAction = AsyncAction('fetchTypeData');

  @override
  Future<dynamic> fetchTypeData({@required dynamic typeId}) {
    return _$fetchTypeDataAsyncAction
        .run(() => super.fetchTypeData(typeId: typeId));
  }

  final _$fetchVodDataAsyncAction = AsyncAction('fetchVodData');

  @override
  Future<dynamic> fetchVodData({@required dynamic typeId}) {
    return _$fetchVodDataAsyncAction
        .run(() => super.fetchVodData(typeId: typeId));
  }

  final _$ClassifyStoreMobxActionController =
      ActionController(name: 'ClassifyStoreMobx');

  @override
  void changeQuery({dynamic page, dynamic limit = 10, dynamic type = 'hot'}) {
    final _$actionInfo = _$ClassifyStoreMobxActionController.startAction();
    try {
      return super.changeQuery(page: page, limit: limit, type: type);
    } finally {
      _$ClassifyStoreMobxActionController.endAction(_$actionInfo);
    }
  }

  @override
  void changeLoading() {
    final _$actionInfo = _$ClassifyStoreMobxActionController.startAction();
    try {
      return super.changeLoading();
    } finally {
      _$ClassifyStoreMobxActionController.endAction(_$actionInfo);
    }
  }

  @override
  void changeVodLoading() {
    final _$actionInfo = _$ClassifyStoreMobxActionController.startAction();
    try {
      return super.changeVodLoading();
    } finally {
      _$ClassifyStoreMobxActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    final string =
        'isLoading: ${isLoading.toString()},isVodLoading: ${isVodLoading.toString()},type: ${type.toString()},vodData: ${vodData.toString()},qPage: ${qPage.toString()},qLimit: ${qLimit.toString()},qType: ${qType.toString()}';
    return '{$string}';
  }
}
