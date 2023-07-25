// import 'dart:convert';
// import 'dart:core';
//
// import 'package:apipro/Model/Zippo.dart';
// import 'package:flutter/material.dart';
// import 'package:http/http.dart'as http;
// class Zip extends StatefulWidget {
//   const Zip({Key? key}) : super(key: key);
//
//   @override
//   State<Zip> createState() => _ZipState();
// }
//
// class _ZipState extends State<Zip> {
//
//   Future<Places>
//   FetchPlaces() async{
//
//     var rep = await http.get(Uri.parse("https://api.zippopotam.us/us/33162"));
//     Places places = Places.fromJson(json.decode(rep.body));
//     // setState(() {
//     // });
//     // print(rep.body);
//     print(places.toString());
//     // return Zippo.fromJson(jsonDecode(rep.body));
//
//     return Places.fromJson(jsonDecode(rep.body));
//     // return Places.fromJson(jsonDecode(rep.body));
//   }
//
//   // Future<Places>  FetchPlaces()
//   //
//   //
//   // async{
//   //   final repk = await http.get(Uri.parse("https://api.zippopotam.us/us/33162"));
//   //   print(repk.body);
//   //   Map data = jsonDecode(repk.body);
//   //   List i = [];
//   //
//   //   for (var o in data['Zippo']){
//   //     i.add(o['Places']);
//   //   }
//   //
//   //   return Places.fromJson(jsonDecode(repk.body));
//   //   // return Places.fromJson(jsonDecode(rep.body));
//   // }
//
//   @override
//      void initState(){
//     super.initState();
//     // FetchZippo();
//
//      FetchPlaces();
//   }
//
//
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Fetch Data Example',
//       theme: ThemeData(
//         primarySwatch: Colors.blue,
//       ),
//       home: Scaffold(
//         appBar: AppBar(
//           title: const Text('Fetch Data Example'),
//         ),
//         body: Center(
//           child: Column(
//             children: [
//               // FutureBuilder<Zippo>(
//               //   future: FetchZippo(),
//               //   builder: (context, snapshot) {
//               //     if (snapshot.hasData) {
//               //       return Column(
//               //         children: [
//               //           Text(snapshot.data!.postCode.toString()),
//               //           Text(snapshot.data!.country.toString()),
//               //           Text(snapshot.data!.countryAbbreviation.toString()),
//               //           Text(snapshot.data!.places.toString()),
//               //
//               //         ],
//               //       );
//               //     } else if (snapshot.hasError) {
//               //       return Text('${snapshot.error}');
//               //     }
//               //
//               //     // By default, show a loading spinner.
//               //     return const CircularProgressIndicator();
//               //   },
//               // ),
//               FutureBuilder<Places>(
//                 future: FetchPlaces(),
//                 builder: (context, snapshot) {
//                   if (snapshot.hasData) {
//                     return Column(
//                       children: [
//                         Text(snapshot.data!.placeName.toString()),
//                         Text(snapshot.data!.longitude.toString()),
//                         Text(snapshot.data!.state.toString()),
//                         Text(snapshot.data!.stateAbbreviation.toString()),
//                         Text(snapshot.data!.latitude.toString()),
//                       ],
//                     );
//                   } else if (snapshot.hasError) {
//                     return Text('${snapshot.error}');
//                   }
//
//                   // By default, show a loading spinner.
//                   return const CircularProgressIndicator();
//                 },
//               ),
//
//             ],
//           ),
//
//         ),
//       ),
//     );
//   }
// }
// import 'dart:convert';
//
// import 'package:apipro/Model/Zippo.dart';
// import 'package:flutter/material.dart';
// import 'package:http/http.dart'as http;
// // https://api.zippopotam.us/us/33162
// class Dips extends StatefulWidget {
//   const Dips({Key? key}) : super(key: key);
//
//   @override
//   State<Dips> createState() => _DipsState();
// }
//
// class _DipsState extends State<Dips> {
//   Future<Zippo> fetchZippo() async {
//     final response = await http
//         .get(Uri.parse('https://api.zippopotam.us/us/33162'));
//
//
//     if (response.statusCode == 200) {
//       // If the server did return a 200 OK response,
//       // then parse the JSON.
//       return Zippo.fromJson(jsonDecode(response.body));
//     } else {
//       // If the server did not return a 200 OK response,
//       // then throw an exception.
//       throw Exception('Failed to load album');
//     }
//   }
//   // Future<String> getData () async {
//   //   final ret = await http.get(Uri.parse("https://api.zippopotam.us/us/33162"));
//   //   var rety = ret.body;
//   //   if (ret.statusCode == 200) {
//   //     // If the server did return a 200 OK response,
//   //     // then parse the JSON.
//   //     return (rety);
//   //   } else {
//   //     // If the server did not return a 200 OK response,
//   //     // then throw an exception.
//   //     throw Exception('Failed to load album');
//   //   }
//   // }
//   @override
//
//
//   List<Places>? places;
//   var isLoaded = false;
//
//   void initState() {
//     super.initState();
//     fetchZippo();
//      FetchPlaces();
//   }
//   FetchPlaces() async {
//     places = (await http.get(Uri("https://api.zippopotam.us/us/33162")) as List<Places>?;
//     if (places != null)
//       {
//         setState(() {
//           isLoaded = true ;
//         });
//         final ret = await http.get(Uri.parse("https://api.zippopotam.us/us/33162"));
//           var rety = ret.body;
//           if (ret.statusCode == 200) {
//             // If the server did return a 200 OK response,
//             // then parse the JSON.
//             print (rety);
//           } else {
//             // If the server did not return a 200 OK response,
//             // then throw an exception.
//             throw Exception('Failed to load album');
//           }
//         }
//       }
//
//   @override
//   Widget build(BuildContext context) {
//     // TODO: implement build
//     throw UnimplementedError();
//   }
//   }
//
//   Widget build(BuildContext context) {
//      return MaterialApp(
//       title: 'Fetch Data Example',
//       theme: ThemeData(
//         primarySwatch: Colors.blue,
//       ),
//       home: Scaffold(
//         appBar: AppBar(
//           title: const Text('Fetch Data Example'),
//         ),
//         body: Center(
//           child: FutureBuilder<Zippo>(
//             future:  fetchZippo(),
//             builder: (context, snapshot) {
//               if (snapshot.hasData) {
//                 return Column(
//                   children: [
//                     Text(snapshot.data!.postCode.toString()),
//                     Text(snapshot.data!.country.toString()),
//                     Text(snapshot.data!.countryAbbreviation.toString()),
//                     Text(snapshot.data!.places.toString()),
//                     ListView.builder(itemBuilder: (context, index) {
//                       return Container(
//                          child: Text ('hi'),
//                       );
//                     })
//                   ],
//                 );
//               } else if (snapshot.hasError) {
//                 return Text('${snapshot.error}');
//               }// By default, show a loading spinner.
//               return const CircularProgressIndicator();
//             },
//           ),
//         ),
//       ),
//     );
//   }
//
//
