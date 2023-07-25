import 'dart:convert';

import 'package:apipro/IpifyApi.dart';
import 'package:apipro/Model/Ipify.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart'as http;

class Ipifo extends StatefulWidget {
  const Ipifo({Key? key}) : super(key: key);

  @override
  State<Ipifo> createState() => _IpifoState();
}

class _IpifoState extends State<Ipifo> {
  Future<Ipify> fetchIpify() async {
    final responseos = await http.get(Uri.parse('https://api.ipify.org?format=json'));
    print(responseos.body);

    if (responseos.statusCode == 200) {
      // If the server did return a 200 OK response,
      // then parse the JSON.
      return Ipify.fromJson(jsonDecode(responseos.body));
    } else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      throw Exception('Failed to load album');
    }
  }
  void initState() {
    super.initState();
    fetchIpify();
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
          child: FutureBuilder<Ipify>(
            future: fetchIpify(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return Column(
                  children: [
                    Text(snapshot.data!.ip.toString()),
                    // Text(snapshot.data!.status.toString()),
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

