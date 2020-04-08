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

  final _$fetchTypeDataAsyncAction = AsyncAction('fetchTypeData');

  @override
  Future<dynamic> fetchTypeData({@required dynamic typeId}) {
    return _$fetchTypeDataAsyncAction
        .run(() => super.fetchTypeData(typeId: typeId));
  }

  final _$ClassifyStoreMobxActionController =
      ActionController(name: 'ClassifyStoreMobx');

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
  String toString() {
    final string =
        'isLoading: ${isLoading.toString()},type: ${type.toString()}';
    return '{$string}';
  }
}
