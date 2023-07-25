// import 'package:apipro/Model/Zippo.dart';
//
// class Zippo {
//   String? postCode;
//   String? country;
//   String ?countryAbbreviation;
//   List<Places> ?places;
//
//   Zippo({this.postCode, this.country, this.countryAbbreviation, this.places});
//
//   Zippo.fromJson(Map<String, dynamic> json) {
//     postCode = json['post code'].toString();
//     country = json['country'].toString();
//     countryAbbreviation = json['country abbreviation'].toString();
//     places = <Places>[];
//     json['places'].forEach((v) {
//       places?.add(Places.fromJson(v));
//     });
//   }
//
//   // Map<String, dynamic> toJson() {
//   //   final Map<String, dynamic> data = new Map<String, dynamic>();
//   //   data['post code'] = this.postCode;
//   //   data['country'] = this.country;
//   //   data['country abbreviation'] = this.countryAbbreviation;
//   //   if (this.places != null) {
//   //     data['places'] = this.places.map((v) => v.toJson()).toList();
//   //   }
//   //   return data;
//   // }
// }
//
// class Places {
//   String ?placeName;
//   String ?longitude;
//   String ?state;
//   String ?stateAbbreviation;
//   String ?latitude;
//
//   Places(
//       {this.placeName,
//         this.longitude,
//         this.state,
//         this.stateAbbreviation,
//         this.latitude});
//
//  Places.fromJson(Map<String, dynamic> json) {
//     placeName = json['place name'].toString();
//     longitude = json['longitude'].toString();
//     state = json['state'].toString();
//     stateAbbreviation = json['state abbreviation'].toString();
//     latitude = json['latitude'].toString();
//   }
//
//   // Map<String, dynamic> toJson() {
//   //   final Map<String, dynamic> data = new Map<String, dynamic>();
//   //   data['place name'] = this.placeName;
//   //   data['longitude'] = this.longitude;
//   //   data['state'] = this.state;
//   //   data['state abbreviation'] = this.stateAbbreviation;
//   //   data['latitude'] = this.latitude;
//   //   return data;
//   // }
// }
import 'dart:convert';
import 'package:http/http.dart' as http;
Future<Zippo> fetchZippo() async {
  final response = await http.get(Uri.parse('https://api.zippopotam.us/us/33162'));


  if (response.statusCode == 200) {
    // If the server did return a 200 OK response,
    // then parse the JSON.
    return Zippo.fromJson(jsonDecode(response.body));
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    throw Exception('Failed to load album');
  }
}
class Zippo {
  String? postCode;
  String? country;
  String? countryAbbreviation;
  List<Places>? places;

  Zippo({this.postCode, this.country, this.countryAbbreviation, this.places});

  Zippo.fromJson(Map<String, dynamic> json) {
    postCode = json["post code"].toString();
    country = json["country"].toString();
    countryAbbreviation = json["country abbreviation"].toString();
    places = json["places"].toString() == null ? null : (json["places"] as List).map((e) => Places.fromJson(e)).toList();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["post code"] = postCode;
    _data["country"] = country;
    _data["country abbreviation"] = countryAbbreviation;
    if(places != null) {
      _data["places"] = places?.map((e) => e.toJson()).toList();
    }
    return _data;
  }
}

class Places {
  String? placeName;
  String? longitude;
  String? state;
  String? stateAbbreviation;
  String? latitude;

  Places({this.placeName, this.longitude, this.state, this.stateAbbreviation, this.latitude});

  Places.fromJson(Map<String, dynamic> json) {
    placeName = json["place name"].toString();
    longitude = json["longitude"].toString();
    state = json["state"].toString();
    stateAbbreviation = json["state abbreviation"].toString();
    latitude = json["latitude"].toString();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["place name"] = placeName;
    _data["longitude"] = longitude;
    _data["state"] = state;
    _data["state abbreviation"] = stateAbbreviation;
    _data["latitude"] = latitude;
    return _data;
  }
}