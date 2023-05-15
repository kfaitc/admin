// // ignore_for_file: prefer_const_constructors, use_build_context_synchronously, prefer_const_literals_to_create_immutables, unnecessary_null_comparison, non_constant_identifier_names

// import 'dart:convert';
// import 'package:awesome_dialog/awesome_dialog.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:getwidget/getwidget.dart';
// import 'package:http/http.dart' as http;

// import '../Customs/Contants.dart';
// import '../components/get_image_by_firsbase.dart';
// import '../interface/mobile/navigate_home/AutoVerbal/Deteil.dart';
// import '../interface/mobile/navigate_home/AutoVerbal/Edit.dart';
// import '../model/land_building.dart';

// class Search_verbal extends StatefulWidget {
//   const Search_verbal({
//     super.key,
//   });

//   @override
//   State<Search_verbal> createState() => _Search_verbalState();
// }

// class _Search_verbalState extends State<Search_verbal> {
//   int? id;

//   List data = [];
//   Future<void> Search_user_verbal(id) async {
//     double x = 0, n = 0;
//     var jsonData;
//     var rs = await http.get(Uri.parse(
//         'https://www.oneclickonedollar.com/laravel_kfa_2023/public/api/autoverbal/list?verbal_id=$id'));
//     if (rs.statusCode == 200) {
//       jsonData = jsonDecode(rs.body);
//       setState(() {
//         data = jsonData;
//       });
//     }
//   }

//   var image_i, get_image = [];
//   Future<void> getimage(id) async {
//     // var id;

//     var rs = await http.get(Uri.parse(
//         'https://www.oneclickonedollar.com/laravel_kfa_2023/public/api/get_image/${id}'));
//     if (rs.statusCode == 200) {
//       var jsonData = jsonDecode(rs.body);

//       setState(() {
//         print('getimage ========== ${jsonData}');
//         get_image = jsonData;
//         image_i = get_image[0]['url'];
//         print("@@@@@@@@@@@@@@@@@@@ ${image_i}");
//       });
//     }
//   }

//   var image_m, get_image_m = [];
//   Future<void> getimage_m(id) async {
//     var rs = await http.get(Uri.parse(
//         'https://www.oneclickonedollar.com/laravel_kfa_2023/public/api/get_image_map/${id}'));
//     if (rs.statusCode == 200) {
//       var jsonData = jsonDecode(rs.body);

//       setState(() {
//         get_image_m = jsonData;
//         image_m = get_image_m[0]['url'];
//         print("############ ${image_m}");
//       });
//     }
//   }

//   List<L_B> lb = [];
//   List data_of_land = [];
//   Future<void> Get_land(id) async {
//     setState(() {
//       lb.clear();
//     });
//     var rs = await http.get(Uri.parse(
//         'https://www.oneclickonedollar.com/laravel_kfa_2023/public/api/autoverbal/list_land?verbal_landid=$id'));
//     if (rs.statusCode == 200) {
//       var jsonData = jsonDecode(rs.body);
//       print('sgdfjkhhjkgfdhjgfdhjsdf \n\n\n\   ${jsonData}');
//       setState(() {
//         data_of_land = jsonData;
//         for (int i = 0; i < data_of_land.length; i++) {
//           // lb.add(L_B(
//           //     data_of_land[i]['verbal_land_type'],
//           //     data_of_land[i]['verbal_land_des'],
//           //     data_of_land[i]['verbal_land_dp'],
//           //     data_of_land[i]['address'],
//           //     data_of_land[i]['verbal_landid'],
//           //     double.parse(data_of_land[i]['verbal_land_area']),
//           //     double.parse(data_of_land[i]['verbal_land_minsqm']),
//           //     double.parse(data_of_land[i]['verbal_land_maxsqm']),
//           //     double.parse(data_of_land[i]['verbal_land_minvalue']),
//           //     double.parse(data_of_land[i]['verbal_land_maxvalue'])));
//         }
//       });
//     }
//   }

//   Future<void> deleteItemToList(int Id, String ID) async {
//     print(Id);
//     setState(() {
//       data.removeAt(Id);
//     });
//     var rs = await http.delete(Uri.parse(
//         'https://www.oneclickonedollar.com/laravel_kfa_2023/public/api/autoverbal/delete/$ID'));
//     if (rs.statusCode == 200) {
//       var jsonData = jsonDecode(rs.body);
//     }
//   }

//   String? image_map;
//   String? image;

//   Future<void> detailItem(int id, String ID) async {
//     Get.to(Detail(
//       id: id,
//       code: ID,
//       pro_check: 1,
//     ));
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         centerTitle: true,
//         backgroundColor: Color.fromARGB(255, 16, 87, 145),
//         title: Text(
//           'Search',
//           style: TextStyle(fontWeight: FontWeight.bold),
//         ),
//         leading: IconButton(
//             onPressed: () {
//               Navigator.pop(context);
//             },
//             icon: Icon(Icons.arrow_back_sharp)),
//       ),
//       body: Column(
//         children: [
//           TextField(
//             onChanged: (value) {
//               Search_user_verbal(value);
//               // Method For Searching
//             },
//             decoration: InputDecoration(
//               hintText: "Search Data",
//               prefixIcon: Icon(Icons.search),
//               border: OutlineInputBorder(
//                 borderRadius: BorderRadius.all(Radius.circular(7.0)),
//               ),
//             ),
//           ),
//           if (data.length > 0 && id != true)
//             Padding(
//               padding: const EdgeInsets.all(5.0),
//               child: Container(
//                 padding: const EdgeInsets.all(10.0),
//                 decoration: BoxDecoration(
//                   color: Colors.white,
//                   borderRadius: BorderRadius.all(
//                     Radius.circular(15),
//                   ),
//                   border: Border.all(width: 1, color: kPrimaryColor),
//                 ),
//                 child: Column(
//                   children: [
//                     Stack(
//                       children: [
//                         Row(
//                           children: [
//                             SizedBox(
//                               width: 10,
//                             ),
//                             Expanded(
//                               flex: 3,
//                               child: Text(
//                                 data[0]['verbal_id'],
//                                 style: NameProperty(),
//                               ),
//                             ),
//                             Expanded(
//                               flex: 1,
//                               child: Row(
//                                 children: [
//                                   Expanded(
//                                     flex: 1,
//                                     child: IconButton(
//                                       icon: Icon(
//                                         Icons.edit_calendar_outlined,
//                                         color:
//                                             Color.fromARGB(255, 166, 229, 168),
//                                         size: 35,
//                                       ),
//                                       onPressed: () async {
//                                         await getimage(data[0]['verbal_id']);
//                                         await getimage_m(data[0]['verbal_id']);
//                                         await Get_land(data[0]['verbal_id']);

//                                         setState(() {
//                                           Navigator.of(context)
//                                               .push(MaterialPageRoute(
//                                             builder: (context) => Edit(
//                                               land_list: data_of_land,
//                                               cell_land: lb,
//                                               image_photo: image_i,
//                                               image_map: image_m,
//                                               property_type_id: data[0]
//                                                       ['verbal_property_id']
//                                                   .toString(),
//                                               lat: data[0]['latlong_la']
//                                                   .toString(),
//                                               lng: data[0]['latlong_log']
//                                                   .toString(),
//                                               address: data[0]['verbal_address']
//                                                   .toString(),
//                                               approve_id: data[0]['approve_id']
//                                                   .toString(),
//                                               agent: data[0]['agenttype_id']
//                                                   .toString(),
//                                               bank_branch_id: (data[0][
//                                                           'verbal_bank_branch_id'] ==
//                                                       null)
//                                                   ? '0'
//                                                   : data[0][
//                                                           'verbal_bank_branch_id']
//                                                       .toString(),
//                                               bank_contact: data[0]
//                                                       ['verbal_bank_contact']
//                                                   .toString(),
//                                               bank_id: data[0]['verbal_bank_id']
//                                                   .toString(),
//                                               bank_officer: data[0]
//                                                       ['verbal_bank_officer']
//                                                   .toString(),
//                                               comment: data[0]['verbal_comment']
//                                                   .toString(),
//                                               contact: data[0]['verbal_contact']
//                                                   .toString(),
//                                               image: data[0]['verbal_image']
//                                                   .toString(),
//                                               option: data[0]['verbal_option']
//                                                   .toString(),
//                                               owner: data[0]['verbal_owner']
//                                                   .toString(),
//                                               user: data[0]['verbal_user']
//                                                   .toString(),
//                                               verbal_com: data[0]['verbal_com']
//                                                   .toString(),
//                                               verbal_con: data[0]['verbal_con']
//                                                   .toString(),
//                                               verbal: data_of_land,
//                                               verbal_id: int.parse(
//                                                 data[0]['verbal_id'].toString(),
//                                               ),
//                                               n_pro: data[0]
//                                                       ['property_type_name']
//                                                   .toString(),
//                                               n_bank: data[0]['bank_acronym']
//                                                   .toString(),
//                                               n_agent: data[0]['agenttype_name']
//                                                   .toString(),
//                                               n_appro: data[0]['approve_name']
//                                                   .toString(),
//                                             ),
//                                           ));
//                                         });
//                                       },
//                                     ),
//                                   ),
//                                   Expanded(
//                                     flex: 1,
//                                     child: IconButton(
//                                       icon: Icon(
//                                         Icons.description_outlined,
//                                         color: Colors.blue,
//                                         size: 30,
//                                       ),
//                                       onPressed: () {
//                                         Navigator.push(context,
//                                             MaterialPageRoute(
//                                           builder: (context) {
//                                             return Detail(
//                                                 id: 0,
//                                                 pro_check: 1,
//                                                 code: data[0]['verbal_id']
//                                                     .toString());
//                                           },
//                                         ));
//                                         // detailItem(
//                                         //     0,
//                                         //     // data[index]['verbal_id']
//                                         //     data[0]['verbal_id'].toString());
//                                         // print(
//                                         //     'Value1 = ${data[0]['verbal_id'].toString()}');
//                                       },
//                                     ),
//                                   ),
//                                   Expanded(
//                                     flex: 1,
//                                     child: IconButton(
//                                       icon: Icon(
//                                         Icons.delete,
//                                         color: Colors.red,
//                                         size: 30,
//                                       ),
//                                       onPressed: () {
//                                         AwesomeDialog(
//                                           context: context,
//                                           dialogType: DialogType.warning,
//                                           headerAnimationLoop: false,
//                                           animType: AnimType.bottomSlide,
//                                           title: 'Are you sure to delete?',
//                                           buttonsTextStyle: const TextStyle(
//                                               color: Colors.black),
//                                           showCloseIcon: true,
//                                           btnCancelOnPress: () {},
//                                           btnOkOnPress: () {
//                                             deleteItemToList(
//                                                 0,
//                                                 // data[index]["verbal_id"]
//                                                 data[0]['verbal_id']
//                                                     .toString());
//                                             Navigator.pop(context);
//                                           },
//                                         ).show();

//                                         print(data);
//                                       },
//                                     ),
//                                   ),
//                                 ],
//                               ),
//                             )
//                           ],
//                         ),
//                       ],
//                     ),
//                     Stack(
//                       children: [
//                         Row(
//                           children: [
//                             SizedBox(
//                               width: 10,
//                             ),
//                             Expanded(
//                               flex: 1,
//                               //data[index]["property_type_name"]
//                               child: data[0]['property_type_name'] != null
//                                   // data[index]["property_type_name"]
//                                   ? Text(
//                                       data[0]['property_type_name'],
//                                       style: TextStyle(
//                                           fontWeight: FontWeight.w600,
//                                           fontSize: 14),
//                                     )
//                                   : Text(
//                                       "N/A",
//                                       style: TextStyle(
//                                           fontWeight: FontWeight.w600,
//                                           fontSize: 14),
//                                     ),
//                             ),
//                             Container(
//                               padding: EdgeInsets.only(left: 10),
//                               alignment: Alignment.centerLeft,
//                               //data[index]["property_type_name"] != null
//                               child: data[0]['verbal_date'].toString() != null
//                                   ? Text(
//                                       // data[index]["property_type_name"],
//                                       data[0]['verbal_date'].toString())
//                                   : Text(
//                                       "N/A",
//                                     ),
//                             ),
//                           ],
//                         ),
//                       ],
//                     ),
//                     SizedBox(height: 10),
//                     SizedBox(
//                       height: 3.0,
//                     ),
//                     Divider(
//                       height: 1,
//                       thickness: 1,
//                       color: kPrimaryColor,
//                     ),
//                     SizedBox(
//                       height: 5,
//                     ),
//                     Row(
//                       children: [
//                         SizedBox(width: 10),
//                         Column(
//                           mainAxisAlignment: MainAxisAlignment.start,
//                           crossAxisAlignment: CrossAxisAlignment.start,
//                           children: [
//                             Text(
//                               "Bank",
//                               style: Label(),
//                             ),
//                             SizedBox(
//                               height: 2,
//                             ),
//                             Text(
//                               "Agency",
//                               style: Label(),
//                             ),
//                           ],
//                         ),
//                         SizedBox(width: 15),
//                         Column(
//                           mainAxisAlignment: MainAxisAlignment.start,
//                           crossAxisAlignment: CrossAxisAlignment.start,
//                           children: [
//                             SizedBox(height: 2),
//                             Text(
//                               //   data[index]["bank_name"]
//                               ':   ' + data[0]['bank_name'].toString(),
//                               style: Name(),
//                             ),
//                             SizedBox(
//                               width: 3,
//                             ),
//                             // data[index]["approve_name"] != null
//                             data[0]['approve_name'].toString() != null
//                                 ? Text(
//                                     //data[index]["approve_name"]
//                                     ':   ' + data[0]['approve_name'].toString(),
//                                     style: Name(),
//                                   )
//                                 : Text(
//                                     ':   ' + "N/A",
//                                     style: Name(),
//                                   )
//                           ],
//                         ),
//                       ],
//                     ),
//                     SizedBox(
//                       height: 10,
//                     ),
//                     Padding(
//                       padding: const EdgeInsets.only(left: 10, right: 10),
//                       child: Align(
//                         alignment: Alignment.centerLeft,
//                         child: Text.rich(
//                           TextSpan(
//                             children: <InlineSpan>[
//                               WidgetSpan(
//                                   child: Icon(
//                                 Icons.location_on_sharp,
//                                 color: kPrimaryColor,
//                                 size: 14,
//                               )),
//                               TextSpan(
//                                 // ignore: prefer_if_null_operators,
//                                 text:
//                                     // ignore: prefer_if_null_operators
//                                     // data[index]["verbal_address"] != null
//                                     data[0]['verbal_address'].toString() != null
//                                         // ? data[index]["verbal_address"]
//                                         ? data[0]['verbal_address'].toString()
//                                         : "N/A",
//                               ),
//                             ],
//                           ),
//                           textAlign: TextAlign.left,
//                           style: TextStyle(fontSize: 12),
//                         ),
//                       ),
//                     ),
//                     SizedBox(
//                       height: 10,
//                     ),
//                     GFButton(
//                       shape: GFButtonShape.pills,
//                       color: Color.fromRGBO(33, 150, 243, 1),
//                       elevation: 10.0,
//                       fullWidthButton: true,
//                       onPressed: () async {
//                         await getimage(data[0]['verbal_id']);
//                         await getimage_m(data[0]['verbal_id']);
//                         // ignore: use_build_context_synchronously
//                         Navigator.push(
//                             context,
//                             MaterialPageRoute(
//                                 builder: (context) => Get_Image_By_Firbase(
//                                       com_id: data[0]['verbal_id'],
//                                       fsv: data[0]['verbal_con'],
//                                       i: 0,
//                                       property_check: '1',
//                                       image: image_i,
//                                       image_map: image_m,
//                                     )));
//                       },
//                       text: 'Print',
//                       icon: const Icon(
//                         Icons.print,
//                         color: Colors.white,
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//         ],
//       ),
//     );
//   }

//   TextStyle Label() {
//     return TextStyle(color: kPrimaryColor, fontSize: 13);
//   }

//   TextStyle Name() {
//     return TextStyle(
//         color: kImageColor, fontSize: 14, fontWeight: FontWeight.bold);
//   }

//   TextStyle NameProperty() {
//     return TextStyle(
//         color: kImageColor, fontSize: 16, fontWeight: FontWeight.bold);
//   }
// }
