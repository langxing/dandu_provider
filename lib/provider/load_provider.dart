import 'package:dandu_provider/model/base_response.dart';
import 'package:flutter/material.dart';

class LoadProvider<T> with ChangeNotifier {

  Future<T> getObject(BuildContext context, String data) async{
    var str = await DefaultAssetBundle.of(context).loadString(data);

  }
}