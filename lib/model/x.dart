
class X {
    String id;
    String sign;
    String thumbnail;
    String title;

    X({this.id, this.sign, this.thumbnail, this.title});

    factory X.fromJson(Map<String, dynamic> json) {
        return X(
            id: json['id'], 
            sign: json['sign'], 
            thumbnail: json['thumbnail'], 
            title: json['title'], 
        );
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> data = new Map<String, dynamic>();
        data['id'] = this.id;
        data['sign'] = this.sign;
        data['thumbnail'] = this.thumbnail;
        data['title'] = this.title;
        return data;
    }
}