import 'package:dandu_provider/model/home_data.dart';
import 'package:dandu_provider/page/home/home_item_view.dart';
import 'package:dandu_provider/page/home/home_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  final PageController controller;

  HomePage({Key key, this.controller}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Builder(
        builder: (BuildContext context) => Stack(
          children: <Widget>[
            Consumer<HomeViewModel>(
                builder: (_, provider, child) {
                  //showLoading(context);
                  provider.requestData(context, () {
                    //hideLoading(context);
                  });
                  /// 之所以不用listview,是因为每一个item是充满屏幕的
                  return PageView.builder(
                      scrollDirection: Axis.vertical,
                      itemCount: provider.data.length,
                      itemBuilder: (context, index) {
                        HomeData _data = provider.data[index];
                        return HomeItemView(data: _data);
                      }
                  );
                }
            ),
          ],
        ),
      ),
    );
  }

}
