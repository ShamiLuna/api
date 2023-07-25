// TODO Implement this library.
class Infom {
  String? ip;
  String? city;
  String? region;
  String? country;
  String? loc;
  String? org;
  String? postal;
  String? timezone;
  String? readme;

  Infom(

      {this.ip,
        this.city,
        this.region,
        this.country,
        this.loc,
        this.org,
        this.postal,
        this.timezone,
        this.readme});

  Infom.fromJson(Map<String, dynamic> json) {
    ip = json['ip'].toString();
    city = json['city'].toString();
    region = json['region'].toString();
    country = json['country'].toString();
    loc = json['loc'].toString();
    org = json['org'].toString();
    postal = json['postal'].toString();
    timezone = json['timezone'].toString();
    readme = json['readme'].toString();
  }

// Map<String, dynamic> toJson() {
//   final Map<String, dynamic> data = new Map<String, dynamic>();
//   data['ip'] = this.ip;
//   data['city'] = this.city;
//   data['region'] = this.region;
//   data['country'] = this.country;
//   data['loc'] = this.loc;
//   data['org'] = this.org;
//   data['postal'] = this.postal;
//   data['timezone'] = this.timezone;
//   data['readme'] = this.readme;
//   return data;
// }
}