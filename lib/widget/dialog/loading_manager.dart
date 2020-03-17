
import 'package:dandu_provider/widget/dialog/loading_dialog.dart';
import 'package:flutter/material.dart';


class LoadingManager {
  LoadingDialog _dialog;

  /// 显示加载弹窗
  void showLoading(BuildContext context, {String msg = "玩命加载中..."}) {
    if (_dialog == null) {
      _dialog = LoadingDialog(text: msg);
    }
    showDialog(
        context: context,
        child: _dialog
    );
  }

  /// 隐藏加载弹窗
  void hideLoading(BuildContext context) {
    if(_dialog != null) {
      Navigator.pop(context);
    }
  }
}
