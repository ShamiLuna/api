import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as https;
import 'package:flutter/material.dart';

import 'modelapi/Post.dart';


class zippoAPI extends StatefulWidget{
  const zippoAPI({Key? key}) : super(key: key);

  @override
  State<zippoAPI> createState() => _zippoAPIState();
}

class _zippoAPIState extends State<zippoAPI> {

  late Future<Places> future;
  Future<List<Places>> getZIPpo() async
  {
    final resp = await https.get(Uri.parse("https://api.zippopotam.us/us/33162"));
    var data = jsonDecode(resp.body)['places'];
    return (data as List).map((x) => Places.fromJson(x)).toList();
  }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title:"Get Zippo api example",
      theme: ThemeData(
        primarySwatch: Colors.purple,
      ),
      home: Scaffold(
          backgroundColor: Colors.greenAccent,
          appBar: AppBar(
            title: Center(child: Text("Get Zippo Api Example",style: TextStyle(fontSize: 30),),),
          ),
          body: FutureBuilder<List<Places>>(
            future: getZIPpo(),
            builder: (context,snapshot)
            {
              if(snapshot.hasData){
                return ListView.builder(
                    itemCount: snapshot.data!.length,
                    itemBuilder: (context,index){
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Card(
                          elevation: 30,
                          color: Colors.pink.shade100,
                          child: Column(
                            children:[
                              Text("PLACE NAME:"+snapshot.data![index].placeName.toString(),style: TextStyle(fontSize: 40,color: Colors.black,fontWeight: FontWeight.w600),),
                              Text("LONGITUDE:"+snapshot.data![index].longitude.toString(),style: TextStyle(fontSize:40,color: Colors.black,fontWeight: FontWeight.w600),),
                              // Text("STATE:"+snapshot.data![index].state.toString(),style: TextStyle(fontSize: 40,color: Colors.black,fontWeight: FontWeight.w600),),
                              // Text("STATEABB:"+snapshot.data![index].stateAbbreviation.toString(),style: TextStyle(fontSize: 40,color: Colors.black,fontWeight: FontWeight.w600),),
                              Text("LATITUDE:"+snapshot.data![index].latitude.toString(),style: TextStyle(fontSize:40,color: Colors.black,fontWeight: FontWeight.w600),),
                            ],
                          ),
                        ),
                      );
                    }
                );
              }
              else if(snapshot.hasError)
              {
                return Text("$snapshot.error");
              }
              return Center(child: Container(
                  height: 100,
                  width: 100,
                  child: const CircularProgressIndicator(strokeWidth: 10)),);
            },

          )
      ),
    );
  }
}