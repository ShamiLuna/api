import 'dart:convert';
import 'dart:html';

import 'package:apipro/Model/Products.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class DetailsPage extends StatefulWidget {
  final String productId;


  DetailsPage(this.productId);

  @override
  State<DetailsPage> createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {

  Future<Products> FetchAgify()async{
   // SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    String proId = widget.productId.toString();
    print(proId);
    final respont = await http.get(Uri.parse("https://fakestoreapi.com/products/$proId"));
    print(respont.body);
   // sharedPreferences.setString('resp', respont.body.toString());
  return Products.fromJson(jsonDecode(respont.body));
  }

  @override
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
          child: FutureBuilder<Products>(
            future: FetchAgify(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return Column(
                  children: [
                    Text(snapshot.data!.title.toString()),
                    Text(snapshot.data!.description.toString()),
                    GestureDetector(
                      onTap: () async {
                        SharedPreferences pref = await SharedPreferences.getInstance();
//print(pref.getString('cartList').toString());
                        if(pref.getString('product') == null)
                          {
                            print("Exist");
                            pref.setString('product', json.encode(snapshot.data!.toJson()));
                            //pref.setStringList('cartList', [widget.productId.toString()]);
                          }
//                         else
                     {
print(pref);
// SharedPreferences prefs = await SharedPreferences.getInstance();
String productJson = pref.getString('product').toString();
print(productJson);
 if (productJson != null) {
   Map<String, dynamic> productMap = json.decode(productJson);
  //Products product = Products.fromJson(productMap);
   var cart = (productMap as List).map((e) => Products.fromJson(e)).toList();
   cart.add(snapshot.data!);
   print(cart);
    pref.setString('product', json.encode(cart.toString()));

   // String cartJson = pref.getString('product').toString();
   // if (cartJson != null) {
   //   List<dynamic> cartList = json.decode(cartJson);
   //   cartList.forEach((item) {
   //     Map<String, dynamic> itemMap = item;
   //     Products product = Products.fromJson(itemMap);
   //     cart.add(product);
   //   });
   }
   //cart.add(snapshot.data!);

 }
//
//

                        print(pref.getString('product').toString());

                      },
                        child: Text(snapshot.data!.price.toString())),

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
  }
}
