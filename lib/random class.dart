import 'dart:convert';


import 'package:apipro/Model/Random.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart'as http;

class Ran extends StatefulWidget {
  const Ran({Key? key}) : super(key: key);
  @override
  State<Ran> createState() => _RanState();
}

class _RanState extends State<Ran> {


  Future<randomuser> Fetchrandomuser() async{
    final respo = await http.get(Uri.parse("https://randomuser.me/api/"));
    print(respo.body);
    return randomuser.fromJson(jsonDecode(respo.body));

  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Fetchrandomuser();
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
          child: FutureBuilder<randomuser>(
            future: Fetchrandomuser(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return Column(
                  children: [
                    Text(snapshot.data!.results.toString()),
                    Text(snapshot.data!.info.toString()),

                    // Text(snapshot.data!.participants.toString()),
                    // Text(snapshot.data!.price.toString()),
                    // Text(snapshot.data!.link.toString()),
                    // Text(snapshot.data!.key.toString()),
                    // Text(snapshot.data!.accessibility.toString()),

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
