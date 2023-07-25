import 'package:apipro/Model/gender.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart'as http;
import 'dart:convert';
  
class Gen extends StatefulWidget {
  const Gen({Key? key}) : super(key: key);

  @override
  State<Gen> createState() => _GenState();
}

class _GenState extends State<Gen> {
  Future<Genderr> fetchGenderr() async {
    final response = await http.get(Uri.parse('https://api.genderize.io?name=luc'));
    print(response.body);

    if (response.statusCode == 200) {
      // If the server did return a 200 OK response,
      // then parse the JSON.
      return Genderr.fromJson(jsonDecode(response.body));
    } else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      throw Exception('Failed to load album');
    }
  }
  void initState() {
    super.initState();
    fetchGenderr();
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
          child: FutureBuilder<Genderr>(
            future: fetchGenderr(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return Column(
                  children: [
                    Text(snapshot.data!.count.toString()),
                    Text(snapshot.data!.name.toString()),
                    Text(snapshot.data!.gender.toString()),
                    Text(snapshot.data!.probability.toString()),

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
