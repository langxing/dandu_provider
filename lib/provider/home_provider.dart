import 'dart:convert';

import 'package:dandu_provider/model/home_article.dart';
import 'package:dandu_provider/model/home_data.dart';
import 'package:flutter/material.dart';

class HomeProvider with ChangeNotifier {
  List<HomeData> data = [];

  void getObject(BuildContext context) async{
    var str = await DefaultAssetBundle.of(context).loadString("json/HomeData.json");
    var model = HomeArticle.fromJson(json.decode(str));
    data = model.datas ;
    notifyListeners();
  }
}