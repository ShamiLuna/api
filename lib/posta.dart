import 'dart:async';
import 'dart:convert';

import 'package:apipro/Model/PostResp.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

Future<PostResp> createAlbum(String title) async {
  final response = await http.post(
    Uri.parse('https://api.zippopotam.us/us/33162'),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode(<String, String>{
      "place name": "Miami",
      "longitude": "-80.183",
      // "state": "Florida",
      // "state abbreviation": "FL",
      "latitude": "25.9286"
    }),
  );

  if (response.statusCode == 201) {
    // If the server did return a 201 CREATED response,
    // then parse the JSON.
    return PostResp.fromJson(jsonDecode(response.body));
  } else {
    // If the server did not return a 201 CREATED response,
    // then throw an exception.
    throw Exception('Failed to create album.');
  }
}

// class Album {
//   final int id;
//   final String title;
//
//   const Album({required this.id, required this.title});
//
//   factory Album.fromJson(Map<String, dynamic> json) {
//     return Album(
//       id: json['id'],
//       title: json['title'],
//     );
//   }
// }

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() {
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  final TextEditingController _controller = TextEditingController();
  Future<PostResp>? _futureAlbum;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Create Data Example',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Create Data Example'),
        ),
        body: Column(
          children: [

          ],
        ),
      ),
    );
  }

  // Column buildColumn() {
  //   return Column(
  //     mainAxisAlignment: MainAxisAlignment.center,
  //     children: <Widget>[
  //       TextField(
  //         controller: _controller,
  //         decoration: const InputDecoration(hintText: 'Enter Title'),
  //       ),
  //       ElevatedButton(
  //         onPressed: () {
  //           setState(() {
  //             _futureAlbum = createAlbum(_controller.text);
  //           });
  //         },
  //         child: const Text('Create Data'),
  //       ),
  //     ],
  //   );
  // }


}