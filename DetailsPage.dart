import 'dart:convert';


import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:http/http.dart' as http;
import 'package:shagroceries/Products.dart';

import '2.dart';
import 'color.dart';
import 'mylist.dart';

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
        body: SingleChildScrollView(
          child: Center(
            child: FutureBuilder<Products>(
              future: FetchAgify(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {

                        return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            children: [
                              GestureDetector(
                                onTap: (){
                                  Navigator.push(context, MaterialPageRoute(builder: (context)=>  DetailsPage(snapshot.data!.id.toString())));
                                },
                                child: Center(
                                  child: Container(
                                    height: 180,
                                    width: 220,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(30),
                                      image: DecorationImage(
                                        image: NetworkImage(snapshot.data!.image.toString()),fit: BoxFit.fill,
                                      ),
                                    ),


                                  ),
                                ),
                              ),
                              Text(snapshot.data!.title.toString()),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text("Visit the Grab Food",style: TextStyle(color: cyn,fontSize: 18),),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      Text("5.0",style: TextStyle(fontSize: 19,color: Colors.black54),),

                                      Row(

                                        children: [RatingBar.builder(
                                          initialRating: 4,
                                          minRating: 1,
                                          direction: Axis.horizontal,
                                          allowHalfRating: true,
                                          itemCount: 5,
                                          itemPadding: EdgeInsets.symmetric(horizontal: 2.0),
                                          itemBuilder: (context, _) => Icon(
                                            Icons.star,
                                            color: Colors.amber,
                                          ),
                                          itemSize: 19,
                                          onRatingUpdate: (rating) {
                                            print(rating);
                                          },
                                        ),
                                          Text("6",style: TextStyle(color: cyn,fontSize: 19),)
                                        ],
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              // Row(
                              //   children: [
                              //     Text(snapshot.data!.title.toString(),style: TextStyle(fontSize: 30),),
                              //   ],
                              // ),
                              Row(
                                children: [
                                  Container(
                                    height: 30,
                                    width: 180,
                                    decoration: BoxDecoration(
                                      border: Border.all(),
                                      shape: BoxShape.rectangle,
                                      color: Colors.black54,
                                    ),
                                    child: Row(
                                      children: [
                                        Text("Rabiya's ",style: TextStyle(color: Colors.white,fontSize: 20),),
                                        Text("Choice",style: TextStyle(color:Colors.deepOrange,fontSize: 20  ),),
                                      ],
                                    ),
                                  ),
                                  Text('  for "10power"',style: TextStyle(fontSize: 20),),
                                ],
                              ),
                              Row(
                                children: [
                                  Text("-34%",style: TextStyle(fontSize: 40,color: red),),
                                  Text("   \u{20B9}",textAlign: TextAlign.start,),
                                  Text(snapshot.data!.price.toString(),style: TextStyle(fontSize: 40),),
                                  Text("(\u{20B9}",style: TextStyle(fontSize: 20)),Text( snapshot.data!.price.toString(),style: TextStyle(fontSize: 20),),
                                ],
                              ),
                              Row(
                                children: [
                                  Text("M.R.P.:",style: TextStyle(fontSize: 20),),
                                  Text("\u{20B9}",textAlign: TextAlign.start,style: TextStyle(decoration: TextDecoration.lineThrough,fontSize: 20),),
                                  Text("129 ",style: TextStyle(decoration: TextDecoration.lineThrough,fontSize: 20),),

                                ],
                              ),
                              Divider(
                                color: Colors.grey,
                                thickness: 2,
                              ),

                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Row(
                                  children: [
                                    Icon(Icons.lock),Text("Total: \u{20B9}",style: TextStyle(fontSize: 22,fontWeight: FontWeight.bold),),Text(snapshot.data!.price.toString(),style: TextStyle(fontSize: 22,fontWeight: FontWeight.bold),)
                                  ],
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Container(
                                  width: 390,
                                  child: RichText(text: TextSpan(
                                      text: "FREE",
                                      style: TextStyle(
                                          fontSize: 15,color: Colors.blueAccent),
                                      children: <TextSpan>
                                      [
                                        TextSpan(text: " delivery",style: TextStyle(fontSize: 19,color: Colors.blueAccent),),
                                        TextSpan(text: " Saturday, 3 June.",style: TextStyle(fontSize: 19,color: Colors.black,fontWeight: FontWeight.bold),),
                                        TextSpan(text: " Order within",style: TextStyle(fontSize: 19,color: Colors.black87),),
                                        TextSpan(text: " 6 hrs 7 mins.",style: TextStyle(fontSize: 19,color: Colors.green),),
                                        TextSpan(text: " Details",style: TextStyle(fontSize: 19,color: Colors.blueAccent),),

                                      ]

                                  )
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Row(
                                  children: [
                                    Icon(Icons.place_outlined),
                                    Text("Delivery to Coimbatore rabi-643002",style: TextStyle(fontSize: 18,color: Colors.blueAccent),),


                                  ],
                                ),
                              ),

                              Row(
                                children: [
                                  Text(" In stock",style: TextStyle(color: Colors.green,fontSize: 30),),

                                ],
                              ),
                              Row(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Container(
                                      height: 40,
                                      width: 80,
                                      decoration: BoxDecoration(
                                          border: Border.all(),
                                          color: Colors.grey,
                                          borderRadius: BorderRadius.circular(7),
                                          boxShadow: [
                                            BoxShadow(
                                              color: Colors.grey,
                                            )
                                          ]
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Row(
                                          children: [
                                            Text( "Qty: 1"),
                                            Icon(Icons.keyboard_arrow_down_sharp),
                                          ],
                                        ),
                                      ),

                                    ),
                                  ),
                                ],
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Container(
                                  height: 40,
                                  width: 370,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(40),
                                    color: Colors.yellow,
                                  ),
                                  child: Center(child: Text("Add to Cart",style: TextStyle(fontWeight: FontWeight.bold),)),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Container(
                                  height: 40,
                                  width: 370,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(40),
                                    color: Colors.deepOrange,
                                  ),
                                  child: Center(child: Text("Buy Now",style: TextStyle(fontWeight: FontWeight.bold),),),
                                ),
                              ),
                              ListTile(
                                leading: Icon(Icons.lock),
                                title: Text("Secure transition"),
                              ),
                              Row(
                                children: [
                                  Container(
                                    width: 300,
                                    child: RichText(text: TextSpan(
                                        style: TextStyle(
                                            fontSize: 15,color: Colors.blueAccent),
                                        children: <TextSpan>
                                        [
                                          TextSpan(text: "Sold by",style: TextStyle(fontSize: 18,color: Colors.black),),
                                          TextSpan(text: " Darshita Etel",style: TextStyle(fontSize: 18,color: Colors.blueAccent,fontWeight: FontWeight.bold),),
                                          TextSpan(text: " and",style: TextStyle(fontSize: 18,color: Colors.black),),
                                          TextSpan(text: " Fulfilled by Rabiya Groceries",style: TextStyle(fontSize: 18,color: Colors.blueAccent),),
                                        ]
                                    ),
                                    ),),
                                ],
                              ),
                              Row(
                                children: [
                                  Text("Gift-wrap available.",style: TextStyle(color: Colors.blueAccent,fontSize: 20),),
                                ],
                              ),
                              Row(
                                children: [
                                  Text("Add to Wish List",style: TextStyle(color: Colors.blueAccent,fontSize: 20),),
                                ],
                              ),

                              Divider(
                                color: Colors.grey,
                                thickness: 2,
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Row(
                                  children: [
                                    Text("About this product",style: TextStyle(
                                        fontSize: 30
                                    ),),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text("Gold winner Refined Sunflower Oil is the result of the componys commitment to quality,health and hygiene.",style: TextStyle(
                                    fontSize: 15
                                ),),
                              ),
                              Divider(
                                color: Colors.grey,
                                // endIndent: 1,

                              ),
                              Row(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text("Nutritional Facts",style: TextStyle(
                                        fontSize: 30
                                    ),),
                                  ),

                                ],

                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  children: [
                                    Row(
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Icon(Icons.circle,size: 10,),
                                        ),
                                        Text("Energy 884 kcal,",style: TextStyle(
                                            fontSize: 15
                                        ),),
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Icon(Icons.circle,size: 10,),
                                        ),
                                        Text("Total Fat 100 g,",style: TextStyle(
                                            fontSize: 15
                                        ),),
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Icon(Icons.circle,size: 10,),
                                        ),
                                        Text("Saturated Acids 48g,",style: TextStyle(
                                            fontSize: 15
                                        ),),
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Icon(Icons.circle,size: 10,),
                                        ),
                                        Text("Monounsaturated acids 30g,",style: TextStyle(
                                            fontSize: 15
                                        ),),
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Icon(Icons.circle,size: 10,),
                                        ),
                                        Text("Polyunsaturated acids",style: TextStyle(
                                            fontSize: 15
                                        ),),
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Icon(Icons.circle,size: 10,),
                                        ),
                                        Text("Trans Fatty Acids 10-18 g",style: TextStyle(
                                            fontSize: 15
                                        ),),
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Icon(Icons.circle,size: 10,),
                                        ),
                                        Text("Vitamin A",style: TextStyle(
                                            fontSize: 15
                                        ),),
                                      ],
                                    ),
                                    Divider(

                                      color: Colors.black,
                                    ),
                                    Row(
                                      children: [
                                        Text("Recipes",style: TextStyle(
                                            fontSize: 30,color: Colors.brown,fontWeight: FontWeight.bold
                                        ),),
                                        // Container(
                                        //   height: 120,
                                        //
                                        //   decoration: BoxDecoration(
                                        //   ),
                                        //   child: ListView.builder(
                                        //       scrollDirection: Axis.horizontal,
                                        //       itemCount: lis.length,
                                        //       itemBuilder: (BuildContext context,index)
                                        //       {
                                        //         return Padding(
                                        //           padding: const EdgeInsets.all(8.0),
                                        //           child: Column(
                                        //             children: [
                                        //               Container(
                                        //                 height: 70,
                                        //                 width: 70,
                                        //                 decoration: BoxDecoration(
                                        //                   borderRadius: BorderRadius.circular(30),
                                        //                   image: DecorationImage(
                                        //                     image: AssetImage(lis[index].image),fit: BoxFit.fill,
                                        //                   ),
                                        //                 ),
                                        //               ),
                                        //               Text(lis[index].text),
                                        //             ],
                                        //           ),
                                        //         );
                                        //       }
                                        //   ),
                                        // ),
                                      ],

                                    ),
                                    Container(
                                      child: GestureDetector(
                                        onTap: ()
                                        {
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(builder: (context) => const Myl()),
                                          );
                                        },
                                        child: Column(
                                          children: [
                                            Container(
                                              height: 120,
                                              decoration: BoxDecoration(
                                              ),
                                              child: ListView.builder(
                                                  scrollDirection: Axis.horizontal,
                                                  itemCount: lise.length,
                                                  itemBuilder: (BuildContext context,index)
                                                  {
                                                    return Padding(
                                                      padding: const EdgeInsets.all(8.0),
                                                      child: Column(
                                                        children: [
                                                          Container(
                                                            height: 70,
                                                            width: 70,
                                                            decoration: BoxDecoration(
                                                              borderRadius: BorderRadius.circular(30),
                                                              image: DecorationImage(
                                                                image: AssetImage(lise[index].image),fit: BoxFit.fill,
                                                              ),
                                                            ),

                                                          ),
                                                          Text(lise[index].text),

                                                        ],
                                                      ),
                                                    );
                                                  }
                                              ),

                                            ),
                                            // ElevatedButton(
                                            //
                                            //
                                            //   onPressed: (){}, child: Text("Add to cart",style: TextStyle(backgroundColor: Colors.yellow),),),
                                          ],
                                        ),

                                      ),

                                    ),
                                    Divider(
                                      color: Colors.grey,
                                      endIndent: 1,

                                    ),
                                    Row(
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Text("   View All Recipes  ",style: TextStyle(color: Colors.red,fontWeight: FontWeight.bold,fontSize: 20),),

                                        ),
                                        GestureDetector(
                                          // Myl(),
                                            onTap: ()
                                            {
                                              Navigator.push(
                                                context,
                                                MaterialPageRoute(builder: (context) => const  Myl()),
                                              );
                                            },
                                            child: Icon(Icons.arrow_forward_ios,color: Colors.red,)),
                                      ],
                                    ),
                                    Divider(
                                      color: Colors.black,
                                      height: 4,
                                      // endIndent: 1,

                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(15.0),
                                      child: Text("Thats All Folks!"),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
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
      ),
    );
  }
}
