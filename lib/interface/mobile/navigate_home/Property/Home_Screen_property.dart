// ignore_for_file: camel_case_types, prefer_const_constructors, prefer_const_literals_to_create_immutables, sized_box_for_whitespace, unnecessary_new, non_constant_identifier_names, prefer_typing_uninitialized_variables, unused_import, unnecessary_string_interpolations, avoid_print

import 'dart:convert';
import 'dart:math';

import 'package:flutter/material.dart';
import 'Admin_Post/Search_property.dart';
import 'All_khae_cambodia.dart';
import 'Detail_Property.dart';
import 'List_Property/List_Rent.dart';
import 'naviga_menu.dart/For_Rent.dart';
import 'naviga_menu.dart/Home_type.dart';
import 'More.dart';
import 'naviga_menu.dart/Price.dart';
import 'Propert_khae.dart';
import 'List_Property/List_Sale.dart';
import 'package:http/http.dart' as http;

class Home_Screen_property extends StatefulWidget {
  const Home_Screen_property({super.key});

  @override
  State<Home_Screen_property> createState() => _Home_Screen_propertyState();
}

class _Home_Screen_propertyState extends State<Home_Screen_property> {
  @override
  void initState() {
    Property_Sale_image(property_type_id);
    Property_Sale(property_type_id);

    super.initState();
  }

  int? property_type_id = 123;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 20, 20, 163),
        centerTitle: true,
        title: Text('Property'),
      ),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              'Find Your New House',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 10, left: 10, top: 10),
            child: Row(
              children: [
                Container(
                  height: 50,
                  width: MediaQuery.of(context).size.width * 0.5,
                  child: Padding(
                    padding: const EdgeInsets.all(1.0),
                    child: TextField(
                      decoration: InputDecoration(
                        prefixIcon: Icon(Icons.search),
                        border: OutlineInputBorder(),
                        hintText: 'Search listing here...',
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
                InkWell(
                  onTap: () {},
                  child: Container(
                    height: 50,
                    width: MediaQuery.of(context).size.width * 0.3,
                    decoration: BoxDecoration(
                        color: Color.fromARGB(255, 20, 20, 163),
                        borderRadius: BorderRadius.circular(10)),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          Icon(
                            Icons.search,
                            color: Colors.white,
                          ),
                          Text(
                            'Search',
                            style: TextStyle(color: Colors.white),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.all(8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                InkWell(
                  onTap: () {},
                  child: Container(
                    alignment: Alignment.center,
                    height: 30,
                    width: MediaQuery.of(context).size.width * 0.22,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Color.fromARGB(255, 54, 54, 246),
                        border: Border.all(
                            width: 2,
                            color: Color.fromARGB(255, 139, 128, 128))),
                    child: Text(
                      'Buy',
                      style: TextStyle(
                          fontWeight: FontWeight.bold, color: Colors.white),
                    ),
                  ),
                ),
                SizedBox(
                  width: 20,
                ),
                InkWell(
                  onTap: () {},
                  child: Container(
                    alignment: Alignment.center,
                    height: 30,
                    width: MediaQuery.of(context).size.width * 0.22,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Color.fromARGB(255, 54, 54, 246),
                        border: Border.all(
                            width: 2,
                            color: Color.fromARGB(255, 139, 128, 128))),
                    child: Text(
                      'Rent',
                      style: TextStyle(
                          fontWeight: FontWeight.bold, color: Colors.white),
                    ),
                  ),
                ),
                SizedBox(
                  width: 20,
                ),
                InkWell(
                  onTap: () {},
                  child: Container(
                    alignment: Alignment.center,
                    height: 30,
                    width: MediaQuery.of(context).size.width * 0.22,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Color.fromARGB(255, 54, 54, 246),
                        border: Border.all(
                            width: 2,
                            color: Color.fromARGB(255, 139, 128, 128))),
                    child: Text(
                      'Sell',
                      style: TextStyle(
                          fontWeight: FontWeight.bold, color: Colors.white),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(''),
              TextButton(
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(
                      builder: (context) {
                        return ALl_Khae_cambodia();
                      },
                    ));
                  },
                  child: Text('View All')),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(left: 10, right: 10),
            child: Container(
              height: 150,
              width: double.infinity,
              child: Property_25(),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              height: 70,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  Column(
                    children: [
                      IconButton(
                          onPressed: () {},
                          icon: Icon(
                            Icons.home,
                            color: Colors.blue,
                          )),
                      Text(
                        "For Sale",
                        style: TextStyle(
                          fontSize: 10,
                          color: Colors.blue,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Column(
                    children: [
                      IconButton(
                          onPressed: () {
                            setState(() {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => For_Rent()),
                              );
                            });
                          },
                          icon: Icon(Icons.home)),
                      Text(
                        "For Rent",
                        style: TextStyle(fontSize: 10),
                      ),
                    ],
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Column(
                    children: [
                      IconButton(
                          onPressed: () {
                            setState(() {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => Home_Type()),
                              );
                            });
                          },
                          icon: Icon(Icons.type_specimen)),
                      Text(
                        "Home Type",
                        style: TextStyle(fontSize: 10),
                      ),
                    ],
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Column(
                    children: [
                      IconButton(
                          onPressed: () {
                            setState(() {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => Price()),
                              );
                            });
                          },
                          icon: Icon(Icons.price_change)),
                      Text(
                        "Price",
                        style: TextStyle(fontSize: 10),
                      ),
                    ],
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Column(
                    children: [
                      IconButton(
                          onPressed: () {
                            setState(() {
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => More()),
                              );
                            });
                          },
                          icon: Icon(Icons.more)),
                      Text(
                        "More",
                        style: TextStyle(fontSize: 10),
                      ),
                    ],
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Column(
                    children: [
                      IconButton(
                          onPressed: () {
                            setState(() {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => SearchProperty()),
                              );
                            });
                          },
                          icon: Icon(Icons.search)),
                      Text(
                        "Search",
                        style: TextStyle(fontSize: 10),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 10, right: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Properties For Sale',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                ),
                TextButton(
                    onPressed: () {
                      setState(() {
                        // property_type_id = random.nextInt(10000);
                        // print('oooooooooooooo$property_type_id');
                      });
                      Navigator.push(context, MaterialPageRoute(
                        builder: (context) {
                          return List_Sale();
                        },
                      ));
                    },
                    child: Text(
                        'View All ${list2_Sale1.length.toString()} Listings')),
              ],
            ),
          ),
          ////////////////// For sale
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              height: 370,
              color: Color.fromARGB(255, 252, 246, 246),
              width: double.infinity,
              child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 9,
                  mainAxisSpacing: 9,
                  childAspectRatio: 1,
                ),
                itemCount: list2_Sale1.length,
                itemBuilder: (BuildContext context, index) {
                  return GridTile(
                      child: InkWell(
                    onTap: () {
                      detail_property_id(
                          index, list2_Sale2[index]['id_ptys'].toString());
                      setState(() {
                        print(
                            'ID = ${list2_Sale2[index]['id_ptys'].toString()}');
                      });
                    },
                    child: Container(
                      decoration: BoxDecoration(
                          color: Color.fromARGB(255, 222, 221, 215),
                          borderRadius: BorderRadius.circular(10)),
                      width: MediaQuery.of(context).size.width * 0.4,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          children: [
                            Container(
                              height: 100,
                              width: MediaQuery.of(context).size.width * 0.44,
                              child: Image.network(
                                '${list2_Sale1[index]['url'].toString()}',
                                // 'https://www.oneclickonedollar.com/laravel_kfa_2023/public/data_imgs_kfa/propery_sale/22.jpg',
                                fit: BoxFit.cover,
                              ),
                            ),
                            SizedBox(
                              height: 1,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Column(
                                  children: [
                                    Text(
                                      'price :',
                                      style: TextStyle(fontSize: 12),
                                    ),
                                    SizedBox(
                                      height: 3,
                                    ),
                                    Text(
                                      'land :',
                                      style: TextStyle(fontSize: 12),
                                    ),
                                    SizedBox(
                                      height: 3,
                                    ),
                                    Text(
                                      'sqm :',
                                      style: TextStyle(fontSize: 12),
                                    ),
                                    // SizedBox(
                                    //   height: 3,
                                    // ),
                                    // Text(
                                    //   'bed :',
                                    //   style: TextStyle(fontSize: 12),
                                    // ),
                                    // SizedBox(
                                    //   height: 3,
                                    // ),
                                    // Text(
                                    //   'bath :',
                                    //   style: TextStyle(fontSize: 12),
                                    // ),
                                    // SizedBox(
                                    //   height: 3,
                                    // ),
                                    // Text(
                                    //   'type :',
                                    //   style: TextStyle(fontSize: 12),
                                    // ),
                                    // SizedBox(
                                    //   height: 3,
                                    // ),
                                    // Text(
                                    //   'address :',
                                    //   style: TextStyle(fontSize: 12),
                                    // ),
                                  ],
                                ),
                                Column(
                                  children: [
                                    Text(
                                      '${list2_Sale2[index]['land'].toString()}',
                                      style: TextStyle(fontSize: 12),
                                    ),
                                    SizedBox(
                                      height: 3,
                                    ),
                                    Text(
                                      '${list2_Sale2[index]['sqm'].toString()}',
                                      style: TextStyle(fontSize: 12),
                                    ),
                                    SizedBox(
                                      height: 3,
                                    ),
                                    Text(
                                      '${list2_Sale2[index]['address'].toString()}',
                                      style: TextStyle(fontSize: 12),
                                    ),
                                    // SizedBox(
                                    //   height: 3,
                                    // ),
                                    // Text(
                                    //   'bed :',
                                    //   style: TextStyle(fontSize: 12),
                                    // ),
                                    // SizedBox(
                                    //   height: 3,
                                    // ),
                                    // Text(
                                    //   'bath :',
                                    //   style: TextStyle(fontSize: 12),
                                    // ),
                                    // SizedBox(
                                    //   height: 3,
                                    // ),
                                    // Text(
                                    //   'type :',
                                    //   style: TextStyle(fontSize: 12),
                                    // ),
                                    // SizedBox(
                                    //   height: 3,
                                    // ),
                                    // Text(
                                    //   'address :',
                                    //   style: TextStyle(fontSize: 12),
                                    // ),
                                  ],
                                )
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                  ));
                },
              ),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 10, right: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Properties For Rent',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                ),
                TextButton(
                    onPressed: () {
                      setState(() {
                        // property_type_id = random.nextInt(10000);
                        // print('oooooooooooooo$property_type_id');
                      });
                      Navigator.push(context, MaterialPageRoute(
                        builder: (context) {
                          return List_Rent();
                        },
                      ));
                    },
                    child: Text(
                        'View All ${list2_Sale1.length.toString()} Listings')),
              ],
            ),
          ),
          ////////////////// For Rent
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              height: 370,
              color: Color.fromARGB(255, 252, 246, 246),
              width: double.infinity,
              child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 9,
                  mainAxisSpacing: 9,
                  childAspectRatio: 1,
                ),
                itemCount: list2_Sale1.length,
                itemBuilder: (BuildContext context, index) {
                  return GridTile(
                      child: InkWell(
                    onTap: () {
                      detail_property_id(
                          index, list2_Sale2[index]['id_ptys'].toString());
                      setState(() {
                        print(
                            'ID = ${list2_Sale2[index]['id_ptys'].toString()}');
                      });
                    },
                    child: Container(
                      decoration: BoxDecoration(
                          color: Color.fromARGB(255, 222, 221, 215),
                          borderRadius: BorderRadius.circular(10)),
                      width: MediaQuery.of(context).size.width * 0.4,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          children: [
                            Container(
                              height: 100,
                              width: MediaQuery.of(context).size.width * 0.44,
                              child: Image.network(
                                '${list2_Sale1[index]['url'].toString()}',
                                // 'https://www.oneclickonedollar.com/laravel_kfa_2023/public/data_imgs_kfa/propery_sale/22.jpg',
                                fit: BoxFit.cover,
                              ),
                            ),
                            SizedBox(
                              height: 1,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Column(
                                  children: [
                                    Text(
                                      'price :',
                                      style: TextStyle(fontSize: 12),
                                    ),
                                    SizedBox(
                                      height: 3,
                                    ),
                                    Text(
                                      'land :',
                                      style: TextStyle(fontSize: 12),
                                    ),
                                    SizedBox(
                                      height: 3,
                                    ),
                                    Text(
                                      'sqm :',
                                      style: TextStyle(fontSize: 12),
                                    ),
                                    // SizedBox(
                                    //   height: 3,
                                    // ),
                                    // Text(
                                    //   'bed :',
                                    //   style: TextStyle(fontSize: 12),
                                    // ),
                                    // SizedBox(
                                    //   height: 3,
                                    // ),
                                    // Text(
                                    //   'bath :',
                                    //   style: TextStyle(fontSize: 12),
                                    // ),
                                    // SizedBox(
                                    //   height: 3,
                                    // ),
                                    // Text(
                                    //   'type :',
                                    //   style: TextStyle(fontSize: 12),
                                    // ),
                                    // SizedBox(
                                    //   height: 3,
                                    // ),
                                    // Text(
                                    //   'address :',
                                    //   style: TextStyle(fontSize: 12),
                                    // ),
                                  ],
                                ),
                                Column(
                                  children: [
                                    Text(
                                      '${list2_Sale2[index]['land'].toString()}',
                                      style: TextStyle(fontSize: 12),
                                    ),
                                    SizedBox(
                                      height: 3,
                                    ),
                                    Text(
                                      '${list2_Sale2[index]['sqm'].toString()}',
                                      style: TextStyle(fontSize: 12),
                                    ),
                                    SizedBox(
                                      height: 3,
                                    ),
                                    Text(
                                      '${list2_Sale2[index]['address'].toString()}',
                                      style: TextStyle(fontSize: 12),
                                    ),
                                    // SizedBox(
                                    //   height: 3,
                                    // ),
                                    // Text(
                                    //   'bed :',
                                    //   style: TextStyle(fontSize: 12),
                                    // ),
                                    // SizedBox(
                                    //   height: 3,
                                    // ),
                                    // Text(
                                    //   'bath :',
                                    //   style: TextStyle(fontSize: 12),
                                    // ),
                                    // SizedBox(
                                    //   height: 3,
                                    // ),
                                    // Text(
                                    //   'type :',
                                    //   style: TextStyle(fontSize: 12),
                                    // ),
                                    // SizedBox(
                                    //   height: 3,
                                    // ),
                                    // Text(
                                    //   'address :',
                                    //   style: TextStyle(fontSize: 12),
                                    // ),
                                  ],
                                )
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                  ));
                },
              ),
            ),
          ),
        ],
      ),
    );
  }

  List list2_Sale1 = [];
  void Property_Sale_image(property_type_id) async {
    var jsonData;
    final response = await http.get(Uri.parse(
        'https://www.oneclickonedollar.com/laravel_kfa_2023/public/api/Image_ptys_get/$property_type_id'));

    if (response.statusCode == 200) {
      jsonData = jsonDecode(response.body);
      list2_Sale1 = jsonData;
      setState(() {
        list2_Sale1;
        // print('${list2_Sale1[0]['url'].toString()}');
      });
    }
  }

  Random random = new Random();
  List list2_Sale2 = [];
  void Property_Sale(property_type_id) async {
    var jsonData;
    final response = await http.get(Uri.parse(
        'https://www.oneclickonedollar.com/laravel_kfa_2023/public/api/property_sale_get/$property_type_id'));

    if (response.statusCode == 200) {
      jsonData = jsonDecode(response.body);
      list2_Sale2 = jsonData;
      setState(() {
        list2_Sale2;
        // print('$list2_Sale2');
      });
    }
  }

  List list2_Sale_id = [];
  int? id;
  void Property_Sale_id(id) async {
    var jsonData;
    final response = await http.get(Uri.parse(
        'https://www.oneclickonedollar.com/laravel_kfa_2023/public/api/property_sale_get/$id'));

    if (response.statusCode == 200) {
      jsonData = jsonDecode(response.body);
      list2_Sale_id = jsonData;
      setState(() {
        list2_Sale2;
        // print('$list2_Sale2');
      });
    }
  }

  Future<void> detail_property_id(int index, String ID) async {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => Detail_property(
          id: ID,
        ),
      ),
    );
  }
}
