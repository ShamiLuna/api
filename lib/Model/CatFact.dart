class CatFact {
  String? fact;
  int? length;

  CatFact({this.fact, this.length});

  CatFact.fromJson(Map<String, dynamic> json) {
    fact = json['fact'].toString();
    length = int.parse(json['length'].toString());
  }


  }

