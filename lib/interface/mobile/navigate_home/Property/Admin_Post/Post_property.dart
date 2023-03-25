// // ignore_for_file: file_names, prefer_const_constructors, prefer_const_literals_to_create_immutables, sized_box_for_whitespace, dead_code, avoid_print, non_constant_identifier_names, prefer_typing_uninitialized_variables, unnecessary_string_interpolations, unused_field, unnecessary_new, camel_case_types

// import 'dart:convert';

// import 'package:flutter/material.dart';
// import 'package:google_maps_flutter/google_maps_flutter.dart';
// import 'package:http/http.dart' as http;
// import 'package:kfa_project/Property/List_Property/List_Sale.dart';
// import '../../models/search_model.dart';

// import 'Screen_post.dart';

// List<String> list1 = <String>[
//   'Banteay Meanchey',
//   'Siem reap',
//   'Phnom penh',
//   'Takae'
// ];
// List<String> list = <String>['Sort', 'Price', 'Beds', 'Baths', 'B-Size'];

// class Poster_image extends StatefulWidget {
//   const Poster_image({super.key});

//   @override
//   State<Poster_image> createState() => _View_DataState();
// }

// class _View_DataState extends State<Poster_image> {
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

//   int index = 0;
//   @override
//   void initState() {
//     Property_Sale();
//     super.initState();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: SingleChildScrollView(
//         child: Padding(
//           padding: const EdgeInsets.all(8.0),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Container(
//                 height: MediaQuery.of(context).size.height * 0.4,
//                 width: double.infinity,
//                 child: GoogleMap(
//                   zoomControlsEnabled: false,
//                   myLocationEnabled: true,
//                   myLocationButtonEnabled: true,
//                   initialCameraPosition: CameraPosition(
//                       target: LatLng(11.562208, 104.838535), zoom: 10),
//                   markers: Set<Marker>.of(_markers),
//                   onTap: (postition) {},
//                   onMapCreated: (GoogleMapController controller) {},
//                 ),
//               ),
//               Row(
//                 children: [
//                   Expanded(
//                     flex: 3,
//                     child: Container(
//                       height: MediaQuery.of(context).size.height * 0.14,
//                       width: MediaQuery.of(context).size.width * 0.26,
//                       child: Padding(
//                         padding: const EdgeInsets.all(8.0),
//                         child: DropdownButton<String>(
//                           value: dropdownValue1,
//                           icon: const Icon(Icons.arrow_circle_down_outlined),
//                           elevation: 16,
//                           style: const TextStyle(
//                               fontWeight: FontWeight.bold,
//                               fontSize: 15,
//                               color: Colors.black),
//                           underline: SizedBox(),
//                           // underline: null,
//                           onChanged: (String? value) {
//                             // This is called when the user selects an item.
//                             setState(() {
//                               dropdownValue1 = value!;
//                             });
//                           },
//                           items: list1
//                               .map<DropdownMenuItem<String>>((String value) {
//                             return DropdownMenuItem<String>(
//                               value: value,
//                               child: Text(value),
//                             );
//                           }).toList(),
//                         ),
//                       ),
//                     ),
//                   ),
//                   Expanded(
//                       flex: 1,
//                       child: Text(
//                         'Location',
//                         style: TextStyle(
//                             fontWeight: FontWeight.bold, fontSize: 16),
//                       ))
//                 ],
//               ),
//               Text('(number of list) Listings for sale/rent'),
//               SizedBox(
//                 height: 5,
//               ),
//               Row(
//                 children: [
//                   Expanded(
//                     flex: 3,
//                     child: Container(
//                       height: MediaQuery.of(context).size.height * 0.14,
//                       width: MediaQuery.of(context).size.width * 0.7,
//                       child: Padding(
//                         padding: const EdgeInsets.all(8.0),
//                         child: TextField(
//                           decoration: InputDecoration(
//                             prefixIcon: Icon(Icons.search),
//                             border: OutlineInputBorder(),
//                             hintText: 'Find listing here...',
//                           ),
//                         ),
//                       ),
//                     ),
//                   ),
//                   Expanded(
//                     flex: 1,
//                     child: Container(
//                       height: MediaQuery.of(context).size.height * 0.14,
//                       width: MediaQuery.of(context).size.width * 0.26,
//                       child: Padding(
//                         padding: const EdgeInsets.all(8.0),
//                         child: DropdownButton<String>(
//                           value: dropdownValue,
//                           icon: const Icon(Icons.arrow_circle_down_outlined),
//                           elevation: 16,
//                           style: const TextStyle(color: Colors.deepPurple),
//                           // underline: Container(
//                           //   height: 2,
//                           //   color: Colors.deepPurpleAccent,
//                           // ),
//                           onChanged: (String? value) {
//                             // This is called when the user selects an item.
//                             setState(() {
//                               dropdownValue = value!;
//                             });
//                           },
//                           items: list
//                               .map<DropdownMenuItem<String>>((String value) {
//                             return DropdownMenuItem<String>(
//                               value: value,
//                               child: Text(value),
//                             );
//                           }).toList(),
//                         ),
//                       ),
//                     ),
//                   )
//                 ],
//               ),
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   Text(''),
//                   TextButton(
//                       onPressed: () {
//                         Navigator.push(context, MaterialPageRoute(
//                           builder: (context) {
//                             return List_Sale();
//                           },
//                         ));
//                       },
//                       child: Text('Show all')),
//                 ],
//               ),
//               SingleChildScrollView(
//                 child: Padding(
//                   padding: const EdgeInsets.all(8.0),
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       Row(
//                         children: [
//                           Text(
//                             '${list2_Sale.length}',
//                             style: TextStyle(
//                                 color: Color.fromARGB(255, 188, 25, 225),
//                                 fontSize: 16),
//                           ),
//                           SizedBox(
//                             width: 10,
//                           ),
//                           Text(
//                             'Listings for sale',
//                             style: TextStyle(
//                                 color: Color.fromARGB(255, 69, 55, 55),
//                                 fontSize: 16),
//                           ),
//                         ],
//                       ),
//                       SizedBox(
//                         height: 5,
//                       ),
//                       SizedBox(
//                         height: 10,
//                       ),
//                       Padding(
//                         padding: const EdgeInsets.only(right: 10, left: 10),
//                         child: Container(
//                             height: 200,
//                             width: double.infinity,
//                             child: GridView.builder(
//                               gridDelegate:
//                                   SliverGridDelegateWithFixedCrossAxisCount(
//                                 crossAxisCount: 2,
//                                 crossAxisSpacing: 9,
//                                 mainAxisSpacing: 9,
//                                 childAspectRatio: 2.0,
//                               ),
//                               itemCount: list2_Sale.length,
//                               itemBuilder: (BuildContext context, index) {
//                                 return GridTile(
//                                   child: Stack(
//                                     children: [
//                                       Container(
//                                         height: 100,
//                                         width:
//                                             MediaQuery.of(context).size.width *
//                                                 0.5,
//                                         child: Image.network(
//                                           '${list2_Sale[index]['image'].toString()}',
//                                           // 'https://www.oneclickonedollar.com/laravel_kfa_2023/public/data_imgs_kfa/properysale/Example1.png',
//                                           fit: BoxFit.cover,
//                                         ),
//                                       ),
//                                       Positioned(
//                                           top: 10,
//                                           child: Container(
//                                             alignment: Alignment.center,
//                                             height: 30,
//                                             width: 50,
//                                             decoration: BoxDecoration(
//                                                 borderRadius:
//                                                     BorderRadius.circular(10),
//                                                 color: Color.fromARGB(
//                                                     255, 55, 152, 10)),
//                                             child: Text(
//                                               '${list2_Sale[index]['type'].toString()}',
//                                               style: TextStyle(
//                                                   color: Colors.white),
//                                             ),
//                                           )),
//                                       Positioned(
//                                           left: 120,
//                                           top: 60,
//                                           child: Text(
//                                             '\$${list2_Sale[index]['value'].toString()}',
//                                             style: TextStyle(
//                                                 color: Colors.white,
//                                                 fontWeight: FontWeight.bold,
//                                                 fontSize: 17),
//                                           )),
//                                     ],
//                                   ),
//                                 );
//                               },
//                             )),
//                       ),
//                     ],
//                   ),
//                 ),
//               ),
//               SizedBox(
//                 height: 10,
//               ),
//             ],
//           ),
//         ),
//       ),
//       floatingActionButton: FloatingActionButton(
//         onPressed: () {
//           Navigator.push(context, MaterialPageRoute(
//             builder: (context) {
//               return Screen_post();
//             },
//           ));
//         },
//         child: Icon(Icons.post_add),
//       ),
//     );
//   }

//   List list2_Sale = [];
//   void Property_Sale() async {
//     var jsonData;
//     final response = await http.get(Uri.parse(
//         'https://www.oneclickonedollar.com/laravel_kfa_2023/public/api/property_sale_get'));

//     if (response.statusCode == 200) {
//       jsonData = jsonDecode(response.body)['Propery_Sale'];
//       list2_Sale = jsonData;
//       setState(() {
//         list2_Sale;
//       });
//     }
//   }
// }
