class Constants {

  // 默认占位图
  static final String LOCAL_IMAGE = "image/icon_default.png";
  static final String LOCAL_BIG_IMAGE = "image/img_big.jpg";
}

enum PageState {
  /// 正常
  STATE_NOMAL,
  /// 数据为空
  STATE_EMPTY,
  /// 加载错误
  STATE_ERROE,
  /// 正在加载
  STATE_LOADING,
  /// 网络异常
  STATE_NETWORK_ERROR
}