import 'package:dandu_provider/model/home_data.dart';
import 'package:dandu_provider/provider/home_viewmodel.dart';
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
            return Stack(
              children: <Widget>[
                ListView.builder(
                    itemCount: provider.data.length,
                    itemBuilder: (context, index) {
                      HomeData data = provider.data[index];
                      return Text(data.title, style: TextStyle(color: Colors.red, fontSize: 15),);
                    })
              ],
            );
          }
      ),
    );
  }

}
