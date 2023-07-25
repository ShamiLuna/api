import 'dart:convert';

import 'package:apipro/Model/Activity.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
class ActivityApi extends StatefulWidget {
  const ActivityApi({Key? key}) : super(key: key);

  @override
  State<ActivityApi> createState() => _ActivityApiState();
}

class _ActivityApiState extends State<ActivityApi> {
  Future<CatFactu> FetchCatFactus() async{
    final resps = await http.get(Uri.parse("https://www.boredapi.com/api/activity"));
    print(resps.body);
    return CatFactu.fromJsons(jsonDecode(resps.body));

  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    FetchCatFactus();
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
          child: FutureBuilder<CatFactu>(
            future: FetchCatFactus(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return Column(
                  children: [
                    Text(snapshot.data!.activity.toString()),
                    Text(snapshot.data!.type.toString()),
                    Text(snapshot.data!.participants.toString()),
                    Text(snapshot.data!.price.toString()),
                    Text(snapshot.data!.link.toString()),
                    Text(snapshot.data!.key.toString()),
                    Text(snapshot.data!.accessibility.toString()),

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
