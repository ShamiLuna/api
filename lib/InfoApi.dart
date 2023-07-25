import 'dart:convert';

import 'package:apipro/Model/Infom.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
class Info extends StatefulWidget {
  const Info({Key? key}) : super(key: key);

  @override
  State<Info> createState() => _InfoState();
}
class _InfoState extends State<Info> {
  Future<Infom> FetchInfom ()async{
    final rek = await http.get(Uri.parse("https://ipinfo.io/161.185.160.93/geo"));
    // print(rek.body);
    return Infom.fromJson(jsonDecode(rek.body));
  }
  // Future<Agify> FetchAgify()async{
  //   final respont = await http.get(Uri.parse("https://api.agify.io?name=meelad"));
  //   print(respont.body);
  //   return Agify.fromJson(jsonDecode(respont.body));
  // }

  @override
  void initState() {
    super.initState();
    FetchInfom();
    // TODO: implement initstate
  }


  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Info',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Fetch Data Example'),
        ),
        body: Center(
          child: FutureBuilder<Infom>(
            future: FetchInfom(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return Column(
                  children: [
                    Text(snapshot.data!.ip.toString()),
                    Text(snapshot.data!.city.toString()),
                    Text(snapshot.data!.region.toString()),
                    Text(snapshot.data!.country.toString()),
                    Text(snapshot.data!.loc.toString()),
                    Text(snapshot.data!.org.toString()),
                    Text(snapshot.data!.postal.toString()),
                    Text(snapshot.data!.timezone.toString()),
                    Text(snapshot.data!.readme.toString()),
                  ],
                );
              } else if (snapshot.hasError) {
                return Text('${snapshot.error}');
              }

              // By default, show a loading spinner.
              return const CircularProgressIndicator();
            },
          ),
        ),
      ),
    );
  }
}

// class Infom {
//   String? ip;
//   String? city;
//   String? region;
//   String? country;
//   String? loc;
//   String? org;
//   String? postal;
//   String? timezone;
//   String? readme;
//
//   Infom(
//
//       {this.ip,
//         this.city,
//         this.region,
//         this.country,
//         this.loc,
//         this.org,
//         this.postal,
//         this.timezone,
//         this.readme});
//
//   Infom.fromJson(Map<String, dynamic> json) {
//     ip = json['ip'].toString();
//     city = json['city'].toString();
//     region = json['region'].toString();
//     country = json['country'].toString();
//     loc = json['loc'].toString();
//     org = json['org'].toString();
//     postal = json['postal'].toString();
//     timezone = json['timezone'].toString();
//     readme = json['readme'].toString();
//   }
//
// // Map<String, dynamic> toJson() {
// //   final Map<String, dynamic> data = new Map<String, dynamic>();
// //   data['ip'] = this.ip;
// //   data['city'] = this.city;
// //   data['region'] = this.region;
// //   data['country'] = this.country;
// //   data['loc'] = this.loc;
// //   data['org'] = this.org;
// //   data['postal'] = this.postal;
// //   data['timezone'] = this.timezone;
// //   data['readme'] = this.readme;
// //   return data;
// // }
// }

