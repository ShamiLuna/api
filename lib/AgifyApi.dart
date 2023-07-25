import 'dart:convert';

import 'package:apipro/Model/Agi.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
// import 'package:http/http.dart';
class Joki extends StatefulWidget {
  const Joki({Key? key}) : super(key: key);

  @override
  State<Joki> createState() => _JokiState();
}

class _JokiState extends State<Joki> {
  Future<Agify> FetchAgify()async{
    final respont = await http.get(Uri.parse("https://api.agify.io?name=meelad"));
    print(respont.body);
    return Agify.fromJson(jsonDecode(respont.body));
  }

  @override
  void initState(){
    super.initState();
    FetchAgify() ;
  }
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'AgifyIO',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Fetch Data Example'),
        ),
        body: Center(
          child: FutureBuilder<Agify>(
            future: FetchAgify(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return Column(
                  children: [
                    Text(snapshot.data!.count.toString()),
                    Text(snapshot.data!.name.toString()),
                    Text(snapshot.data!.age.toString()),
                    // Text(snapshot.data!.id.toString()),
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
