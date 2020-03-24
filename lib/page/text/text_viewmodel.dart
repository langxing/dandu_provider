
import 'dart:convert';

import 'package:dandu_provider/common/constants.dart';
import 'package:dandu_provider/framework/base_viewmodel.dart';
import 'package:dandu_provider/model/X.dart';
import 'package:dandu_provider/model/text_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';

class TextViewModel extends BaseViewModel {
  List<X> _data = List();

  List<X> get data => _data;

  @override
  void loadData(BuildContext context) async {
    await Future.delayed(
        Duration(milliseconds: 100)
    ).then((_) {
      updatePageState(PageState.STATE_LOADING);
    }).then((_)  {
      return DefaultAssetBundle.of(context).loadString("json/CharacterData.json");
    }).then((val) {
      return TextModel.fromJson(json.decode(val));
    }).then((val) {
      _data = val.datas.list;
      notifyListeners();
      updatePageState(PageState.STATE_NOMAL);
    });
  }

}