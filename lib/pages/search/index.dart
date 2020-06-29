import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:pk_skeleton/pk_skeleton.dart';
import 'package:provider/provider.dart';
import './../../widgets/custom_gridview_widget.dart';
import './../../store/root.dart';
import './../../widgets/search_text_field_widget.dart';
import './../../store/search/search.dart';
import './../../store/type/type.dart';

class Search extends StatefulWidget {
  @override
  _SearchState createState() => _SearchState();
}

class _SearchState extends State<Search> {
  final SearchStore store = SearchStore();
  final Type typeStore = Type();
  final FocusNode focus = FocusNode();
  TextEditingController searchController = TextEditingController();

  search(value, _global) {
    if (value.trim() != '') {
      store.resetSearchList();
      if (_global.isMusic) {
        if (typeStore.type != null && typeStore.type.data.length > 0) {
          store.fetchMusicData(value,
              typeStore.type.data[typeStore.currentSearchTypeIndex].typeEn);
        }
      } else {
        store.fetchData(value);
      }

      focus.unfocus();
    }
  }

  Future<dynamic> requestAPI() async {
    await typeStore.fetchData();
  }

  @override
  void initState() {
    super.initState();
    requestAPI();
  }

  renderAppBar(_global) {
    return AppBar(
      elevation: 1,
      title: Observer(
        builder: (_) => Container(
          child: Row(
            children: <Widget>[
              Expanded(
                child: SearchTextFieldWidget(
                  controller: searchController,
                  focus: focus,
                  hintText: _global.isMusic ? '输入歌曲名称' : '输入电影名称',
                  margin: EdgeInsets.only(left: 0.0, right: 0.0),
                  onSubmitted: (value) {
                    search(value, _global);
                  },
                ),
              ),
              _global.isMusic &&
                      typeStore.type != null &&
                      typeStore.type.data.length > 0
                  ? Padding(
                      padding: EdgeInsets.only(left: 12),
                      child: DropdownButtonHideUnderline(
                        child: DropdownButton<String>(
                          value: typeStore.type
                              .data[typeStore.currentSearchTypeIndex].typeEn,
                          onChanged: (String newValue) {
                            int cur = 0;
                            for (int i = 0;
                                i < typeStore.type.data.length;
                                i++) {
                              if (typeStore.type.data[i].typeEn == newValue) {
                                cur = i;
                              }
                            }
                            typeStore.changeCurrentSearchTypeIndex(cur);
                          },
                          items: typeStore.type.data
                              .map<DropdownMenuItem<String>>((value) {
                            return DropdownMenuItem<String>(
                              value: value.typeEn,
                              child: Text(
                                value.typeName,
                                style: TextStyle(fontSize: 14),
                              ),
                            );
                          }).toList(),
                        ),
                      ),
                    )
                  : Container(),
              GestureDetector(
                onTap: () {
                  search(searchController.text, _global);
                },
                child: Padding(
                  padding: EdgeInsets.only(left: 10),
                  child: Text(
                    '搜索',
                    style: Theme.of(context).textTheme.bodyText2,
                  ),
                ),
              )
            ],
          ),
          alignment: Alignment(0.0, 0.0),
        ),
      ),
    );
  }

  renderResult(_global) {
    return Observer(
        builder: (_) => store.isLoading
            ? _global.isDark
                ? PKDarkCardListSkeleton(
                    isCircularImage: true,
                    isBottomLinesActive: true,
                  )
                : PKCardListSkeleton(
                    isCircularImage: true,
                    isBottomLinesActive: true,
                  )
            : ListView(
                children: <Widget>[
                  SizedBox(
                    height: 20,
                  ),
                  CustomGridView(store.searchLists, _global),
                ],
              ));
  }

  @override
  Widget build(BuildContext context) {
    final Global _global = Provider.of<Global>(context);
    return Scaffold(
      appBar: renderAppBar(_global),
      body: SafeArea(
        child: renderResult(_global),
      ), // https://www.jianshu.com/p/86d29a939624
    );
  }
}
