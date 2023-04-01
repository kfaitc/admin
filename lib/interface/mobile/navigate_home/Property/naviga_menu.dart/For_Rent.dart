// ignore_for_file: file_names, prefer_const_constructors, prefer_const_literals_to_create_immutables, sized_box_for_whitespace, dead_code, avoid_print, unnecessary_new, non_constant_identifier_names, prefer_typing_uninitialized_variables
import 'dart:convert';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:http/http.dart' as http;
import '../../../../../model/models/search_model.dart';
import '../Admin_Post/Screen_post.dart';
import '../Admin_Post/Search_property.dart';
import '../Detail_Property.dart';

import 'Home_type.dart';
import '../More.dart';
import 'Price.dart';
import '../Propert_khae.dart';
import '../mapproperty/for_sale_map.dart';
import '../List_Property/List_Sale.dart';

List<String> list1 = <String>[
  'Banteay Meanchey',
  'Siem reap',
  'Phnom penh',
  'Takae'
];
List<String> list = <String>['Sort', 'Price', 'Beds', 'Baths', 'B-Size'];

class For_Rent extends StatefulWidget {
  const For_Rent({super.key});

  @override
  State<For_Rent> createState() => SearchPropertyState();
}

class SearchPropertyState extends State<For_Rent> {
  List<MarkerId> listMarkerIds = List<MarkerId>.empty(growable: true);
  Map<MarkerId, Marker> markers = <MarkerId, Marker>{};
  String dropdownValue = list.first;
  String dropdownValue1 = list1.first;

  late SearchRequestModel requestModel;
  double? lat, log;
  final List<Marker> _markers = <Marker>[];
  CameraPosition? cameraPosition;
  int num = 0;
  List<MapType> style_map = [
    MapType.hybrid,
    MapType.normal,
  ];
  final ScrollController _scrollController = new ScrollController();

  int index = 0;
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
        title: Text(
          "For Rent",
          style: TextStyle(color: Colors.white, fontSize: 18),
        ),
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
                  width: MediaQuery.of(context).size.width * 0.7,
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
                    width: MediaQuery.of(context).size.width * 0.22,
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
            padding: const EdgeInsets.only(left: 10, right: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Properties For Rent',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17),
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
          ////////////////// For Rent
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              height: 500,
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
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(
            builder: (context) {
              return Screen_post();
            },
          ));
        },
        child: Icon(Icons.post_add),
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

class StackReusable extends StatelessWidget {
  final imagere;
  final pricere;
  final sizere;
  const StackReusable({
    required this.imagere,
    required this.pricere,
    required this.sizere,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(2.0),
      child: Stack(
        children: [
          Container(
            height: 10,
            width: 100,
          ),
          Container(
            color: Colors.blue,
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child: Image.asset(
              '$imagere',
              fit: BoxFit.cover,
            ),
          ),
          Positioned(
            top: 5,
            left: 0,
            child: Container(
              height: 30,
              width: 85,
              color: Colors.purple,
              child: const Center(
                child: Text(
                  'FOR RENT',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 10,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ),
          Positioned(
            bottom: 20,
            right: 0,
            child: SizedBox(
              child: Center(
                child: Text(
                  '$pricere dollar',
                  style: const TextStyle(
                      color: Colors.white,
                      fontSize: 12,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            child: SizedBox(
              child: Text(
                'Size: $sizere sqm',
                style: const TextStyle(
                    color: Colors.white,
                    fontSize: 12,
                    fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
