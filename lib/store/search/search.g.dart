// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'search.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$SearchStore on SearchStoreMobx, Store {
  final _$isLoadingAtom = Atom(name: 'SearchStoreMobx.isLoading');

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

  final _$searchListsAtom = Atom(name: 'SearchStoreMobx.searchLists');

  @override
  ObservableList<dynamic> get searchLists {
    _$searchListsAtom.reportRead();
    return super.searchLists;
  }

  @override
  set searchLists(ObservableList<dynamic> value) {
    _$searchListsAtom.reportWrite(value, super.searchLists, () {
      super.searchLists = value;
    });
  }

  final _$fetchDataAsyncAction = AsyncAction('SearchStoreMobx.fetchData');

  @override
  Future<dynamic> fetchData(String keyword) {
    return _$fetchDataAsyncAction.run(() => super.fetchData(keyword));
  }

  final _$fetchMusicDataAsyncAction =
      AsyncAction('SearchStoreMobx.fetchMusicData');

  @override
  Future<dynamic> fetchMusicData(String keyword, String type) {
    return _$fetchMusicDataAsyncAction
        .run(() => super.fetchMusicData(keyword, type));
  }

  final _$SearchStoreMobxActionController =
      ActionController(name: 'SearchStoreMobx');

  @override
  void resetSearchList() {
    final _$actionInfo = _$SearchStoreMobxActionController.startAction(
        name: 'SearchStoreMobx.resetSearchList');
    try {
      return super.resetSearchList();
    } finally {
      _$SearchStoreMobxActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
isLoading: ${isLoading},
searchLists: ${searchLists}
    ''';
  }
}
