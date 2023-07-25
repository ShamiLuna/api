import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as https;
import 'package:newapi/model/Post.dart';

class Newget extends StatefulWidget {
  const Newget({Key? key}) : super(key: key);

  @override
  State<Newget> createState() => _NewgetState();
}

class _NewgetState extends State<Newget> {
 late Future<Places> future;
  Future<List<Places>> fetchAlbum() async {
    final response = await https.get(Uri.parse('https://api.zippopotam.us/us/33162'));
    var data = jsonDecode(response.body)['places'];
    return(data as List).map((x) => Places.fromJson(x)).toList();
    // if (response.statusCode == 200) {
    //   // If the server did return a 200 OK response,
    //   // then parse the JSON.
    //
    // } else {
    //   // If the server did not return a 200 OK response,
    //   // then throw an exception.
    //   throw Exception('Failed to load album');
    // }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Places"),
      ),
      body: FutureBuilder<List<Places>>(
        future: fetchAlbum(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return Container(
              height: 300,
              width: 400,
              child: ListView.builder(
                  itemCount: snapshot.data!.length,
                  itemBuilder: (context,index){
                return Column(
                  children: [
                    Text("p: "+snapshot.data![index].placeName.toString()),
                    Text("a: "+snapshot.data![index].longitude.toString()),
                    Text("v: "+snapshot.data![index].latitude.toString()),
                  ],
                );

              }),
            );
          } else if (snapshot.hasError) {
            return Text("$snapshot.error");
          }
          // spinner
          return CircularProgressIndicator();
        },
      ),

    );
  }
}
