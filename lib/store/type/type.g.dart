// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'type.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$Type on TypeMobx, Store {
  final _$isLoadingAtom = Atom(name: 'TypeMobx.isLoading');

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

  final _$typeAtom = Atom(name: 'TypeMobx.type');

  @override
  SkType get type {
    _$typeAtom.reportRead();
    return super.type;
  }

  @override
  set type(SkType value) {
    _$typeAtom.reportWrite(value, super.type, () {
      super.type = value;
    });
  }

  final _$currentSearchTypeIndexAtom =
      Atom(name: 'TypeMobx.currentSearchTypeIndex');

  @override
  int get currentSearchTypeIndex {
    _$currentSearchTypeIndexAtom.reportRead();
    return super.currentSearchTypeIndex;
  }

  @override
  set currentSearchTypeIndex(int value) {
    _$currentSearchTypeIndexAtom
        .reportWrite(value, super.currentSearchTypeIndex, () {
      super.currentSearchTypeIndex = value;
    });
  }

  final _$fetchDataAsyncAction = AsyncAction('TypeMobx.fetchData');

  @override
  Future<dynamic> fetchData() {
    return _$fetchDataAsyncAction.run(() => super.fetchData());
  }

  final _$TypeMobxActionController = ActionController(name: 'TypeMobx');

  @override
  void changeLoading() {
    final _$actionInfo =
        _$TypeMobxActionController.startAction(name: 'TypeMobx.changeLoading');
    try {
      return super.changeLoading();
    } finally {
      _$TypeMobxActionController.endAction(_$actionInfo);
    }
  }

  @override
  void changeCurrentSearchTypeIndex(int index) {
    final _$actionInfo = _$TypeMobxActionController.startAction(
        name: 'TypeMobx.changeCurrentSearchTypeIndex');
    try {
      return super.changeCurrentSearchTypeIndex(index);
    } finally {
      _$TypeMobxActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
isLoading: ${isLoading},
type: ${type},
currentSearchTypeIndex: ${currentSearchTypeIndex}
    ''';
  }
}
