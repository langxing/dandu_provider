import 'package:dandu_provider/model/home_data.dart';
import 'package:dandu_provider/page/home/home_item_view.dart';
import 'package:dandu_provider/page/home/home_viewmodel.dart';
import 'package:dandu_provider/page/main.dart';
import 'package:dandu_provider/widget/content_view.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

class HomePage extends StatelessWidget {
  final PageController controller;

  HomePage({Key key, this.controller}) : super(key: key);

  List<SingleChildWidget> initProvider() {
    return [
      ChangeNotifierProvider(create: (context) {
        HomeViewModel _viewmodel = HomeViewModel();
        _viewmodel.init(context);
        return _viewmodel;
      })
    ];
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: initProvider(),
      child: Scaffold(
        body: Consumer<HomeViewModel>(
          builder: (_, provider, child) {
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
                  SizedBox(
                    height: 80,
                    child: AppBar(
                      backgroundColor: Colors.transparent,
                      leading: IconButton(
                          icon: Icon(
                            Icons.menu,
                            color: Colors.white,
                          ),
                          onPressed: () {
                            controller.animateToPage(
                                MainPage.PAGE_SETTING,
                                duration: Duration(milliseconds: 1500),
                                curve: ElasticOutCurve(2)
                            );
                          }),
                      title: Center(
                        child: Text(
                          "单读",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 15
                          ),
                        ),
                      ),
                      actions: <Widget>[
                        IconButton(
                            icon: Icon(
                              Icons.supervised_user_circle,
                              color: Colors.white,
                            ),
                            onPressed: () {
                              controller.animateToPage(
                                  MainPage.PAGE_MINE,
                                  duration: Duration(milliseconds: 1500),
                                  curve: ElasticOutCurve(2)
                              );
                            })
                      ],
                    ),
                  )
                ],
              ),
              pageState: provider.pageState,
            );
          },
        ),
      ),
    );
  }

}
