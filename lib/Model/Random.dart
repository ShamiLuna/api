// import 'package:flutter/material.dart';



class randomuser {
  List<Results> ?results;
  Info ?info;

  randomuser({required this.results, this.info});

  randomuser.fromJson(Map<String, dynamic> json) {
    if (json['results'].toString() != null) {
      results = <Results>[];  results;
      json['results'].forEach((v) {
        results?.add(Results.fromJson(v));
      });
    }
    info = json['info'].toString() != null ? Info.fromJson(json['info']) : null;
  }

  // Map<String, dynamic> toJson() {
  //   final Map<String, dynamic> data = Map<String, dynamic>();
  //   final results = this.results;
  //   if (results != null) {
  //     data['results'] = results.map((v) => v.toJson()).toList();
  //   }
  //   final info = this.info;
  //   if (info != null) {
  //     data['info'] = info.toJson();
  //   }
  //   return data;
  // }
}

class Results {
  String ?gender;
  Name ?name;
  Location ?location;
  String ?email;
  Login ?login;
  Dob ?dob;
  Dob ?registered;
  String ?phone;
  String ?cell;
  Id ?id;
  Picture ?picture;
  String ?nat;

  Results(
      {this.gender,
        this.name,
        this.location,
        this.email,
        this.login,
        this.dob,
        this.registered,
        this.phone,
        this.cell,
        this.id,
        this.picture,
        this.nat});

  Results.fromJson(Map<String, dynamic> json) {
    gender = json['gender'].toString();
    name = json['name'].toString() != null ? Name.fromJson(json['name']) : null;
    location = json['location'].toString() != null
        ? Location.fromJson(json['location'])
        : null;
    email = json['email'].toString();
    login = json['login'].toString() != null ? Login.fromJson(json['login']) : null;
    dob = json['dob'].toString() != null ? Dob.fromJson(json['dob']) : null;
    registered = json['registered'].toString() != null
        ? Dob.fromJson(json['registered'])
        : null;
    phone = json['phone'].toString();
    cell = json['cell'].toString();
    id = json['id'].toString() != null ? Id.fromJson(json['id']) : null;
    picture =
    json['picture'].toString() != null ? Picture.fromJson(json['picture']) : null;
    nat = json['nat'].toString();
  }

  // Map<String, dynamic> toJson() {
  //   final Map<String, dynamic> data = Map<String, dynamic>();
  //   data['gender'] = this.gender;
  //   final name = this.name;
  //   if (name != null) {
  //     data['name'] = name.toJson();
  //   }
  //   final location = this.location;
  //   if (location != null) {
  //     data['location'] = location.toJson();
  //   }
  //   data['email'] = this.email;
  //   final login = this.login;
  //   if (login != null) {
  //     data['login'] = login.toJson();
  //   }
  //   final dob = this.dob;
  //   if (dob != null) {
  //     data['dob'] = dob.toJson();
  //   }
  //   final registered = this.registered;
  //   if (registered != null) {
  //     data['registered'] = registered.toJson();
  //   }
  //   data['phone'] = this.phone;
  //   data['cell'] = this.cell;
  //   final id = this.id;
  //   if (id != null) {
  //     data['id'] = id.toJson();
  //   }
  //   final picture = this.picture;
  //   if (picture != null) {
  //     data['picture'] = picture.toJson();
  //   }
  //   data['nat'] = this.nat;
  //   return data;
  // }
}

class Name {
  String ?title;
  String ?first;
  String ?last;

  Name({this.title, this.first, this.last});

  Name.fromJson(Map<String, dynamic> json) {
    title = json['title'].toString();
    first = json['first'].toString();
    last = json['last'].toString();
  }

  // Map<String, dynamic> toJson() {
  //   final Map<String, dynamic> data = Map<String, dynamic>();
  //   data['title'] = this.title;
  //   data['first'] = this.first;
  //   data['last'] = this.last;
  //   return data;
  // }
}

class Location {
  Street ?street;
  String ?city;
  String ?state;
  String ?country;
  int ?postcode;
  Coordinates ?coordinates;
  Timezone ?timezone;

  Location(
      {this.street,
        this.city,
        this.state,
        this.country,
        this.postcode,
        this.coordinates,
        this.timezone});

  Location.fromJson(Map<String, dynamic> json) {
    street =
    json['street'].toString() != null ? Street.fromJson(json['street']) : null;
    city = json['city'].toString();
    state = json['state'].toString();
    country = json['country'].toString();
    postcode = int.parse(json['postcode'].toString());
    coordinates = json['coordinates'].toString() != null
        ? Coordinates.fromJson(json['coordinates'])
        : null;
    timezone = json['timezone'].toString() != null
        ? Timezone.fromJson(json['timezone'])
        : null;
  }

  // Map<String, dynamic> toJson() {
  //   final Map<String, dynamic> data = Map<String, dynamic>();
  //   final street = this.street;
  //   if (street != null) {
  //     data['street'] = street.toJson();
  //   }
  //   data['city'] = this.city;
  //   data['state'] = this.state;
  //   data['country'] = this.country;
  //   data['postcode'] = this.postcode;
  //   final coordinates = this.coordinates;
  //   if (coordinates != null) {
  //     data['coordinates'] = coordinates.toJson();
  //   }
  //   final timezone = this.timezone;
  //   if (timezone != null) {
  //     data['timezone'] = timezone.toJson();
  //   }
  //   return data;
  // }
}

class Street {
  int ?number;
  String ?name;

  Street({this.number, this.name});

  Street.fromJson(Map<String, dynamic> json) {
    number = int.parse(json['number'].toString());
    name = json['name'].toString();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['number'] = this.number;
    data['name'] = this.name;
    return data;
  }
}

class Coordinates {
  String ?latitude;
  String ?longitude;

  Coordinates({this.latitude, this.longitude});

  Coordinates.fromJson(Map<String, dynamic> json) {
    latitude = json['latitude'].toString();
    longitude = json['longitude'].toString();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['latitude'] = this.latitude;
    data['longitude'] = this.longitude;
    return data;
  }
}

class Timezone {
  String ?offset;
  String ?description;

  Timezone({required this.offset, this.description});

  Timezone.fromJson(Map<String, dynamic> json) {
    offset = json['offset'].toString();
    description = json['description'].toString();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['offset'] = this.offset;
    data['description'] = this.description;
    return data;
  }
}

class Login {
  String?uuid;
  String?username;
  String?password;
  String?salt;
  String?md5;
  String?sha1;
  String?sha256;

  Login(
      {this.uuid,
        this.username,
        this.password,
        this.salt,
        this.md5,
        this.sha1,
        this.sha256});

  Login.fromJson(Map<String, dynamic> json) {
    uuid = json['uuid'].toString();
    username = json['username'].toString();
    password = json['password'].toString();
    salt = json['salt'].toString();
    md5 = json['md5'].toString();
    sha1 = json['sha1'].toString();
    sha256 = json['sha256'].toString();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['uuid'] = this.uuid;
    data['username'] = this.username;
    data['password'] = this.password;
    data['salt'] = this.salt;
    data['md5'] = this.md5;
    data['sha1'] = this.sha1;
    data['sha256'] = this.sha256;
    return data;
  }
}

class Dob {
  String ?date;
  int? age;

  Dob({required this.date, required this.age});

  Dob.fromJson(Map<String, dynamic> json) {
    date = json['date'].toString();
    age = int.parse(json['age'].toString());
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['date'] = this.date;
    data['age'] = this.age;
    return data;
  }
}

class Id {
  String?name;
  String?value;

  Id({this.name, this.value});

  Id.fromJson(Map<String, dynamic> json) {
    name = json['name'].toString();
    value = json['value'].toString();
  }

  // Map<String, dynamic> toJson() {
  //   final Map<String, dynamic> data = Map<String, dynamic>();
  //   data['name'] = this.name;
  //   data['value'] = this.value;
  //   return data;
  // }
}

class Picture {
  String ?large;
  String ?medium;
  String ?thumbnail;

  Picture({this.large, this.medium, this.thumbnail});

  Picture.fromJson(Map<String, dynamic> json) {
    large = json['large'].toString();
    medium = json['medium'].toString();
    thumbnail = json['thumbnail'].toString();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['large'] = this.large;
    data['medium'] = this.medium;
    data['thumbnail'] = this.thumbnail;
    return data;
  }
}

class Info {
  String ?seed;
  int ?results;
  int ?page;
  String? version;

  Info({this.seed, this.results, this.page, this.version});

  Info.fromJson(Map<String, dynamic> json) {
    seed = json['seed'].toString();
    results = int.parse(json['results'].toString());
    page = int.parse(json['page'].toString());
    version = json['version'].toString();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['seed'] = this.seed;
    data['results'] = this.results;
    data['page'] = this.page;
    data['version'] = this.version;
    return data;
  }
}
