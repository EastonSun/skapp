// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'search.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$SearchStore on SearchStoreMobx, Store {
  final _$isLoadingAtom = Atom(name: 'SearchStoreMobx.isLoading');

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

  final _$searchListsAtom = Atom(name: 'SearchStoreMobx.searchLists');

  @override
  ObservableList<dynamic> get searchLists {
    _$searchListsAtom.context.enforceReadPolicy(_$searchListsAtom);
    _$searchListsAtom.reportObserved();
    return super.searchLists;
  }

  @override
  set searchLists(ObservableList<dynamic> value) {
    _$searchListsAtom.context.conditionallyRunInAction(() {
      super.searchLists = value;
      _$searchListsAtom.reportChanged();
    }, _$searchListsAtom, name: '${_$searchListsAtom.name}_set');
  }

  final _$fetchDataAsyncAction = AsyncAction('fetchData');

  @override
  Future<dynamic> fetchData(String keyword) {
    return _$fetchDataAsyncAction.run(() => super.fetchData(keyword));
  }

  final _$SearchStoreMobxActionController =
      ActionController(name: 'SearchStoreMobx');

  @override
  void resetSearchList() {
    final _$actionInfo = _$SearchStoreMobxActionController.startAction();
    try {
      return super.resetSearchList();
    } finally {
      _$SearchStoreMobxActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    final string =
        'isLoading: ${isLoading.toString()},searchLists: ${searchLists.toString()}';
    return '{$string}';
  }
}
