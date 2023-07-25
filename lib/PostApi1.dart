import 'dart:convert';
import 'dart:io';
import 'package:apipro/Model/PostResp.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
class PostAPI1 extends StatefulWidget {
  const PostAPI1({Key? key}) : super(key: key);

  @override
  State<PostAPI1> createState() => _PostAPI1State();
}

class _PostAPI1State extends State<PostAPI1> {
  TextEditingController txtTransaction = new TextEditingController();
  TextEditingController txtT = TextEditingController();
  Future<PostResp>? _future;
  Future<PostResp> AddNewTransaction(String trans) async
  {
    final resp = await http.post(Uri.parse("https://api.zippopotam.us/us/33162"),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, dynamic>{
        // {clientId:0, clientName:"Sangeetha",
        //   phone:"978956231",address:"testing",
        //   gst:"5767hgj",website:"www.gmail.com",
        //   email:"san@gmail.com",
        //   contactPerson:"Sangee",
        //   phoneNumber:"7894561230"
        //   ,createdBy:1}

        "places": [
          {
            "place name": "trans",
            "longitude": "-80.183",
            "state": "Florida",
            "state abbreviation": "FL",
            "latitude": "25.9286"
          }
        ]
      }
      ),

    );
    return PostResp.fromJson(jsonDecode(resp.body));
  }
  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Create Data Example',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Create Data Example'),
        ),
        body: Container(
          alignment: Alignment.center,
          padding: const EdgeInsets.all(8),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              TextField(
                controller: txtTransaction,
                decoration: const InputDecoration(hintText: 'Enter Transaction Mode name'),
              ),
              // TextField(
              //   controller: txtT,
              //   decoration: const InputDecoration(hintText: 'Enter Transaction Mode name'),
              // ),
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    _future = AddNewTransaction(txtTransaction.text);
                  });
                },
                child: Column(
                  children: [
                    const Text('Create Data'),
                    // SizedBox(
                    //   height: 200,
                    //   width: 200,
                    // ),
                    // const Text('Create Data'),
                  ],
                ),
              ),
          FutureBuilder<PostResp>(
            future: _future,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return Text(snapshot.data!.success.toString());
                txtTransaction.text = "";
              } else if (snapshot.hasError) {
                return Text('${snapshot.error}');
              }
              return const CircularProgressIndicator();
            },
          )
            ],
          )
          )
        ),
      );
  }
}
