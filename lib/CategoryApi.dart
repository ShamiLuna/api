import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:apipro/Model/PostResp.dart';
import 'package:http/http.dart'as http;

class Cate extends StatefulWidget {
  const Cate({Key? key}) : super(key: key);

  @override
  State<Cate> createState() => _CateState();
}

class _CateState extends State<Cate> {
  TextEditingController ctri = TextEditingController();
  TextEditingController ct = TextEditingController();
  Future<Pos>? _futuree;
  Future<Pos> AddN(String tr,String rt) async {
    final resp = await http.post(Uri.parse("http://catodotest.elevadosoftwares.com/Category/InsertCategory"),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        // {clientId:0, clientName:"Sangeetha",
        //   phone:"978956231",address:"testing",
        //   gst:"5767hgj",website:"www.gmail.com",
        //   email:"san@gmail.com",
        //   contactPerson:"Sangee",
        //   phoneNumber:"7894561230"
        //   ,createdBy:1}

        // {categoryId : 0, category : "Tax Audit" , description: "Tax auditing" , createdBy: 1}

        "categoryId":"0",
        "category":"rt",
        "description":"tr",
        // "address":tr,
        // "gst":"5767hgj",
        // "website":"www.gmail.com",
        // "email":"san@gmail.com",
        // "contactPerson":"Sangee",
        // "phoneNumber":"7894561230",
        "createdBy":"1",
      }
      ),

    );
    return Pos.fromJson(jsonDecode(resp.body));
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
                    controller: ctri,
                    decoration: const InputDecoration(hintText: 'Enter Transaction Mode name'),
                  ),
                  TextField(
                    controller: ct,
                    decoration: const InputDecoration(hintText: 'Enter Transaction Mode name'),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      setState(() {
                        _futuree = AddN(ctri.text,ct.text);
                      });
                    },
                    child: Column(
                      children: [
                        const Text('Create Data'),
                        SizedBox(
                          height: 200,
                          width: 200,
                        ),
                        const Text('Create Data'),
                      ],
                    ),
                  ),
                  FutureBuilder<Pos>(
                    future: _futuree,
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        return Text(snapshot.data!.success.toString());
                        ctri.text = "";
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
