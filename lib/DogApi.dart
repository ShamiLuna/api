import 'package:apipro/Model/Dog.dart';
import 'package:apipro/Model/gender.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart'as http;
import 'dart:convert';

class Geni extends StatefulWidget {
  const Geni({Key? key}) : super(key: key);

  @override
  State<Geni> createState() => _GeniState();
}

class _GeniState extends State<Geni> {
  Future<Dodu> fetchDodu() async {
    final responseo = await http.get(Uri.parse('https://dog.ceo/api/breeds/image/random'));
    print(responseo.body);

    if (responseo.statusCode == 200) {
      // If the server did return a 200 OK response,
      // then parse the JSON.
      return Dodu.fromJson(jsonDecode(responseo.body));
    } else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      throw Exception('Failed to load album');
    }
  }
  void initState() {
    super.initState();
    fetchDodu();
  }

  @override
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
          child: FutureBuilder<Dodu>(
            future: fetchDodu(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return Column(
                  children: [
                    Text(snapshot.data!.message.toString()),
                    Text(snapshot.data!.status.toString()),
                    // Text(snapshot.data!.gender.toString()),
                    // Text(snapshot.data!.probability.toString()),

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
