class Jokes {
  String? type;
  String ?setup;
  String ?punchline;
  int ?id;

  Jokes({this.type, this.setup, this.punchline, this.id});

  Jokes.fromJson(Map<String, dynamic> json) {
    type = json['type'].toString();
    setup = json['setup'].toString();
    punchline = json['punchline'].toString();
    id = int.parse(json['id'].toString());
  }

  // Map<String, dynamic> toJson() {
  //   final Map<String, dynamic> data = new Map<String, dynamic>();
  //   data['type'] = this.type;
  //   data['setup'] = this.setup;
  //   data['punchline'] = this.punchline;
  //   data['id'] = this.id;
  //   return data;
  // }
}