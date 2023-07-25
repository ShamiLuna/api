class Dodu {
  String? message;
  String? status;

  Dodu({this.message, this.status});

  Dodu.fromJson(Map<String, dynamic> json) {
    message = json['message'].toString();
    status = json['status'].toString();
  }

  // Map<String, dynamic> toJson() {
  //   final Map<String, dynamic> data = new Map<String, dynamic>();
  //   data['message'] = this.message;
  //   data['status'] = this.status;
  //   return data;
  // }
}