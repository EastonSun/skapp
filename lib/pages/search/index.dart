import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:pk_skeleton/pk_skeleton.dart';
import 'package:provider/provider.dart';
import './../../widgets/custom_gridview_widget.dart';
import './../../store/root.dart';
import './../../widgets/search_text_field_widget.dart';
import './../../store/search/search.dart';

class Search extends StatefulWidget {
  @override
  _SearchState createState() => _SearchState();
}

class _SearchState extends State<Search> {
  final SearchStore store = SearchStore();
  final FocusNode focus = FocusNode();
  TextEditingController searchController = TextEditingController();

  search(value) {
    if (value.trim() != '') {
      store.resetSearchList();
      store.fetchData(value);
      focus.unfocus();
    }
  }

  renderAppBar() {
    return AppBar(
      elevation: 1,
      title: Container(
        child: Row(
          children: <Widget>[
            Expanded(
              child: SearchTextFieldWidget(
                controller: searchController,
                focus: focus,
                hintText: '输入影片名称',
                margin: EdgeInsets.only(left: 0.0, right: 0.0),
                onSubmitted: (value) {
                  search(value);
                },
              ),
            ),
            GestureDetector(
              onTap: () {
                search(searchController.text);
              },
              child: Padding(
                padding: EdgeInsets.only(left: 10),
                child: Text(
                  '搜索',
                  style: Theme.of(context).textTheme.body2,
                ),
              ),
            )
          ],
        ),
        alignment: Alignment(0.0, 0.0),
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
                  CustomGridView(store.searchLists),
                ],
              ));
  }

  @override
  Widget build(BuildContext context) {
    final Global _global = Provider.of<Global>(context);
    return Scaffold(
      appBar: renderAppBar(),
      body: SafeArea(
        child: renderResult(_global),
      ), // https://www.jianshu.com/p/86d29a939624
    );
  }
}
