package model

class Tag {
    String name;

    Tag({this.name});

    factory Tag.fromJson(Map<String, dynamic> json) {
        return Tag(
            name: json['name'], 
        );
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> data = new Map<String, dynamic>();
        data['name'] = this.name;
        return data;
    }
}