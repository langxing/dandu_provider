import 'package:dandu_provider/page/text/text_item_view.dart';
import 'package:dandu_provider/page/text/text_viewmodel.dart';
import 'package:dandu_provider/widget/content_view.dart';
import 'package:dandu_provider/widget/titlebar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

class TextPage extends StatelessWidget {

  void _onItemClick() {

  }

  List<SingleChildWidget> initProvider() {
    return [
      ChangeNotifierProvider(create: (context) {
        TextViewModel _viewmodel = TextViewModel();
        _viewmodel.init(context);
        return _viewmodel;
      }),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: initProvider(),
      child: Scaffold(
        appBar: TitleBar("文字"),
        body: Consumer<TextViewModel>(
          builder: (context, provider, child) {
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
      ),
    );
  }

}