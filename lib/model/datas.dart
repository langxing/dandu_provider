

import 'package:dandu_provider/model/X.dart';

class Datas {
    List<X> list;
    int show_author;

    Datas({this.list, this.show_author});

    factory Datas.fromJson(Map<String, dynamic> json) {
        return Datas(
            list: json['list'] != null ? (json['list'] as List).map((i) => X.fromJson(i)).toList() : null, 
            show_author: json['show_author'], 
        );
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> data = new Map<String, dynamic>();
        data['show_author'] = this.show_author;
        if (this.list != null) {
            data['list'] = this.list.map((v) => v.toJson()).toList();
        }
        return data;
    }
}