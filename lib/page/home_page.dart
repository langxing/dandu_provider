import 'package:dandu_provider/model/home_data.dart';
import 'package:dandu_provider/provider/home_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  final PageController controller;

  HomePage({Key key, this.controller}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return HomeState();
  }

}

class HomeState extends State<HomePage> {

  @override
  void initState() {
    super.initState();

  }

  @override
  Widget build(BuildContext context) {
    return Consumer<HomeProvider>(
      builder: (_, provider, child) {
        provider.getObject(context);
        return Stack(
        children: <Widget>[
          ListView.builder(
            itemCount: provider.data.length,
            itemBuilder: (context, index) {
              HomeData data = provider.data[index];
              return Text(data.name, style: TextStyle(color: Colors.red, fontSize: 15),);
            })
        ],
      );
      }
    );
  }

}