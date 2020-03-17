import 'dart:convert';

import 'package:dandu_provider/framework/base_viewmodel.dart';
import 'package:dandu_provider/model/home_article.dart';
import 'package:dandu_provider/model/home_data.dart';
import 'package:dandu_provider/widget/dialog/loading_manager.dart';
import 'package:flutter/material.dart';

class HomeViewModel extends BaseViewModel with ChangeNotifier {
  final LoadingManager _manager = LoadingManager();
  List<HomeData> data = [];


  void showLoading(BuildContext context) {
    _manager.showLoading(context);
  }

  void hideLoading(BuildContext context) {
    _manager.hideLoading(context);
  }
  
  @override
  void loadData(BuildContext context) async {

  }

  void requestData(BuildContext context, Function fun) async {
    await Future.delayed(Duration(milliseconds: 100), () {
      showLoading(context);
    }).then((_) => DefaultAssetBundle.of(context).loadString("json/HomeData.json")
    ).then((String val) => HomeArticle.fromJson(json.decode(val))
    ).then((HomeArticle model) {
      data = model.datas ;
      notifyListeners();
      hideLoading(context);
    });
//    var str = await DefaultAssetBundle.of(context).loadString("json/HomeData.json");
//    var model = HomeArticle.fromJson(json.decode(str));
//    data = model.datas ;
//    notifyListeners();
//    fun();
  }

}