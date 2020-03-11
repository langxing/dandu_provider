import 'package:dandu_provider/model/base_response.dart';
import 'package:dandu_provider/model/home_article.dart';

class HomeResponse extends BaseResponse {

  HomeResponse({code, datas, msg, status});

  factory HomeResponse.fromJson(Map<String, dynamic> json) {
    return HomeResponse(
      code: json['code'],
      datas: json['datas'] != null ? (json['datas'] as List).map((i) => HomeArticle.fromJson(i)).toList() : null,
      msg: json['msg'],
      status: json['status'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['code'] = this.code;
    data['msg'] = this.msg;
    data['status'] = this.status;
    if (this.datas != null) {
      data['datas'] = this.datas.map((v) => v.toJson()).toList();
    }
    return data;
  }
}