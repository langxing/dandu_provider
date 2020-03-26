
import 'package:dandu_provider/framework/base_viewmodel.dart';
import 'package:dandu_provider/framework/http/httpmanager.dart';
import 'package:dandu_provider/model/sound.dart';
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
        .mapToList(
        onSuccess: (response) {
          _data = response.map((val) => Sound.fromJson(val)).toList();
          notifyListeners();
          },
        onError: (code, msg) {
            print("code=$code;msg=$msg");
          }
        );
  }
}