import 'package:dandu_provider/page/text/text_item_view.dart';
import 'package:dandu_provider/page/text/text_viewmodel.dart';
import 'package:dandu_provider/widget/content_view.dart';
import 'package:dandu_provider/widget/titlebar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:provider/provider.dart';

class TextPage extends StatelessWidget {

  void _onItemClick() {

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TitleBar("文字"),
      body: Consumer<TextViewModel>(
        builder: (context, provider, child) {
          provider.loadData(context);
          return Padding(
            padding: EdgeInsets.all(3.5),
            child: ContentView(
              StaggeredGridView.countBuilder(
                crossAxisCount: 2,
                mainAxisSpacing: 1,
                crossAxisSpacing: 1,
                itemCount: provider.data.length,
                itemBuilder: (context, index) {
                  return TextItemView(provider.data[index], onItemClick: _onItemClick,);
                },
                staggeredTileBuilder: (index) {
                  // 跨列
                  int count = index == 0 || index == provider.data.length - 1 ? 2:1;
                  return StaggeredTile.count(count, 1);
                },
              ),
              pageState: provider.pageState,
            ),
          );
        },
      ),
    );
  }

}