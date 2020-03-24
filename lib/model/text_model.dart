

import 'package:dandu_provider/model/Datas.dart';

class TextModel {
    int code;
    Datas datas;
    String msg;
    String status;

    TextModel({this.code, this.datas, this.msg, this.status});

    factory TextModel.fromJson(Map<String, dynamic> json) {
        return TextModel(
            code: json['code'], 
            datas: json['datas'] != null ? Datas.fromJson(json['datas']) : null, 
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
            data['datas'] = this.datas.toJson();
        }
        return data;
    }
}