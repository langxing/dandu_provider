
abstract class BaseResponse<T> {
    int code;
    T datas;
    String msg;
    String status;

    BaseResponse({this.code, this.datas, this.msg, this.status});

    BaseResponse.fromJson(Map<String, dynamic> json);

    Map<String, dynamic> toJson();
}