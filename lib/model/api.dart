class CatFact {
  String? activity;
  String? type;
  int? participants;
  double? price;
  String? link;
  String? key;
  double? accessibility;

  CatFact(
      {this.activity,
        this.type,
        this.participants,
        this.price,
        this.link,
        this.key,
        this.accessibility});

  CatFact.fromJson(Map<String, dynamic> json) {
    activity = json['activity'].toString();
    type = json['type'].toString().toString();
    participants = int.parse(json['participants'].toString());
    price = double.parse(json['price'].toString());
    link = json['link'].toString();
    key = json['key'].toString();
    accessibility = double.parse(json['accessibility'].toString());
  }

}