// import 'dart:convert';
//
// import 'package:flutter/material.dart';
//
// // import 'Model/CatFact.dart';
// import 'package:http/http.dart' as http;
//
// class CatFactAPI extends StatefulWidget {
//   const CatFactAPI({Key? key}) : super(key: key);
//
//   @override
//   State<CatFactAPI> createState() => _CatFactAPIState();
// }
//
// class _CatFactAPIState extends State<CatFactAPI> {
//
//   Future<CatFact> FetchCatFacts() async{
//     final resp = await http.get(Uri.parse("https://catfact.ninja/fact"));
//     print(resp.body);
//     return CatFact.fromJson(jsonDecode(resp.body));
//
//   }
//   @override
//   void initState() {
//     // TODO: implement initState
//     super.initState();
//     FetchCatFacts();
//   }
//
//   @override
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
//           child: FutureBuilder<CatFact>(
//             future: FetchCatFacts(),
//             builder: (context, snapshot) {
//               if (snapshot.hasData) {
//                 return Column(
//                   children: [
//                     Text(snapshot.data!.fact.toString()),
//                     Text(snapshot.data!.length.toString())
//                   ],
//                 );
//               } else if (snapshot.hasError) {
//                 return Text('${snapshot.error}');
//               }
//
//               // By default, show a loading spinner.
//               return const CircularProgressIndicator();
//             },
//           ),
//         ),
//       ),
//     );
//   }
// }
