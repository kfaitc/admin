// // ignore_for_file: file_names, prefer_const_constructors, prefer_is_empty, non_constant_identifier_names, avoid_print, prefer_interpolation_to_compose_strings, unused_local_variable

// import 'dart:convert';

// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;
// import 'package:kfa_admin/Profile/contants.dart';
// import 'package:kfa_admin/respon.dart';

// class Detail extends StatefulWidget {
//   const Detail(
//       {super.key,
//       required this.id,
//       required this.code,
//       required this.pro_check});
//   final int id;
//   final String code;
//   final int pro_check;
//   @override
//   State<Detail> createState() => _DetailState();
// }

// class _DetailState extends State<Detail> {
//   final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

//   var code = 0;
//   var list = [];

//   List land_list = [];

//   @override
//   void initState() {
//     super.initState();
//     if (widget.pro_check == 1) {
//       Load1();
//       Land2();
//     } else {
//       Load2();
//       Land2();
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: kPrimaryColor,
//         elevation: 0,
//         centerTitle: true,
//         title: Text(
//           "DETAIL ",
//           style: TextStyle(
//             fontSize: 20.0,
//             fontWeight: FontWeight.bold,
//             color: kwhite,
//           ),
//         ),
//         toolbarHeight: 80,
//       ),
//       backgroundColor: kPrimaryColor,
//       body: SafeArea(
//         child: Container(
//           decoration: BoxDecoration(
//             color: Colors.white,
//             borderRadius: BorderRadius.only(
//               topLeft: Radius.circular(20),
//               topRight: Radius.circular(20),
//             ),
//           ),
//           child: SingleChildScrollView(
//             child: Responsive(
//               mobile: addVerbal(context),
//               tablet: Row(
//                 children: [
//                   Expanded(
//                     child: Row(
//                       mainAxisAlignment: MainAxisAlignment.center,
//                       children: [
//                         SizedBox(
//                           width: MediaQuery.of(context).size.width,
//                           child: addVerbal(context),
//                         ),
//                       ],
//                     ),
//                   )
//                 ],
//               ),
//               desktop: Row(
//                 children: [
//                   Expanded(
//                     child: Row(
//                       mainAxisAlignment: MainAxisAlignment.center,
//                       children: [
//                         SizedBox(
//                           width: MediaQuery.of(context).size.width,
//                           child: addVerbal(context),
//                         ),
//                       ],
//                     ),
//                   )
//                 ],
//               ),
//               phone: addVerbal(context),
//             ),
//           ),
//         ),
//       ),
//     );
//   }

//   Column addVerbal(BuildContext context) {
//     return Column(
//       // ignore: prefer_const_literals_to_create_immutables, duplicate_ignore
//       children: [
//         list.length > 0
//             ? Padding(
//                 padding: const EdgeInsets.fromLTRB(0, 30, 0, 0),
//                 child: Form(
//                   key: _formKey,
//                   child: Column(
//                     children: [
//                       Row(
//                         children: [
//                           SizedBox(width: 40),
//                           Icon(
//                             Icons.qr_code,
//                             color: kImageColor,
//                             size: 30,
//                           ),
//                           SizedBox(width: 10),
//                           Text(
//                             widget.code.toString(),
//                             style: TextStyle(
//                                 fontSize: 19,
//                                 fontWeight: FontWeight.bold,
//                                 color: kPrimaryColor),
//                           ),
//                         ],
//                       ),

//                       // // ignore: sized_box_for_whitespace
//                       // //dropdown(),
//                       // // PropertyDropdown(),

//                       Box(
//                         label: "Property",
//                         iconname: Icon(
//                           Icons.business_outlined,
//                           color: kImageColor,
//                         ),
//                         value: list[0]["property_type_name"] ?? "N/A",
//                       ),
//                       Box(
//                         label: "Bank",
//                         iconname: Icon(
//                           Icons.home_work,
//                           color: kImageColor,
//                         ),
//                         value: list[0]["bank_name"] ?? "N/A",
//                       ),
//                       Box(
//                         label: "Branch",
//                         iconname: Icon(
//                           Icons.account_tree_rounded,
//                           color: kImageColor,
//                         ),
//                         value: list[0]["bank_name"] ?? "N/A",
//                       ),
//                       Box(
//                         label: "Owner",
//                         iconname: Icon(
//                           Icons.person,
//                           color: kImageColor,
//                         ),
//                         value: list[0]["verbal_owner"] ?? "N/A",
//                       ),
//                       Box(
//                         label: "Contact",
//                         iconname: Icon(
//                           Icons.phone,
//                           color: kImageColor,
//                         ),
//                         value: list[0]["verbal_contact"] ?? "N/A",
//                       ),
//                       Box(
//                         label: "Date",
//                         iconname: Icon(
//                           Icons.calendar_today,
//                           color: kImageColor,
//                         ),
//                         value: list[0]["verbal_created_date"].split(" ")[0] ??
//                             "N/A",
//                       ),
//                       Box(
//                         label: "Bank Officer",
//                         iconname: Icon(
//                           Icons.work,
//                           color: kImageColor,
//                         ),
//                         value: list[0]["verbal_bank_officer"] ?? "N/A",
//                       ),
//                       Box(
//                         label: "Contact",
//                         iconname: Icon(
//                           Icons.phone,
//                           color: kImageColor,
//                         ),
//                         value: list[0]["verbal_bank_contact"] ?? "N/A",
//                       ),

//                       Box(
//                         label: "Comment",
//                         iconname: Icon(
//                           Icons.comment_sharp,
//                           color: kImageColor,
//                         ),
//                         value: list[0]["verbal_comment"] ?? "N/A",
//                       ),
//                       Box(
//                         label: "Verify by",
//                         iconname: Icon(
//                           Icons.person_sharp,
//                           color: kImageColor,
//                         ),
//                         value: list[0]["agenttype_name"] ?? "N/A",
//                       ),
//                       Box(
//                         label: "Approve by",
//                         iconname: Icon(
//                           Icons.person_outlined,
//                           color: kImageColor,
//                         ),
//                         value: list[0]["approve_name"] ?? "N/A",
//                       ),
//                       Box(
//                         label: "Address",
//                         iconname: Icon(
//                           Icons.location_on_rounded,
//                           color: kImageColor,
//                         ),
//                         value: list[0]["verbal_address"] ?? "N/A",
//                       ),
//                       SizedBox(
//                         height: 10,
//                       ),
//                       // for (int index = 0; index < land_list.length; index++)
//                       //   Container(
//                       //     width: 260,
//                       //     //height: 210,
//                       //     padding: EdgeInsets.all(10),
//                       //     decoration: BoxDecoration(
//                       //       border: Border.all(width: 1, color: kPrimaryColor),
//                       //       borderRadius: BorderRadius.all(Radius.circular(15)),
//                       //     ),
//                       //     child: Column(
//                       //       children: [
//                       //         Stack(
//                       //           children: [
//                       //             Row(
//                       //               children: [
//                       //                 SizedBox(
//                       //                   width: 10,
//                       //                 ),
//                       //                 Expanded(
//                       //                   flex: 1,
//                       //                   child: Text(
//                       //                     (list[index]["verbal_land_des"]
//                       //                         .toString()),
//                       //                     style: NameProperty(),
//                       //                   ),
//                       //                 ),
//                       //               ],
//                       //             ),
//                       //           ],
//                       //         ),
//                       //         Padding(
//                       //           padding:
//                       //               const EdgeInsets.only(left: 10, right: 10),
//                       //           child: Text.rich(
//                       //             TextSpan(
//                       //               children: <InlineSpan>[
//                       //                 WidgetSpan(
//                       //                     child: Icon(
//                       //                   Icons.location_on_sharp,
//                       //                   color: kPrimaryColor,
//                       //                   size: 14,
//                       //                 )),
//                       //                 TextSpan(
//                       //                     text: "${list[index]["address"]} "),
//                       //               ],
//                       //             ),
//                       //             textAlign: TextAlign.left,
//                       //             style: TextStyle(fontSize: 12),
//                       //           ),
//                       //         ),
//                       //         SizedBox(
//                       //           height: 3.0,
//                       //         ),
//                       //         Divider(
//                       //           height: 1,
//                       //           thickness: 1,
//                       //           color: kPrimaryColor,
//                       //         ),
//                       //         SizedBox(
//                       //           height: 5,
//                       //         ),
//                       //         // Container(
//                       //         //   padding: EdgeInsets.only(left: 10),
//                       //         //   alignment: Alignment.centerLeft,
//                       //         //   child: Text(
//                       //         //     list[index]["verbal_land_des"].toString(),
//                       //         //   ),
//                       //         // ),
//                       //         Row(
//                       //           children: [
//                       //             SizedBox(width: 10),
//                       //             // Column(
//                       //             //   mainAxisAlignment: MainAxisAlignment.start,
//                       //             //   crossAxisAlignment:
//                       //             //       CrossAxisAlignment.start,
//                       //             //   children: [
//                       //             //     Text(
//                       //             //       "Depreciation",
//                       //             //       style: Label(),
//                       //             //     ),
//                       //             //     SizedBox(height: 3),
//                       //             //     Text(
//                       //             //       "Area",
//                       //             //       style: Label(),
//                       //             //     ),
//                       //             //     SizedBox(height: 3),
//                       //             //     Text(
//                       //             //       'Min Value/Sqm',
//                       //             //       style: Label(),
//                       //             //     ),
//                       //             //     SizedBox(height: 3),
//                       //             //     Text(
//                       //             //       'Max Value/Sqm',
//                       //             //       style: Label(),
//                       //             //     ),
//                       //             //     SizedBox(height: 3),
//                       //             //     Text(
//                       //             //       'Min Value',
//                       //             //       style: Label(),
//                       //             //     ),
//                       //             //     SizedBox(height: 3),
//                       //             //     Text(
//                       //             //       'Min Value',
//                       //             //       style: Label(),
//                       //             //     ),
//                       //             //   ],
//                       //             // ),
//                       //             SizedBox(width: 15),
//                       //             // Column(
//                       //             //   mainAxisAlignment: MainAxisAlignment.start,
//                       //             //   crossAxisAlignment:
//                       //             //       CrossAxisAlignment.start,
//                       //             //   children: [
//                       //             //     SizedBox(height: 4),
//                       //             //     Text(
//                       //             //       ':   ' + list[index]["verbal_land_dp"],
//                       //             //       style: Name(),
//                       //             //     ),
//                       //             //     SizedBox(height: 2),
//                       //             //     Text(
//                       //             //       ':   ' +
//                       //             //           (list[index]["verbal_land_area"]
//                       //             //                   .toInt())
//                       //             //               .toString() +
//                       //             //           'm' +
//                       //             //           '\u00B2',
//                       //             //       style: Name(),
//                       //             //     ),
//                       //             //     SizedBox(height: 2),
//                       //             //     Text(
//                       //             //       ':   ' +
//                       //             //           (list[index]["verbal_land_minsqm"])
//                       //             //               .toString() +
//                       //             //           '\$',
//                       //             //       style: Name(),
//                       //             //     ),
//                       //             //     SizedBox(height: 2),
//                       //             //     Text(
//                       //             //       ':   ' +
//                       //             //           (list[index]["verbal_land_maxsqm"])
//                       //             //               .toString() +
//                       //             //           '\$',
//                       //             //       style: Name(),
//                       //             //     ),
//                       //             //     SizedBox(height: 2),
//                       //             //     Text(
//                       //             //       ':   ' +
//                       //             //           (list[index]
//                       //             //                   ["verbal_land_minvalue"])
//                       //             //               .toString() +
//                       //             //           '\$',
//                       //             //       style: Name(),
//                       //             //     ),
//                       //             //     SizedBox(height: 2),
//                       //             //     Text(
//                       //             //       ':   ' +
//                       //             //           (list[index]["verbal_land_maxvalue"]
//                       //             //                   .toString() +
//                       //             //               '\$'),
//                       //             //       style: Name(),
//                       //             //     ),
//                       //             //   ],
//                       //             // ),
//                       //             ////////////
//                       //           ],
//                       //         ),
//                       //       ],
//                       //     ),
//                       //   ),
//                     ],
//                   ),
//                 ),
//               )
//             : Container(
//                 alignment: Alignment.center,
//                 padding: const EdgeInsets.all(50.0),
//                 child: CircularProgressIndicator(),
//               )
//       ],
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
//         color: kImageColor, fontSize: 11, fontWeight: FontWeight.bold);
//   }

//   void Load1() async {
//     var code = widget.code;
//     print("hii" + code);
//     var rs = await http.get(Uri.parse(
//         'https://www.oneclickonedollar.com/laravel_kfa_2023/public/api/autoverbal/list?verbal_id=$code'));
//     if (rs.statusCode == 200) {
//       var jsonData = jsonDecode(rs.body);

//       setState(() {
//         list = jsonData;
//         print(list[0]["verbal_bank_officer"]);
//       });
//     }
//   }

//   void Load2() async {
//     var code = widget.code;
//     print("hii" + code);
//     var rs = await http.get(Uri.parse(
//         'https://www.oneclickonedollar.com/laravel_kfa_2023/public/api/verbals/list?verbal_id=$code'));
//     if (rs.statusCode == 200) {
//       var jsonData = jsonDecode(rs.body);

//       setState(() {
//         list = jsonData;
//         print(list[0]["verbal_bank_officer"]);
//       });
//     }
//   }

//   void Land2() async {
//     var id_v = widget.code;
//     var jsonData;
//     var rs = await http.get(Uri.parse(
//         'https://www.oneclickonedollar.com/laravel_kfa_2023/public/api/verbals/list_land?verbal_landid=$id_v'));
//     if (rs.statusCode == 200) {
//       jsonData = jsonDecode(rs.body);
//       land_list = jsonData;
//     }
//   }

//   void get_user() async {
//     var rs = await http.get(Uri.parse(
//         'https://www.oneclickonedollar.com/laravel_kfa_2023/public/api/autoverbal/list?verbal_id=$code'));
//   }
// }

// class Box extends StatelessWidget {
//   final String label;
//   final String value;
//   final Widget iconname;

//   const Box({
//     Key? key,
//     required this.label,
//     required this.iconname,
//     required this.value,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: EdgeInsets.fromLTRB(30, 10, 30, 0),
//       child: TextFormField(
//         // controller: controller,
//         initialValue: value,
//         readOnly: true,

//         decoration: InputDecoration(
//           fillColor: kwhite,
//           filled: true,
//           labelText: label,
//           prefixIcon: iconname,
//           focusedBorder: OutlineInputBorder(
//             borderSide: const BorderSide(color: kPrimaryColor, width: 2.0),
//             borderRadius: BorderRadius.circular(10.0),
//           ),
//           enabledBorder: OutlineInputBorder(
//             borderSide: const BorderSide(
//               width: 1,
//               color: kPrimaryColor,
//             ),
//             borderRadius: BorderRadius.circular(10.0),
//           ),
//         ),
//       ),
//     );
//   }
// }
