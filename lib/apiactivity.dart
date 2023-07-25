import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:newapi/model/api.dart';



class Apiactivity extends StatefulWidget {
  const Apiactivity({Key? key}) : super(key: key);

  @override

  State<Apiactivity> createState() => _ApiactivityState();
}

class _ApiactivityState extends State<Apiactivity> {
  // Future<CatFact> fetchAlbum() async {
  //   final response = await http
  //       .get(Uri.parse('https://www.boredapi.com/api/activity'));
  //
  //   if (response.statusCode == 200) {
  //     // If the server did return a 200 OK response,
  //     // then parse the JSON.
  //     return CatFact.fromJson(jsonDecode(response.body));
  //   } else {
  //     // If the server did not return a 200 OK response,
  //     // then throw an exception.
  //     throw Exception('Failed to load album');
  //   }
  // }

  @override
  void initState() {
    super.initState();
    // fetchAlbum();
  }
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Fetch Data Example',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Fetch Data Example'),
        ),
        body: Center(
          // child: FutureBuilder<CatFact>(
          //   future: () ,
          //   builder: (context, snapshot) {
          //     if (snapshot.hasData) {
          //       return Column(
          //         children: [
          //           Text(snapshot.data!.activity.toString()),
          //           Text(snapshot.data!.type.toString()),
          //           Text(snapshot.data!.participants.toString()),
          //           Text(snapshot.data!.price.toString()),
          //           Text(snapshot.data!.link.toString()),
          //           Text(snapshot.data!.key.toString()),
          //           Text(snapshot.data!.accessibility.toString()),
          //
          //         ],
          //       );
          //     } else if (snapshot.hasError) {
          //       return Text('${snapshot.error}');
          //     }
          //
          //     // By default, show a loading spinner.
          //     return const CircularProgressIndicator();
          //   },
          // ),
        ),
      ),
    );
  }
}
