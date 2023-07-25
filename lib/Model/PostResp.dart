class PostResp {
  bool? success;

  PostResp({this.success});

  PostResp.fromJson(Map<String, dynamic> json) {
    success =bool.parse(json['success'].toString());
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['success'] = this.success;
    return data;
  }
}

class Pos {
  bool? success;

  Pos({this.success});

  Pos.fromJson(Map<String, dynamic> json) {
    success =bool.parse(json['success'].toString());
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['success'] = this.success;
    return data;
  }
}