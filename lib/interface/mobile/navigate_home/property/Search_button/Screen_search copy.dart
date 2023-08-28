// // ignore_for_file: prefer_const_constructors, camel_case_types, prefer_const_literals_to_create_immutables, non_constant_identifier_names, prefer_typing_uninitialized_variables, unused_field, unused_element, sized_box_for_whitespace, avoid_print, unnecessary_brace_in_string_interps, unused_local_variable, must_be_immutable

// import 'dart:convert';
// import 'dart:typed_data';
// import 'package:cached_network_image/cached_network_image.dart';
// import 'package:flutter/services.dart';
// import 'package:http/http.dart' as http;
// import 'package:flutter/material.dart';
// import '../Detail_Screen/Detail_all_list_Screen.dart';

// class Screen_detail_Search extends StatefulWidget {
//   Screen_detail_Search(
//       {super.key,
//       required this.bathroom,
//       required this.bedhroom,
//       required this.max,
//       required this.min,
//       required this.hometype,
//       required this.province});
//   String? bathroom;
//   String? bedhroom;
//   String? min;
//   String? max;
//   String? hometype;
//   String? province;

//   @override
//   State<Screen_detail_Search> createState() => _Screen_detail_SearchState();
// }

// class _Screen_detail_SearchState extends State<Screen_detail_Search> {
//   bool _isLoading_re = false;
//   Future<void> _search() async {
//     _isLoading_re = true;
//     _pageController = PageController(initialPage: 0);
//     await Future.wait([proerty_search_bathrooms(widget.bathroom)]);

//     setState(() {
//       _isLoading_re = false;
//     });
//   }

//   Future<void> _search_minmax() async {
//     _isLoading_re = true;
//     _pageController = PageController(initialPage: 0);
//     await Future.wait([proerty_search_minmax()]);

//     setState(() {
//       _isLoading_re = false;
//     });
//   }

//   Future<void> _search_bedbatroom() async {
//     _isLoading_re = true;
//     _pageController = PageController(initialPage: 0);
//     await Future.wait([proerty_search_bed_bathroom()]);

//     setState(() {
//       _isLoading_re = false;
//     });
//   }

//   Future<void> _search_bedbatroom_hometype() async {
//     _isLoading_re = true;
//     _pageController = PageController(initialPage: 0);
//     await Future.wait([proerty_search_bed_bathroom_hometype()]);

//     setState(() {
//       _isLoading_re = false;
//     });
//   }

//   Future<void> _search_bedbatroom_hometype_minmax() async {
//     _isLoading_re = true;
//     _pageController = PageController(initialPage: 0);
//     await Future.wait([proerty_search_bed_bathroom_hometype_minmax()]);

//     setState(() {
//       _isLoading_re = false;
//     });
//   }

//   Future<void> _search_bedbatroom_hometype_minmax_province() async {
//     _isLoading_re = true;
//     _pageController = PageController(initialPage: 0);
//     await Future.wait([proerty_search_bed_bathroom_hometype_minmax_province()]);

//     setState(() {
//       _isLoading_re = false;
//     });
//   }

//   Future<void> _search_bedbatroom_province() async {
//     _isLoading_re = true;
//     _pageController = PageController(initialPage: 0);
//     await Future.wait([proerty_search_bed_bathroom_province()]);

//     setState(() {
//       _isLoading_re = false;
//     });
//   }

//   Future<void> _search_province() async {
//     _isLoading_re = true;
//     _pageController = PageController(initialPage: 0);
//     await Future.wait([proerty_search_province()]);

//     setState(() {
//       _isLoading_re = false;
//     });
//   }

//   Future<void> _search_hometype() async {
//     _isLoading_re = true;
//     _pageController = PageController(initialPage: 0);
//     await Future.wait([proerty_search_hometype()]);

//     setState(() {
//       _isLoading_re = false;
//     });
//   }

//   Future<void> _search_hometype_minmax() async {
//     _isLoading_re = true;
//     _pageController = PageController(initialPage: 0);
//     await Future.wait([proerty_search_hometype_minmax()]);

//     setState(() {
//       _isLoading_re = false;
//     });
//   }

//   Future<void> _search_hometype_minmax_province() async {
//     _isLoading_re = true;
//     _pageController = PageController(initialPage: 0);
//     await Future.wait([proerty_search_hometype_minmax_province()]);

//     setState(() {
//       _isLoading_re = false;
//     });
//   }

//   Future<void> _search_hometype_minmax_province_hometype() async {
//     _isLoading_re = true;
//     _pageController = PageController(initialPage: 0);
//     await Future.wait([proerty_search_bed_bathroom_province_hometype()]);

//     setState(() {
//       _isLoading_re = false;
//     });
//   }

//   Future<void> _search_bedrooms() async {
//     _isLoading_re = true;
//     _pageController = PageController(initialPage: 0);
//     await Future.wait([proerty_search_bed()]);

//     setState(() {
//       _isLoading_re = false;
//     });
//   }

//   Future<void> _search_all() async {
//     _isLoading_re = true;
//     _pageController = PageController(initialPage: 0);
//     await Future.wait([proerty_search_all()]);

//     setState(() {
//       _isLoading_re = false;
//     });
//   }

//   Future<void> _search_hometype_province() async {
//     _isLoading_re = true;
//     _pageController = PageController(initialPage: 0);
//     await Future.wait([proerty_search_hometype_province()]);

//     setState(() {
//       _isLoading_re = false;
//     });
//   }

//   Future<void> _search_hometype_province_bed() async {
//     _isLoading_re = true;
//     _pageController = PageController(initialPage: 0);
//     await Future.wait([proerty_search_hometype_province_bed()]);

//     setState(() {
//       _isLoading_re = false;
//     });
//   }

//   String? min, max;
//   void Min() {
//     if (widget.min == '1k') {
//       min = '1000';
//     } else if (widget.min == '2k') {
//       min = '2000';
//     } else if (widget.min == '5k') {
//       min = '5000';
//     } else if (widget.min == '10k') {
//       min = '10000';
//     } else if (widget.min == '20k') {
//       min = '20000';
//     } else if (widget.min == '50k') {
//       min = '50000';
//     } else if (widget.min == '100k') {
//       min = '100000';
//     } else if (widget.min == '200k') {
//       min = '200000';
//     } else if (widget.min == '500k') {
//       min = '500000';
//     }
//   }

//   void Max() {
//     if (widget.max == '1k') {
//       max = '1000';
//     } else if (widget.max == '2k') {
//       max = '2000';
//     } else if (widget.max == '5k') {
//       max = '5000';
//     } else if (widget.max == '10k') {
//       max = '10000';
//     } else if (widget.max == '20k') {
//       max = '20000';
//     } else if (widget.max == '50k') {
//       max = '50000';
//     } else if (widget.max == '100k') {
//       max = '100000';
//     } else if (widget.max == '200k') {
//       max = '200000';
//     } else if (widget.max == '500k') {
//       max = '500000';
//     }
//   }

//   @override
//   void initState() {
//     Min();
//     Max();
//     _pageController = PageController(initialPage: 0);
//     if (widget.bathroom != null &&
//         widget.bedhroom == null &&
//         widget.hometype == null &&
//         max == null &&
//         min == null &&
//         widget.province == null) {
//       _search();
//     } else if (max != null &&
//         min != null &&
//         widget.hometype == null &&
//         widget.bathroom == null &&
//         widget.bedhroom == null &&
//         widget.province == null) {
//       _search_minmax();
//     } else if (widget.hometype == null &&
//         widget.bathroom != null &&
//         widget.bedhroom != null &&
//         max == null &&
//         min == null &&
//         widget.province == null) {
//       _search_bedbatroom();
//     } else if (widget.hometype != null &&
//         widget.bathroom != null &&
//         widget.bedhroom != null &&
//         max == null &&
//         min == null &&
//         widget.province == null) {
//       _search_bedbatroom_hometype();
//     } else if (widget.hometype != null &&
//         widget.bathroom != null &&
//         widget.bedhroom != null &&
//         max != null &&
//         min != null &&
//         widget.province == null) {
//       _search_bedbatroom_hometype_minmax();
//     } else if (widget.hometype == null &&
//         widget.bathroom != null &&
//         widget.bedhroom != null &&
//         max == null &&
//         min == null &&
//         widget.province != null) {
//       //////
//       print('sdfsdfsdfsdf');
//       _search_bedbatroom_province();
//     } else if (widget.hometype == null &&
//         widget.bathroom == null &&
//         widget.bedhroom == null &&
//         max == null &&
//         min == null &&
//         widget.province != null) {
//       _search_province();
//     } else if (widget.hometype != null &&
//         widget.bathroom == null &&
//         widget.bedhroom == null &&
//         max == null &&
//         min == null &&
//         widget.province == null) {
//       _search_hometype();
//     } else if (widget.hometype != null &&
//         widget.bathroom == null &&
//         widget.bedhroom == null &&
//         max != null &&
//         min != null &&
//         widget.province == null) {
//       _search_hometype_minmax();
//     } else if (widget.hometype != null &&
//         widget.bathroom == null &&
//         widget.bedhroom == null &&
//         max != null &&
//         min != null &&
//         widget.province != null) {
//       _search_hometype_minmax_province();
//     } else if (widget.hometype != null &&
//         widget.bathroom != null &&
//         widget.bedhroom != null &&
//         max == null &&
//         min == null &&
//         widget.province != null) {
//       _search_hometype_minmax_province_hometype();
//     } else if (widget.hometype == null &&
//         widget.bathroom == null &&
//         widget.bedhroom != null &&
//         max == null &&
//         min == null &&
//         widget.province == null) {
//       _search_bedrooms();
//     } else if (widget.hometype != null &&
//         widget.bathroom == null &&
//         widget.bedhroom == null &&
//         max == null &&
//         min == null &&
//         widget.province != null) {
//       _search_hometype_province();
//     } else if (widget.hometype != null &&
//         widget.bathroom == null &&
//         widget.bedhroom == null &&
//         max == null &&
//         min == null &&
//         widget.province != null) {
//       _search_hometype_province();
//     } else if (widget.hometype != null &&
//         widget.bathroom == null &&
//         widget.bedhroom != null &&
//         max == null &&
//         min == null &&
//         widget.province != null) {
//       _search_hometype_province_bed();
//     } else if (widget.hometype != null &&
//         widget.bathroom != null &&
//         widget.bedhroom != null &&
//         max != null &&
//         min != null &&
//         widget.province != null) {
//       _search_all();
//     }

//     super.initState();
//   }

//   List? search_list;
//   Future<void> proerty_search_bathrooms(query) async {
//     var jsonData;
//     final response = await http.get(Uri.parse(
//         'https://www.oneclickonedollar.com/laravel_kfa_2023/public/api/link_all_search_bathroom/${widget.bathroom}'));

//     if (response.statusCode == 200) {
//       jsonData = jsonDecode(response.body);
//       search_list = jsonData;
//       setState(() {
//         search_list;
//       });
//     }
//   }

//   Future<void> proerty_search_minmax() async {
//     var jsonData;
//     final response = await http.get(Uri.parse(
//         'https://www.oneclickonedollar.com/laravel_kfa_2023/public/api/link_all_search_MinMax?min=${min}&max=${max}'));

//     if (response.statusCode == 200) {
//       jsonData = jsonDecode(response.body);
//       search_list = jsonData;
//       setState(() {
//         search_list;
//       });
//     }
//   }

//   Future<void> proerty_search_bed_bathroom() async {
//     var jsonData;
//     final response = await http.get(Uri.parse(
//         'https://www.oneclickonedollar.com/laravel_kfa_2023/public/api/link_all_search_bedbatroom?bed=${widget.bedhroom}&bath=${widget.bathroom}'));

//     if (response.statusCode == 200) {
//       jsonData = jsonDecode(response.body);
//       search_list = jsonData;
//       setState(() {
//         search_list;
//       });
//     }
//   }

//   Future<void> proerty_search_bed_bathroom_hometype() async {
//     setState(() {});
//     var jsonData;
//     final response = await http.get(Uri.parse(
//         'https://www.oneclickonedollar.com/laravel_kfa_2023/public/api/link_all_search_bedbatroom_hometype?bed=${widget.bedhroom}&bath=${widget.bathroom}&hometype=${widget.hometype}'));

//     if (response.statusCode == 200) {
//       jsonData = jsonDecode(response.body);
//       search_list = jsonData;
//       setState(() {
//         search_list;
//       });
//     }
//   }

//   Future<void> proerty_search_bed_bathroom_hometype_minmax() async {
//     setState(() {
//       // print('bathroom = ${widget.bathroom}');
//       // print('bedhroom = ${widget.bedhroom}');
//       // print('max = ${max}');
//       // print('min = ${min}');
//       // print('hometype = ${widget.hometype}');
//     });
//     var jsonData;
//     final response = await http.get(Uri.parse(
//         'https://www.oneclickonedollar.com/laravel_kfa_2023/public/api/link_all_search_bedbatroom_hometype_minmax?bed=${widget.bedhroom.toString()}&bath=${widget.bathroom.toString()}&hometype=${widget.hometype.toString()}&min=${min}&max=${max}'));

//     if (response.statusCode == 200) {
//       jsonData = jsonDecode(response.body);
//       search_list = jsonData;
//       setState(() {
//         search_list;
//         print('proerty_search_bed_bathroom_hometype_minmax = ${search_list}');
//       });
//     }
//   }

//   Future<void> proerty_search_bed_bathroom_hometype_minmax_province() async {
//     setState(() {});
//     var jsonData;
//     final response = await http.get(Uri.parse(
//         'https://www.oneclickonedollar.com/laravel_kfa_2023/public/api/link_all_search_bedbatroom_hometype_minmax?bed=${widget.bedhroom.toString()}&bath=${widget.bathroom.toString()}&hometype=${widget.hometype.toString()}&min=${min}&max=${max}&Name_cummune=${widget.province}'));

//     if (response.statusCode == 200) {
//       jsonData = jsonDecode(response.body);
//       search_list = jsonData;
//       setState(() {
//         search_list;
//         print('proerty_search_bed_bathroom_hometype_minmax = ${search_list}');
//       });
//     }
//   }

//   Future<void> proerty_search_bed_bathroom_province() async {
//     setState(() {});
//     var jsonData;
//     final response = await http.get(Uri.parse(
//         'https://www.oneclickonedollar.com/laravel_kfa_2023/public/api/link_all_search_bed_bath_province?bed=${widget.bedhroom.toString()}&bath=${widget.bathroom.toString()}&Name_cummune=${widget.province.toString()}'));

//     if (response.statusCode == 200) {
//       jsonData = jsonDecode(response.body);
//       search_list = jsonData;
//       setState(() {
//         search_list;
//       });
//     }
//   }

//   Future<void> proerty_search_province() async {
//     setState(() {});
//     var jsonData;
//     final response = await http.get(Uri.parse(
//         'https://www.oneclickonedollar.com/laravel_kfa_2023/public/api/link_all_search_province?Name_cummune=${widget.province}'));

//     if (response.statusCode == 200) {
//       jsonData = jsonDecode(response.body);
//       search_list = jsonData;
//       setState(() {
//         search_list;
//       });
//     }
//   }

//   Future<void> proerty_search_hometype() async {
//     setState(() {});
//     var jsonData;
//     final response = await http.get(Uri.parse(
//         'https://www.oneclickonedollar.com/laravel_kfa_2023/public/api/link_all_search_hometype?hometype=${widget.hometype}'));

//     if (response.statusCode == 200) {
//       jsonData = jsonDecode(response.body);
//       search_list = jsonData;
//       setState(() {
//         search_list;
//       });
//     }
//   }

//   Future<void> proerty_search_hometype_minmax() async {
//     setState(() {});
//     var jsonData;
//     final response = await http.get(Uri.parse(
//         'https://www.oneclickonedollar.com/laravel_kfa_2023/public/api/link_all_search_hometype_minmax?hometype=${widget.hometype}&min=${min}&max=$max'));

//     if (response.statusCode == 200) {
//       jsonData = jsonDecode(response.body);
//       search_list = jsonData;
//       setState(() {
//         search_list;
//       });
//     }
//   }

//   Future<void> proerty_search_hometype_minmax_province() async {
//     setState(() {});
//     var jsonData;
//     final response = await http.get(Uri.parse(
//         'https://www.oneclickonedollar.com/laravel_kfa_2023/public/api/link_all_search_hometype_minmax_province?hometype=${widget.hometype}&min=${min}&max=${max}&Name_cummune=${widget.province}'));

//     if (response.statusCode == 200) {
//       jsonData = jsonDecode(response.body);
//       search_list = jsonData;
//       setState(() {
//         search_list;
//       });
//     }
//   }

//   Future<void> proerty_search_all() async {
//     setState(() {});
//     var jsonData;
//     final response = await http.get(Uri.parse(
//         'https://www.oneclickonedollar.com/laravel_kfa_2023/public/api/link_all_search_all?hometype=${widget.hometype}&min=$min&max=$max&Name_cummune=${widget.province}&bed=${widget.bedhroom}&bath=${widget.bathroom}'));

//     if (response.statusCode == 200) {
//       jsonData = jsonDecode(response.body);
//       search_list = jsonData;
//       setState(() {
//         search_list;
//       });
//     }
//   }

//   Future<void> proerty_search_bed_bathroom_province_hometype() async {
//     setState(() {});
//     var jsonData;
//     final response = await http.get(Uri.parse(
//         'https://www.oneclickonedollar.com/laravel_kfa_2023/public/api/link_all_search_bed_bath_province?bed=${widget.bedhroom.toString()}&bath=${widget.bathroom.toString()}&Name_cummune=${widget.province.toString()}&hometype=${widget.hometype}'));

//     if (response.statusCode == 200) {
//       jsonData = jsonDecode(response.body);
//       search_list = jsonData;
//       setState(() {
//         search_list;
//       });
//     }
//   }

//   Future<void> proerty_search_bed() async {
//     setState(() {});
//     var jsonData;
//     final response = await http.get(Uri.parse(
//         'https://www.oneclickonedollar.com/laravel_kfa_2023/public/api/link_all_search_bedroom?bed=${widget.bedhroom}'));

//     if (response.statusCode == 200) {
//       jsonData = jsonDecode(response.body);
//       search_list = jsonData;
//       setState(() {
//         search_list;
//       });
//     }
//   }

//   Future<void> proerty_search_hometype_province() async {
//     setState(() {});
//     var jsonData;
//     final response = await http.get(Uri.parse(
//         'https://www.oneclickonedollar.com/laravel_kfa_2023/public/api/link_all_search_hometype_province?hometype=${widget.hometype}&Name_cummune=${widget.province}'));

//     if (response.statusCode == 200) {
//       jsonData = jsonDecode(response.body);
//       search_list = jsonData;
//       setState(() {
//         search_list;
//       });
//     }
//   }

//   Future<void> proerty_search_hometype_province_bed() async {
//     setState(() {});
//     var jsonData;
//     final response = await http.get(Uri.parse(
//         'https://www.oneclickonedollar.com/laravel_kfa_2023/public/api/link_all_search_hometype_province_bed?hometype=${widget.hometype}&Name_cummune=${widget.province}&bed=${widget.bedhroom}'));

//     if (response.statusCode == 200) {
//       jsonData = jsonDecode(response.body);
//       search_list = jsonData;
//       setState(() {
//         search_list;
//       });
//     }
//   }

//   late PageController _pageController;
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         appBar: AppBar(
//           backgroundColor: Color.fromARGB(255, 20, 20, 163),
//           centerTitle: true,
//           title: Text('Searching'),
//         ),
//         body: _isLoading_re
//             ? Center(child: CircularProgressIndicator())
//             : (search_list != null)
//                 ? SingleChildScrollView(
//                     child: Column(
//                       children: [
//                         // Text(search_list!.length.toString()),
//                         // Text('Min = ${min}'),
//                         // Text('Max = ${max}'),
//                         // Text('bathroom = ${widget.bathroom}'),
//                         // Text('bedhroom = ${widget.bedhroom}'),
//                         // Text('hometype = ${widget.hometype}'),
//                         Container(
//                           height: MediaQuery.of(context).size.height * 0.8,
//                           width: double.infinity,
//                           child: PageView.builder(
//                             controller: _pageController,
//                             itemCount: (search_list!.length / 10).ceil(),
//                             itemBuilder: (context, index) {
//                               int startIndex = index * 10;
//                               int endIndex =
//                                   (startIndex + 10) > search_list!.length
//                                       ? search_list!.length
//                                       : startIndex + 10;
//                               List<dynamic> items =
//                                   search_list!.sublist(startIndex, endIndex);
//                               return ListView.builder(
//                                 itemCount: items.length,
//                                 itemBuilder: (context, index) {
//                                   return Padding(
//                                     padding: const EdgeInsets.only(
//                                         left: 10, right: 10, top: 10),
//                                     child: Container(
//                                       height:
//                                           MediaQuery.of(context).size.height *
//                                               0.25,
//                                       width: double.infinity,
//                                       decoration: BoxDecoration(
//                                           borderRadius:
//                                               BorderRadius.circular(7),
//                                           color: Color.fromARGB(
//                                               255, 197, 195, 195)),
//                                       child: Column(
//                                         children: [
//                                           Row(
//                                             children: [
//                                               Stack(
//                                                 children: [
//                                                   InkWell(
//                                                     onTap: () {
//                                                       verbal_ID = items[index]
//                                                               ['id_ptys']
//                                                           .toString();
//                                                       detail_property(
//                                                           index, items);
//                                                       setState(() {
//                                                         verbal_ID = items[index]
//                                                                 ['id_ptys']
//                                                             .toString();
//                                                         // print(verbal_ID);
//                                                       });
//                                                     },
//                                                     child: Padding(
//                                                       padding:
//                                                           const EdgeInsets.only(
//                                                               left: 4,
//                                                               bottom: 4,
//                                                               top: 4),
//                                                       child: Container(
//                                                         height: MediaQuery.of(
//                                                                     context)
//                                                                 .size
//                                                                 .height *
//                                                             0.23,
//                                                         width: 130,
//                                                         decoration: BoxDecoration(
//                                                             shape:
//                                                                 BoxShape.circle,
//                                                             image: DecorationImage(
//                                                                 image: NetworkImage(
//                                                                     '${items[index]['url'].toString()}'))),
//                                                         child:
//                                                             CachedNetworkImage(
//                                                           imageUrl: items[index]
//                                                                   ['url']
//                                                               .toString(),
//                                                           fit: BoxFit.cover,
//                                                           progressIndicatorBuilder:
//                                                               (context, url,
//                                                                       downloadProgress) =>
//                                                                   Center(
//                                                             child: CircularProgressIndicator(
//                                                                 value: downloadProgress
//                                                                     .progress),
//                                                           ),
//                                                           errorWidget: (context,
//                                                                   url, error) =>
//                                                               Icon(Icons.error),
//                                                         ),
//                                                       ),
//                                                     ),
//                                                   ),
//                                                   Positioned(
//                                                     top: MediaQuery.of(context)
//                                                             .size
//                                                             .height *
//                                                         0.2,
//                                                     left: 10,
//                                                     child: Row(
//                                                       children: [
//                                                         Container(
//                                                           alignment:
//                                                               Alignment.center,
//                                                           height: 25,
//                                                           width: 50,
//                                                           decoration: BoxDecoration(
//                                                               color: Color
//                                                                   .fromARGB(
//                                                                       255,
//                                                                       109,
//                                                                       160,
//                                                                       6),
//                                                               borderRadius:
//                                                                   BorderRadius
//                                                                       .circular(
//                                                                           5)),
//                                                           child: Text(
//                                                             '${items[index]['type'].toString()}',
//                                                             style: TextStyle(
//                                                                 // fontWeight: FontWeight.bold,
//                                                                 color: Color
//                                                                     .fromARGB(
//                                                                         255,
//                                                                         250,
//                                                                         246,
//                                                                         245),
//                                                                 fontSize: 12),
//                                                           ),
//                                                         ),
//                                                         SizedBox(
//                                                           width: MediaQuery.of(
//                                                                       context)
//                                                                   .size
//                                                                   .width *
//                                                               0.065,
//                                                         ),
//                                                         Container(
//                                                           alignment:
//                                                               Alignment.center,
//                                                           decoration: BoxDecoration(
//                                                               color: Color
//                                                                   .fromARGB(
//                                                                       255,
//                                                                       29,
//                                                                       7,
//                                                                       174),
//                                                               borderRadius:
//                                                                   BorderRadius
//                                                                       .circular(
//                                                                           5)),
//                                                           height: 25,
//                                                           width: 50,
//                                                           child: Text(
//                                                             '${items[index]['urgent'].toString()}',
//                                                             style: TextStyle(
//                                                                 fontSize: 12,
//                                                                 color: Colors
//                                                                     .white),
//                                                           ),
//                                                         ),
//                                                       ],
//                                                     ),
//                                                   ),
//                                                 ],
//                                               ),
//                                               Padding(
//                                                 padding: const EdgeInsets.only(
//                                                     left: 4, bottom: 4, top: 4),
//                                                 child: Container(
//                                                   height: MediaQuery.of(context)
//                                                           .size
//                                                           .height *
//                                                       0.23,
//                                                   width: 200,
//                                                   decoration: BoxDecoration(
//                                                     borderRadius:
//                                                         BorderRadius.circular(
//                                                             7),
//                                                     color: Color.fromARGB(
//                                                         255, 239, 241, 238),
//                                                   ),
//                                                   child: Padding(
//                                                     padding:
//                                                         const EdgeInsets.all(
//                                                             8.0),
//                                                     child: Column(
//                                                       children: [
//                                                         Row(
//                                                           mainAxisAlignment:
//                                                               MainAxisAlignment
//                                                                   .spaceAround,
//                                                           children: [
//                                                             Column(
//                                                               crossAxisAlignment:
//                                                                   CrossAxisAlignment
//                                                                       .start,
//                                                               children: [
//                                                                 Text(
//                                                                   'Property ID :',
//                                                                   style:
//                                                                       TextStyle(
//                                                                     fontWeight:
//                                                                         FontWeight
//                                                                             .bold,
//                                                                     fontSize:
//                                                                         12,
//                                                                   ),
//                                                                 ),
//                                                                 SizedBox(
//                                                                   height: 5,
//                                                                 ),
//                                                                 Text(
//                                                                   'Price :',
//                                                                   style:
//                                                                       TextStyle(
//                                                                     fontWeight:
//                                                                         FontWeight
//                                                                             .bold,
//                                                                     fontSize:
//                                                                         12,
//                                                                   ),
//                                                                 ),
//                                                                 SizedBox(
//                                                                   height: 5,
//                                                                 ),
//                                                                 Text(
//                                                                   'Land :',
//                                                                   style:
//                                                                       TextStyle(
//                                                                     fontWeight:
//                                                                         FontWeight
//                                                                             .bold,
//                                                                     fontSize:
//                                                                         12,
//                                                                   ),
//                                                                 ),
//                                                                 SizedBox(
//                                                                   height: 5,
//                                                                 ),
//                                                                 Text(
//                                                                   'bed :',
//                                                                   style:
//                                                                       TextStyle(
//                                                                     fontWeight:
//                                                                         FontWeight
//                                                                             .bold,
//                                                                     fontSize:
//                                                                         12,
//                                                                   ),
//                                                                 ),
//                                                                 SizedBox(
//                                                                   height: 5,
//                                                                 ),
//                                                                 Text(
//                                                                   'bath :',
//                                                                   style:
//                                                                       TextStyle(
//                                                                     fontWeight:
//                                                                         FontWeight
//                                                                             .bold,
//                                                                     fontSize:
//                                                                         12,
//                                                                   ),
//                                                                 ),
//                                                               ],
//                                                             ),
//                                                             Column(
//                                                               crossAxisAlignment:
//                                                                   CrossAxisAlignment
//                                                                       .start,
//                                                               children: [
//                                                                 Text(
//                                                                   '${items[index]['id_ptys'].toString()}',
//                                                                   style:
//                                                                       TextStyle(
//                                                                     fontWeight:
//                                                                         FontWeight
//                                                                             .bold,
//                                                                     fontSize:
//                                                                         12,
//                                                                   ),
//                                                                 ),
//                                                                 SizedBox(
//                                                                   height: 5,
//                                                                 ),
//                                                                 Text(
//                                                                   '${items[index]['price'].toString()} \$',
//                                                                   style:
//                                                                       TextStyle(
//                                                                     fontWeight:
//                                                                         FontWeight
//                                                                             .bold,
//                                                                     fontSize:
//                                                                         12,
//                                                                   ),
//                                                                 ),
//                                                                 SizedBox(
//                                                                   height: 5,
//                                                                 ),
//                                                                 Text(
//                                                                   '${items[index]['land'].toString()} ' +
//                                                                       'm' +
//                                                                       '\u00B2',
//                                                                   style:
//                                                                       TextStyle(
//                                                                     fontWeight:
//                                                                         FontWeight
//                                                                             .bold,
//                                                                     fontSize:
//                                                                         12,
//                                                                   ),
//                                                                 ),
//                                                                 SizedBox(
//                                                                   height: 5,
//                                                                 ),
//                                                                 Text(
//                                                                   '${items[index]['bed'].toString()}',
//                                                                   style:
//                                                                       TextStyle(
//                                                                     fontWeight:
//                                                                         FontWeight
//                                                                             .bold,
//                                                                     fontSize:
//                                                                         12,
//                                                                   ),
//                                                                 ),
//                                                                 SizedBox(
//                                                                   height: 5,
//                                                                 ),
//                                                                 Text(
//                                                                   '${items[index]['bath'].toString()}',
//                                                                   style:
//                                                                       TextStyle(
//                                                                     fontWeight:
//                                                                         FontWeight
//                                                                             .bold,
//                                                                     fontSize:
//                                                                         12,
//                                                                   ),
//                                                                 ),
//                                                               ],
//                                                             ),
//                                                           ],
//                                                         ),
//                                                         Divider(
//                                                           height: 10,
//                                                           thickness: 2,
//                                                           color: Colors.black,
//                                                         ),
//                                                         Row(
//                                                           mainAxisAlignment:
//                                                               MainAxisAlignment
//                                                                   .spaceAround,
//                                                           children: [
//                                                             Container(
//                                                               height: 40,
//                                                               width: 30,
//                                                               child: IconButton(
//                                                                   onPressed:
//                                                                       () async {
//                                                                     print(items[index]
//                                                                             [
//                                                                             'id_ptys']
//                                                                         .toString());
//                                                                     // await Printing.layoutPdf(
//                                                                     //     onLayout: (format) => _generatePdf(
//                                                                     //         format,
//                                                                     //         search_list!,
//                                                                     //         index));
//                                                                     print(index
//                                                                         .toString());
//                                                                   },
//                                                                   icon: Icon(
//                                                                     Icons.print,
//                                                                     size: 25,
//                                                                     color: Color
//                                                                         .fromARGB(
//                                                                             255,
//                                                                             19,
//                                                                             14,
//                                                                             164),
//                                                                   )),
//                                                             ),
//                                                             Container(
//                                                               height: 40,
//                                                               width: 30,
//                                                               child: IconButton(
//                                                                   onPressed:
//                                                                       () {
//                                                                     verbal_ID = items[index]
//                                                                             [
//                                                                             'id_ptys']
//                                                                         .toString();
//                                                                     detail_property(
//                                                                         index,
//                                                                         items);
//                                                                     setState(
//                                                                         () {
//                                                                       verbal_ID =
//                                                                           items[index]['id_ptys']
//                                                                               .toString();
//                                                                       // print(verbal_ID);
//                                                                     });
//                                                                   },
//                                                                   icon: Icon(
//                                                                     Icons
//                                                                         .details_outlined,
//                                                                     size: 25,
//                                                                     color: Color
//                                                                         .fromARGB(
//                                                                             255,
//                                                                             64,
//                                                                             132,
//                                                                             9),
//                                                                   )),
//                                                             ),
//                                                           ],
//                                                         ),
//                                                       ],
//                                                     ),
//                                                   ),
//                                                 ),
//                                               ),
//                                             ],
//                                           ),
//                                         ],
//                                       ),
//                                     ),
//                                   );
//                                 },
//                               );
//                             },
//                           ),
//                         ),
//                         Padding(
//                           padding: const EdgeInsets.all(8.0),
//                           child: Row(
//                             mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                             children: [
//                               InkWell(
//                                 onTap: () {
//                                   _pageController.previousPage(
//                                       duration: Duration(milliseconds: 300),
//                                       curve: Curves.easeInOut);
//                                 },
//                                 child: Container(
//                                   alignment: Alignment.center,
//                                   height: 36,
//                                   width:
//                                       MediaQuery.of(context).size.width * 0.2,
//                                   decoration: BoxDecoration(
//                                       borderRadius: BorderRadius.circular(5),
//                                       color: Color.fromARGB(255, 152, 33, 25)),
//                                   child: Text(
//                                     'Back',
//                                     style: TextStyle(
//                                         color: Colors.white,
//                                         fontSize: 15,
//                                         fontWeight: FontWeight.bold),
//                                   ),
//                                 ),
//                               ),
//                               InkWell(
//                                 onTap: () {
//                                   _pageController.nextPage(
//                                       duration: Duration(milliseconds: 300),
//                                       curve: Curves.easeInOut);
//                                 },
//                                 child: Container(
//                                   alignment: Alignment.center,
//                                   height: 36,
//                                   width:
//                                       MediaQuery.of(context).size.width * 0.2,
//                                   decoration: BoxDecoration(
//                                       borderRadius: BorderRadius.circular(5),
//                                       color: Color.fromARGB(255, 18, 36, 142)),
//                                   child: Text(
//                                     'Next',
//                                     style: TextStyle(
//                                         color: Colors.white,
//                                         fontSize: 15,
//                                         fontWeight: FontWeight.bold),
//                                   ),
//                                 ),
//                               ),
//                             ],
//                           ),
//                         ),
//                       ],
//                     ),
//                   )
//                 : Center(
//                     child: Text(
//                     'Please Select Option for Search',
//                     style: TextStyle(
//                         fontSize: MediaQuery.of(context).size.height * 0.02,
//                         fontWeight: FontWeight.bold),
//                   )));
//   }

//   Color kImageColor = Color.fromRGBO(169, 203, 56, 1);
//   String? verbal_ID;
//   Future<void> detail_property(int index, List list) async {
//     Navigator.push(
//       context,
//       MaterialPageRoute(
//         builder: (context) => Detail_property_sale_all(
//           verbal_ID: verbal_ID,
//           list_get_sale: list,
//         ),
//       ),
//     );
//   }
// }
