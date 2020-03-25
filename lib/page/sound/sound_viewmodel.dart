
import 'package:dandu_provider/framework/base_viewmodel.dart';
import 'package:dandu_provider/framework/http/httpmanager.dart';
import 'package:dandu_provider/model/baseresponse.dart';
import 'package:dandu_provider/model/sound.dart';
import 'package:dio/dio.dart';
import 'package:flutter/src/widgets/framework.dart';

class SoundViewModel extends BaseViewModel {
  List<Sound> _data = [];

  List<Sound> get data => _data;

  @override
  void doInit(BuildContext context) {
    super.doInit(context);
    loadData(context);
  }
  
  void loadData(BuildContext context, {bool showLoading = false}) async {
    HttpManager.getInstance().get("/?c=api&a=getList&p=1&model=3&page_id=0&create_time=0&client=android&version=1.3.0&time=1585128061&show_sdv=1")
        .mapToList()
        .complete(
        onSuccess: (response)  {
          List<dynamic> list = response as List;
          _data = list.map((val) => Sound.fromJson(val)).toList();
          notifyListeners();
          },
        onError: (code, msg) {
            print("code=$code;msg=$msg");
          }
        );

//     String url = "http://static.owspace.com/?c=api&a=getList&p=1&model=3&page_id=0&create_time=0&client=android&version=1.3.0&time=1585128061&show_sdv=1";
//     Dio dio = Dio();
//     Response response = await dio.get(url);
//     BaseResponse baseResponse = BaseResponse.fromJsonList(response.data);
//     _data = baseResponse.list.map((data) => Sound.fromJson(data)).toList();
//     print("title = ${_data[0].title}");
//     notifyListeners();
  }
}