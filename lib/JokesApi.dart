import 'dart:convert';

import 'package:apipro/Model/Jokes.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
// import 'package:http/http.dart';
class Jok extends StatefulWidget {
  const Jok({Key? key}) : super(key: key);

  @override
  State<Jok> createState() => _JokState();
}

class _JokState extends State<Jok> {
  Future<Jokes> FetchJokes()async{
    final respon = await http.get(Uri.parse("https://official-joke-api.appspot.com/random_joke"));
    print(respon.body);
    return Jokes.fromJson(jsonDecode(respon.body));
  }

  @override
  void initState(){
   super.initState();
   FetchJokes() ;
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
          child: FutureBuilder<Jokes>(
            future: FetchJokes(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return Column(
                  children: [
                    Text(snapshot.data!.type.toString()),
                    Text(snapshot.data!.setup.toString()),
                    Text(snapshot.data!.punchline.toString()),
                    Text(snapshot.data!.id.toString()),
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
}}
