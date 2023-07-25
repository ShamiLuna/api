class Agify {
  int? count;
  String? name;
  int? age;

  Agify({this.count, this.name, this.age});

  Agify.fromJson(Map<String, dynamic> json) {
    count = int.parse(json['count'].toString());
    name = json['name'].toString();
    age = int.parse(json['age'].toString());
  }


}