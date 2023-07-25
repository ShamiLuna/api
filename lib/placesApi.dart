import 'dart:convert';

import 'package:apipro/Model/Zippo.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart'as http;
import 'package:shared_preferences/shared_preferences.dart';

class Pla extends StatefulWidget {
  const Pla({Key? key}) : super(key: key);

  @override
  State<Pla> createState() => _PlaState();
}

class _PlaState extends State<Pla> {
  Future<Places> FetchPlaces ()async{
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    final reso = await http.get(Uri.parse("https://api.zippopotam.us/us/33162"));
    print(reso.body);
    print(sharedPreferences.getString('resp'));
    return Places.fromJson(jsonDecode(reso.body));
  }
  @override
  void initState(){
    super.initState();
    FetchPlaces();
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
          child: FutureBuilder<Places>(
            future: FetchPlaces(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return Column(
                  children: [
                    Text(snapshot.data!.placeName.toString()),
                    Text(snapshot.data!.longitude.toString()),
                    Text(snapshot.data!.state.toString()),
                    Text(snapshot.data!.stateAbbreviation.toString()),
                    Text(snapshot.data!.latitude.toString()),

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
