class Genderr {
  int? count;
  String? name;
  String? gender;
  double? probability;

  Genderr({this.count, this.name, this.gender, this.probability});

  Genderr.fromJson(Map<String, dynamic> json) {
    count = int.parse(json['count'].toString());
    name = json['name'].toString();
    gender = json['gender'].toString();
    probability = double.parse(json['probability'].toString());
  }

  // Map<String, dynamic> toJson() {
  //   final Map<String, dynamic> data = new Map<String, dynamic>();
  //   data['count'] = this.count;
  //   data['name'] = this.name;
  //   data['gender'] = this.gender;
  //   data['probability'] = this.probability;
  //   return data;
  // }
}