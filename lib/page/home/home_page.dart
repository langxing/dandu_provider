import 'package:dandu_provider/model/home_data.dart';
import 'package:dandu_provider/page/home/home_item_view.dart';
import 'package:dandu_provider/page/home/home_viewmodel.dart';
import 'package:dandu_provider/widget/content_view.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  final PageController controller;

  HomePage({Key key, this.controller}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Consumer<HomeViewModel>(
        builder: (_, provider, child) {
          provider.loadData(context);
          return ContentView(
            Stack(
              children: <Widget>[
                PageView.builder(
                    scrollDirection: Axis.vertical,
                    itemCount: provider.data.length,
                    itemBuilder: (context, index) {
                      HomeData _data = provider.data[index];
                      return HomeItemView(data: _data);
                    }
                ),
              ],
            ),
            pageState: provider.pageState,
          );
        },
      ),
    );
  }

}
