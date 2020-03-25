
class BaseResponse<T> {

  int code;
  List<T> list;
  T data;
  String msg;
  String status;

  BaseResponse({this.code, this.list, this.data, this.msg, this.status});

  factory BaseResponse.fromJsonList(Map<String, dynamic> json) {
    return BaseResponse(
      code: json['code'],
      list: json['datas'] != null ? json['datas'] as List<T> : null,
      msg: json['msg'],
      status: json['status'],
    );
  }

  Map<String, dynamic> toJsonList() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['code'] = this.code;
    data['msg'] = this.msg;
    data['status'] = this.status;
    data['datas'] = this.list;
    return data;
  }

  factory BaseResponse.fromJsonObject(Map<String, dynamic> json) {
    return BaseResponse(
      code: json['code'],
      data: json['datas'],
      msg: json['msg'],
      status: json['status'],
    );
  }

  Map<String, dynamic> toJsonObject() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['code'] = this.code;
    data['msg'] = this.msg;
    data['status'] = this.status;
    data['datas'] = this.data;
    return data;
  }
}