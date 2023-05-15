// // ignore_for_file: file_names, prefer_const_constructors, prefer_const_literals_to_create_immutables, sized_box_for_whitespace, dead_code, avoid_print, unnecessary_string_interpolations, non_constant_identifier_names, prefer_typing_uninitialized_variables, unused_field, unnecessary_new, avoid_unnecessary_containers, unused_import, camel_case_types, must_be_immutable, unnecessary_null_comparison, prefer_const_constructors_in_immutables, unnecessary_brace_in_string_interps, empty_statements, curly_braces_in_flow_control_structures, prefer_function_declarations_over_variables

// import 'dart:convert';

// import 'package:cached_network_image/cached_network_image.dart';

// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:google_maps_flutter/google_maps_flutter.dart';

// import '../../models/search_model.dart';
// import '../Getx_api/for_screen.dart';
// import '../List_all_Screen/List__Sale_all.dart';
// import '../verval_property/Verbal_add.dart';
// import '../Detail_Screen/Detail_all_list_sale.dart';

// import '../map_property/Google_Sale_map.dart';
// import '../map_property/Google_Sale_map_full.dart';
// import 'package:http/http.dart' as http;

// List<String> list1 = <String>[
//   'Banteay Meanchey',
//   'Siem reap',
//   'Phnom penh',
//   'Takae'
// ];
// List<String> list = <String>['Sort', 'Price', 'Beds', 'Baths', 'B-Size'];

// class For_Sale extends StatefulWidget {
//   For_Sale({
//     super.key,
//   });
//   // String? property_type_id;
//   // final String? id_image;

//   @override
//   State<For_Sale> createState() => SearchPropertyState();
// }

// class SearchPropertyState extends State<For_Sale> {
//   int? indexNN;
//   List<MarkerId> listMarkerIds = List<MarkerId>.empty(growable: true);
//   Map<MarkerId, Marker> markers = <MarkerId, Marker>{};
//   String dropdownValue = list.first;
//   String dropdownValue1 = list1.first;

//   late SearchRequestModel requestModel;
//   double? lat, log;
//   final List<Marker> _markers = <Marker>[];
//   CameraPosition? cameraPosition;
//   int num = 0;
//   List<MapType> style_map = [
//     MapType.hybrid,
//     MapType.normal,
//   ];
//   final ScrollController _scrollController = new ScrollController();
//   // int? property_type_id;
//   bool _isLoading = true;

//   @override
//   void initState() {
//     super.initState();
//     _initData();
//   }

//   final controller_list = controller_for_sale();

//   Future<void> _initData() async {
//     _isLoading = true;
//     await Future.wait([
//       controller_list.value_all_list_sale(),
//       controller_list.Image_all_list_Sale(),
//       controller_list.urgent_all_list_Sale(),
//       controller_list.hometype_all_list_Sale(),
//     ]);

//     setState(() {
//       _isLoading = false;
//     });
//     // All three functions have completed at this point
//     // Do any additional initialization here
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: Color.fromARGB(255, 20, 20, 163),
//         centerTitle: true,
//         title: Text('For Sale'),
//       ),
//       body: _isLoading
//           ? Center(
//               child: CircularProgressIndicator(),
//             )
//           : SafeArea(
//               child: Container(
//                 height: double.infinity,
//                 width: double.infinity,
//                 child: SingleChildScrollView(
//                   child: Column(
//                     children: [
//                       // for (int i = 0; i < _items!.length; i++)
//                       //   Text('cummune  = ${cummune_a![i]}'),
//                       // TextButton(
//                       //     onPressed: () {
//                       //       Property_Sale_id();
//                       //       // Commune_25_all(propery_index);
//                       //     },
//                       //     child: Text('Go')),
//                       Padding(
//                         padding:
//                             const EdgeInsets.only(right: 10, left: 10, top: 10),
//                         child: Container(
//                           height: MediaQuery.of(context).size.height * 0.3,
//                           width: double.infinity,
//                           child: Map_Sale(
//                             get_commune: (value) {},
//                             get_district: (value) {},
//                             get_lat: (value) {},
//                             get_log: (value) {},
//                             get_max1: (value) {},
//                             get_min1: (value) {},
//                             get_min2: (value) {},
//                             get_province: (value) {},
//                             get_max2: (value) {},
//                           ),
//                         ),
//                       ),
//                       SizedBox(
//                         height: 10,
//                       ),
//                       Padding(
//                         padding: const EdgeInsets.only(left: 10, right: 10),
//                         child: InkWell(
//                           onTap: () {
//                             Get.to(Map_Sale_full(
//                               get_commune: (value) {},
//                               get_district: (value) {},
//                               get_lat: (value) {},
//                               get_log: (value) {},
//                               get_max1: (value) {},
//                               get_min1: (value) {},
//                               get_min2: (value) {},
//                               get_province: (value) {},
//                               get_max2: (value) {},
//                             ));
//                           },
//                           child: Container(
//                             decoration: BoxDecoration(
//                                 borderRadius: BorderRadius.circular(10),
//                                 color: Color.fromARGB(255, 71, 13, 158)),
//                             height: 40,
//                             width: double.infinity,
//                             child: Padding(
//                               padding: const EdgeInsets.all(8.0),
//                               child: Row(
//                                 children: [
//                                   Text(
//                                     'Full Map',
//                                     style: TextStyle(
//                                         fontWeight: FontWeight.bold,
//                                         color: Colors.white,
//                                         fontSize: 15),
//                                   ),
//                                   Icon(
//                                     Icons.map_outlined,
//                                     color: Colors.white,
//                                     size: 20,
//                                   )
//                                 ],
//                               ),
//                             ),
//                           ),
//                         ),
//                       ),
//                       Padding(
//                         padding: const EdgeInsets.only(left: 15, right: 15),
//                         child: Row(
//                           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                           children: [
//                             Text(
//                               'List For Sale (${controller_list.list_value_all.length})',
//                               style: TextStyle(
//                                   fontWeight: FontWeight.bold, fontSize: 14),
//                             ),
//                             TextButton(
//                                 onPressed: () {
//                                   setState(() {
//                                     // property_type_id = random.nextInt(10000);
//                                     // print('oooooooooooooo$property_type_id');
//                                   });
//                                   Navigator.push(context,
//                                       MaterialPageRoute(builder: (context) {
//                                     return List_Sale_All(
//                                       hometype_api:
//                                           controller_list.hometype_Sale_all,
//                                       get_all_homeytpe:
//                                           controller_list.hometype_Sale_all,
//                                       // indexv: index.toString(),
//                                       list2_Sale_imaeg:
//                                           controller_list.list_Image_Sale_all,
//                                       list2_Sale_urgent:
//                                           controller_list.urgent_Sale_all,
//                                       list2_Sale_value:
//                                           controller_list.list_value_all,
//                                     );
//                                   }));
//                                 },
//                                 child: Text('Show all')),
//                           ],
//                         ),
//                       ),
//                       Text(controller_list.list_Image_Sale_all.length
//                           .toString()),
//                       Padding(
//                         padding: const EdgeInsets.all(8.0),
//                         child: Container(
//                           height: MediaQuery.of(context).size.height * 0.5,
//                           width: double.infinity,
//                           child: GridView.builder(
//                             itemCount:
//                                 controller_list.list_Image_Sale_all.length,
//                             gridDelegate:
//                                 SliverGridDelegateWithFixedCrossAxisCount(
//                               crossAxisCount: 2,
//                               crossAxisSpacing: 9,
//                               mainAxisSpacing: 9,
//                               childAspectRatio: 1,
//                             ),
//                             itemBuilder: (BuildContext context, int index) {
//                               return InkWell(
//                                 onTap: () {
//                                   detail_property_sale(
//                                       index,
//                                       controller_list.list_Image_Sale_all[index]
//                                               ['id_ptys']
//                                           .toString());
//                                   setState(() {
//                                     // print(
//                                     //     'ID = ${list2_Sale_id[index]['id_ptys'].toString()}');
//                                   });
//                                 },
//                                 child: Stack(
//                                   children: [
//                                     Container(
//                                         height:
//                                             MediaQuery.of(context).size.height *
//                                                 0.5,
//                                         width:
//                                             MediaQuery.of(context).size.width *
//                                                 0.5,
//                                         child: CachedNetworkImage(
//                                           imageUrl: controller_list
//                                               .list_Image_Sale_all[index]['url']
//                                               .toString(),
//                                           fit: BoxFit.cover,
//                                           progressIndicatorBuilder: (context,
//                                                   url, downloadProgress) =>
//                                               Center(
//                                             child: CircularProgressIndicator(
//                                                 value:
//                                                     downloadProgress.progress),
//                                           ),
//                                           errorWidget: (context, url, error) =>
//                                               Icon(Icons.error),
//                                         )

//                                         // child: Image.network(
//                                         //   '${obj.url.toString()}',
//                                         //   fit: BoxFit.cover,
//                                         // ),
//                                         ),
//                                     Positioned(
//                                       top: 132,
//                                       child: Container(
//                                         color: Color.fromARGB(255, 8, 103, 13),
//                                         height:
//                                             MediaQuery.of(context).size.height *
//                                                 0.05,
//                                         width:
//                                             MediaQuery.of(context).size.width *
//                                                 0.5,
//                                         child: Column(
//                                           children: [
//                                             Padding(
//                                               padding: const EdgeInsets.only(
//                                                   left: 10),
//                                               child: Row(
//                                                 children: [
//                                                   Text(
//                                                     'Price :${controller_list.list_value_all[index]['price'].toString()}',
//                                                     style: TextStyle(
//                                                         fontWeight:
//                                                             FontWeight.bold,
//                                                         color: Color.fromARGB(
//                                                             255, 251, 250, 250),
//                                                         fontSize: 10),
//                                                   ),
//                                                   Text(
//                                                     '\$',
//                                                     style: TextStyle(
//                                                         fontWeight:
//                                                             FontWeight.bold,
//                                                         color: Color.fromARGB(
//                                                             255, 119, 234, 5),
//                                                         fontSize: 10),
//                                                   ),
//                                                   SizedBox(
//                                                     width: 5,
//                                                   ),
//                                                   Text(
//                                                     'Land :${controller_list.list_value_all[index]['land'].toString()} sqm',
//                                                     style: TextStyle(
//                                                         fontWeight:
//                                                             FontWeight.bold,
//                                                         color: Color.fromARGB(
//                                                             255, 250, 249, 249),
//                                                         fontSize: 10),
//                                                   ),
//                                                   SizedBox(
//                                                     width: 5,
//                                                   ),
//                                                 ],
//                                               ),
//                                             ),
//                                             SizedBox(
//                                               height: 5,
//                                             ),
//                                             Padding(
//                                               padding: const EdgeInsets.only(
//                                                   left: 10),
//                                               child: Row(
//                                                 children: [
//                                                   Text(
//                                                     'bed : ${controller_list.list_value_all[index]['bed'].toString()}',
//                                                     style: TextStyle(
//                                                         fontWeight:
//                                                             FontWeight.bold,
//                                                         color: Colors.white,
//                                                         fontSize: 10),
//                                                   ),
//                                                   SizedBox(
//                                                     width: 5,
//                                                   ),
//                                                   Text(
//                                                     'bath : ${controller_list.list_value_all[index]['bath'].toString()}',
//                                                     style: TextStyle(
//                                                         fontWeight:
//                                                             FontWeight.bold,
//                                                         color: Colors.white,
//                                                         fontSize: 10),
//                                                   ),
//                                                 ],
//                                               ),
//                                             )
//                                           ],
//                                         ),
//                                       ),
//                                     ),
//                                     Positioned(
//                                       top: 10,
//                                       left: 10,
//                                       child: Container(
//                                         alignment: Alignment.center,
//                                         height: 30,
//                                         width: 60,
//                                         decoration: BoxDecoration(
//                                             color: Color.fromARGB(
//                                                 255, 109, 160, 6),
//                                             borderRadius:
//                                                 BorderRadius.circular(10)),
//                                         child: Text(
//                                           'For Sale',
//                                           style: TextStyle(
//                                               fontWeight: FontWeight.bold,
//                                               color: Color.fromARGB(
//                                                   255, 250, 246, 245),
//                                               fontSize: 12),
//                                         ),
//                                       ),
//                                     ),
//                                     (controller_list.urgent_Sale_all != null)
//                                         ? Positioned(
//                                             top: 105,
//                                             child: Container(
//                                               alignment: Alignment.center,
//                                               decoration: BoxDecoration(
//                                                   color: Color.fromARGB(
//                                                       255, 106, 7, 86),
//                                                   borderRadius:
//                                                       BorderRadius.circular(5)),
//                                               height: 25,
//                                               width: 50,
//                                               child: Text(
//                                                 '${controller_list.urgent_Sale_all[index]['urgent'].toString()}',
//                                                 style: TextStyle(
//                                                     fontSize: 12,
//                                                     color: Colors.white),
//                                               ),
//                                             ))
//                                         : SizedBox()
//                                   ],
//                                 ),
//                               );
//                             },
//                           ),
//                         ),
//                       ),
//                       // Row(
//                       //   mainAxisAlignment: MainAxisAlignment.end,
//                       //   children: [
//                       //     TextButton(
//                       //         onPressed: () {
//                       //           setState(() {
//                       //             // property_type_id = random.nextInt(10000);
//                       //             // print('oooooooooooooo$property_type_id');
//                       //           });
//                       //           // Navigator.push(context, MaterialPageRoute(
//                       //           //   builder: (context) {
//                       //           //     return List_Sale(id_image: ,);
//                       //           //   },
//                       //           // ));
//                       //         },
//                       //         child: Text('Show all')),
//                       //   ],
//                       // ),
//                     ],
//                   ),
//                 ),
//               ),
//             ),
//       floatingActionButton: FloatingActionButton(
//         onPressed: () {
//           Navigator.push(context, MaterialPageRoute(
//             builder: (context) {
//               return Add_verbal_property();
//             },
//           ));
//         },
//         child: Icon(Icons.post_add),
//       ),
//     );
//   }

//   // List list2_Sale12 = [];
//   // Future<void> Property_Sale_image() async {
//   //   var jsonData;
//   //   final response = await http.get(Uri.parse(
//   //       'https://www.oneclickonedollar.com/laravel_kfa_2023/public/api/Image_ptys_get_all'));

//   //   if (response.statusCode == 200) {
//   //     jsonData = jsonDecode(response.body)['data'];
//   //     list2_Sale12 = jsonData;
//   //     setState(() {
//   //       list2_Sale12;
//   //       // print('Image = ${list2_Sale1[0]['url'].toString()}');
//   //     });
//   //   }
//   // }

//   // List list2_Sale_id5 = [];
//   // int? id_ptys;
//   // Future<void> Urgent() async {
//   //   var jsonData;
//   //   final response = await http.get(Uri.parse(
//   //       'https://www.oneclickonedollar.com/laravel_kfa_2023/public/api/get_all_Urgent'));

//   //   if (response.statusCode == 200) {
//   //     jsonData = jsonDecode(response.body)['data'];
//   //     list2_Sale_id5 = jsonData;
//   //     setState(() {
//   //       list2_Sale_id5;

//   //       //  var id_ptys= list2_Sale_id[index]['id_ptys'].toString();
//   //       // print('$list2_Sale2');
//   //     });
//   //   }
//   // }

//   // String? propery_index;
//   // List list2_Sale_id = [];
//   // int? id;
//   // Future<void> Property_Sale_id() async {
//   //   var jsonData;
//   //   final response = await http.get(Uri.parse(
//   //       'https://www.oneclickonedollar.com/laravel_kfa_2023/public/api/property_sale_get'));

//   //   if (response.statusCode == 200) {
//   //     jsonData = jsonDecode(response.body)['data'];
//   //     list2_Sale_id = jsonData;
//   //     setState(() {
//   //       list2_Sale_id;
//   //       indexNN = list2_Sale_id.length;
//   //       // print('index = $indexNN');
//   //       // for (int i = 0; i < list2_Sale_id.length; i++) {
//   //       //   indexNN = i;
//   //       //   propery_index = list2_Sale12[i]['property_type_id'].toString();
//   //       //   // print('List$i = ${propery_index}');
//   //       //   // Commune_25_all(propery_index);
//   //       // }
//   //     });
//   //   }
//   // }

//   // List? get_all_homeytpe;
//   // Future<void> Hometype() async {
//   //   var jsonData;
//   //   final response = await http.get(Uri.parse(
//   //       'https://www.oneclickonedollar.com/laravel_kfa_2023/public/api/get_all_homeytpe'));

//   //   if (response.statusCode == 200) {
//   //     jsonData = jsonDecode(response.body)['data'];
//   //     get_all_homeytpe = jsonData;

//   //     setState(() {
//   //       get_all_homeytpe;
//   //       // print('$list2_Sale2');
//   //     });
//   //   }
//   // }

//   Future<void> detail_property_sale(int index, String ID) async {
//     // Navigator.push(
//     //   context,
//     //   MaterialPageRoute(
//     //     builder: (context) => Detail_property_sale_all(
//     //       indexv: index.toString(),
//     //       list2_Sale12: list2_Sale12,
//     //       list2_Sale_id5: list2_Sale_id5,
//     //       list2_Sale_id: list2_Sale_id,
//     //       // property_id: list2_Sale_id[index]['property_type_id'].toString(),
//     //       // id_image: list2_Sale_id[index]['id_ptys'].toString(),
//     //     ),
//     //   ),
//     // );
//   }

//   String? Commune_25_all_property;
//   List? _items;
//   int? a = 0;
//   // List? cummune_a;
//   // Future<void> Commune_25_all(propery_index) async {
//   //   var jsonData;
//   //   final response = await http.get(Uri.parse(
//   //       'https://www.oneclickonedollar.com/laravel_kfa_2023/public/api/Commune_25/${propery_index}'));

//   //   if (response.statusCode == 200) {
//   //     jsonData = jsonDecode(response.body);
//   //     _items = jsonData;
//   //     setState(() {
//   //       _items;
//   //       // Commune_25_all_property = _items![indexNN!]['Name_cummune'].toString();
//   //       // print('Commune_25_all_property = $Commune_25_all_property');
//   //       for (int i = 0; i < _items!.length; i++) {
//   //         cummune_a = [
//   //           {_items![i]['Name_cummune']}
//   //         ];
//   //         print('cummune($i) = $cummune_a');
//   //         i++;

//   //         // print('index_cummune = ${propery_index}');
//   //       }

//   //       // list1 =list2_Sale_id;
//   //       // print('Commune_25_all = ${_items.toString()}');
//   //     });
//   //   }
//   // }

// // class StackReusable extends StatelessWidget {
// //   final imagere;
// //   final pricere;
// //   final sizere;
// //   const StackReusable({
// //     required this.imagere,
// //     required this.pricere,
// //     required this.sizere,
// //     super.key,
// //   });

// //   @override
// //   Widget build(BuildContext context) {
// //     return Padding(
// //       padding: const EdgeInsets.all(2.0),
// //       child: Stack(
// //         children: [
// //           Container(
// //             height: 10,
// //             width: 100,
// //           ),
// //           Container(
// //             color: Colors.blue,
// //             height: MediaQuery.of(context).size.height,
// //             width: MediaQuery.of(context).size.width,
// //             child: Image.asset(
// //               '$imagere',
// //               fit: BoxFit.cover,
// //             ),
// //           ),
// //           Positioned(
// //             top: 5,
// //             left: 0,
// //             child: Container(
// //               height: 30,
// //               width: 85,
// //               color: Colors.purple,
// //               child: const Center(
// //                 child: Text(
// //                   'FOR SALE',
// //                   style: TextStyle(
// //                       color: Colors.white,
// //                       fontSize: 10,
// //                       fontWeight: FontWeight.bold),
// //                 ),
// //               ),
// //             ),
// //           ),
// //           Positioned(
// //             bottom: 20,
// //             right: 0,
// //             child: SizedBox(
// //               child: Center(
// //                 child: Text(
// //                   '$pricere dollar',
// //                   style: const TextStyle(
// //                       color: Colors.white,
// //                       fontSize: 12,
// //                       fontWeight: FontWeight.bold),
// //                 ),
// //               ),
// //             ),
// //           ),
// //           Positioned(
// //             bottom: 0,
// //             left: 0,
// //             child: SizedBox(
// //               child: Text(
// //                 'Size: $sizere sqm',
// //                 style: const TextStyle(
// //                     color: Colors.white,
// //                     fontSize: 12,
// //                     fontWeight: FontWeight.bold),
// //               ),
// //             ),
// //           ),
// //         ],
// //       ),
// //     );
// //   }
// // }
// }
