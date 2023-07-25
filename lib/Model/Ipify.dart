class Ipify{
  String? ip;

  Ipify({this.ip});

  Ipify.fromJson(Map<String, dynamic> json) {
    ip = json['ip'].toString();
  }


}