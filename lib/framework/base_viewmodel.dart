import 'package:flutter/material.dart';
import 'package:dandu_provider/common/constants.dart';

abstract class BaseViewModel with ChangeNotifier {
  var _isInit = false;
  PageState _pageState;

  bool get isInit => _isInit;
  PageState get pageState => _pageState;

  @mustCallSuper
  void init(BuildContext context) {
    if(!_isInit) {
      _isInit = true;
      doInit(context);
    }
  }

  /// 初始化
  @protected
  void doInit(BuildContext context) {

  }

  /// 加载数据
  @protected
  void loadData(BuildContext context);

  /// 内存回收
  void dispose();

  void updatePageState(PageState pageState) {
    _pageState = pageState;
    notifyListeners();
  }
}