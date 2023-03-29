// ignore_for_file: unnecessary_import, unused_import, camel_case_types, unnecessary_new, unnecessary_brace_in_string_interps, non_constant_identifier_names, unused_field, avoid_unnecessary_containers, prefer_const_constructors, avoid_print, unused_local_variable, unnecessary_string_interpolations, prefer_is_empty, prefer_typing_uninitialized_variables

import 'dart:typed_data';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:getwidget/getwidget.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:http/http.dart' as http;
import 'package:kfa_admin/interface/mobile/navigate_home/Verbal/Edit_verbal.dart';
import 'dart:convert';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:printing/printing.dart';

import '../../../../components/get_image_by_firsbase.dart';
import '../../../../model/land_building.dart';
import '../../../../model/models/autoVerbal.dart';
import '../AutoVerbal/Deteil.dart';
import '../AutoVerbal/Edit.dart';

class Verbals_list extends StatefulWidget {
  const Verbals_list({super.key});

  @override
  State<Verbals_list> createState() => _Show_autoVerbalState();
}

class _Show_autoVerbalState extends State<Verbals_list> {
  // Future<List<AutoVerbal_List>> fetchData() async {
  //   final response = await http.get(Uri.parse(
  //       'https://www.oneclickonedollar.com/laravel_kfa_2023/public/api/verbals/list'));
  //   if (response.statusCode == 200) {
  //     List jsonResponse = json.decode(response.body);
  //     return jsonResponse
  //         .map((data) => new AutoVerbal_List.fromJson(data))
  //         .toList();
  //   } else {
  //     throw Exception('Unexpected error occured!');
  //   }
  // }
  List list = [];
  void Load() async {
    setState(() {});
    var rs = await http.get(Uri.parse(
        'https://www.oneclickonedollar.com/laravel_kfa_2023/public/api/verbals/list'));

    if (rs.statusCode == 200) {
      var jsonData = jsonDecode(rs.body);

      setState(() {
        list = jsonData;
      });
    }
  }

//delete id
  void deleteDataId({required String verbalIds}) async {
    final response = await http.delete(Uri.parse(
        'https://www.oneclickonedollar.com/laravel_kfa_2023/public/api/verbals/delete/${verbalIds}'));
    if (response.statusCode == 200) {
      // ScaffoldMessenger.of(context).showSnackBar(
      //   SnackBar(content: Text('${verbalIds} deleted successfully')),
      // );
    } else {
      throw Exception('Delete error occured!');
    }
  }

  var image_i, get_image = [];
  Future<void> getimage(id) async {
    // var id;

    var rs = await http.get(Uri.parse(
        'https://www.oneclickonedollar.com/laravel_kfa_2023/public/api/get_image/${id}'));
    if (rs.statusCode == 200) {
      var jsonData = jsonDecode(rs.body);

      setState(() {
        get_image = jsonData;
        image_i = get_image[0]['url'];
        print("=====as=da=sd=a=sd==as= ${image_i}");
      });
    }
  }

  var image_m, get_image_m = [];
  Future<void> getimage_m(id) async {
    var rs = await http.get(Uri.parse(
        'https://www.oneclickonedollar.com/laravel_kfa_2023/public/api/get_image_map/${id}'));
    if (rs.statusCode == 200) {
      var jsonData = jsonDecode(rs.body);

      setState(() {
        get_image_m = jsonData;
        image_m = get_image_m[0]['url'];
        print("object  ${image_m}");
      });
    }
  }

  int i = 0;
  static int? total_MIN = 0;
  static int? total_MAX = 0;
  List<AutoVerbal_List> data_pdf = [];
  List land = [];
  late double fsvM, fsvN, fx, fn;
  static String address = "";
  String? image_map;
  String? image;
  List<L_B> lb = [];

  @override
  void initState() {
    land;
    Load();
    total_MIN = 0;
    total_MAX = 0;
    data_pdf;
    fsvM = 0;
    fsvN = 0;
    fx = 0;
    fn = 0;
    image_map;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.lightBlue[900],
        title: const Text(
          "Verbal List",
          style: TextStyle(
              fontWeight: FontWeight.bold, fontSize: 25, color: Colors.white),
        ),
      ),
      body: Container(
        child: ListView.builder(
            itemCount: list.length,
            itemBuilder: (BuildContext context, int index) {
              return Container(
                height: MediaQuery.of(context).size.height * 0.47,
                margin: const EdgeInsets.all(10),
                padding: const EdgeInsets.all(20),
                decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(25),
                        bottomRight: Radius.circular(25)),
                    boxShadow: [BoxShadow(color: Colors.black, blurRadius: 5)]),
                child: Column(
                  children: [
                    Expanded(
                        flex: 4,
                        child: Column(
                          children: [
                            Container(
                              margin: EdgeInsets.only(top: 4, bottom: 4),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text("Code :",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: MediaQuery.of(context)
                                                  .textScaleFactor *
                                              15)),
                                  Text(list[index]['verbal_id'].toString(),
                                      style: TextStyle(
                                          fontSize: MediaQuery.of(context)
                                                  .textScaleFactor *
                                              15)),
                                ],
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.only(top: 4, bottom: 4),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text("Property Type :",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: MediaQuery.of(context)
                                                  .textScaleFactor *
                                              15)),
                                  Text(
                                      list[index]['property_type_name']
                                          .toString(),
                                      style: TextStyle(
                                          fontSize: MediaQuery.of(context)
                                                  .textScaleFactor *
                                              15)),
                                ],
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.only(top: 4, bottom: 4),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text("Address :",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: MediaQuery.of(context)
                                                  .textScaleFactor *
                                              15)),
                                  Text(list[index]['verbal_address'].toString(),
                                      style: TextStyle(
                                          fontSize: MediaQuery.of(context)
                                                  .textScaleFactor *
                                              14)),
                                ],
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.only(top: 4, bottom: 4),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Expanded(
                                    flex: 2,
                                    child: Text("Bank :",
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: MediaQuery.of(context)
                                                    .textScaleFactor *
                                                15)),
                                  ),
                                  Expanded(
                                    flex: 3,
                                    child: Text(
                                        list[index]['bank_name'].toString(),
                                        style: TextStyle(
                                          fontSize: MediaQuery.of(context)
                                                  .textScaleFactor *
                                              12,
                                          fontWeight: FontWeight.bold,
                                        )),
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.only(top: 4, bottom: 4),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text("Agency :",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: MediaQuery.of(context)
                                                  .textScaleFactor *
                                              15)),
                                  Text(list[index]['agenttype_name'].toString(),
                                      style: TextStyle(
                                          fontSize: MediaQuery.of(context)
                                                  .textScaleFactor *
                                              14)),
                                ],
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.only(top: 4, bottom: 4),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text("Create date :",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: MediaQuery.of(context)
                                                  .textScaleFactor *
                                              15)),
                                  Text(
                                      list[index]['verbal_created_date']
                                          .toString(),
                                      style: TextStyle(
                                          fontSize: MediaQuery.of(context)
                                                  .textScaleFactor *
                                              14)),
                                ],
                              ),
                            ),
                          ],
                        )),
                    const Divider(
                      color: Colors.black,
                      thickness: 4,
                      height: 2,
                    ),
                    Expanded(
                      // ignore: sort_child_properties_last
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          GFButton(
                            shape: GFButtonShape.pills,
                            color: const Color.fromRGBO(38, 166, 154, 1),
                            elevation: 5,
                            onPressed: () {
                              setState(() {
                                Navigator.of(context).push(MaterialPageRoute(
                                    builder: (context) => Detail(
                                          id: 0,
                                          code: list[0]['verbal_id'].toString(),
                                          pro_check: 2,
                                        )));
                              });
                            },
                            text: 'Detail',
                            icon: const Icon(
                              Icons.import_contacts,
                              color: Colors.white,
                            ),
                          ),
                          GFButton(
                            shape: GFButtonShape.pills,
                            color: Color.fromRGBO(33, 57, 76, 30),
                            elevation: 5,
                            onPressed: () async {
                              await getimage(list[index]['verbal_id']);
                              await getimage_m(list[index]['verbal_id']);
                              await Get_land(list[index]['verbal_id']);

                              setState(() {
                                Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) => EditVerbal(
                                    land_list: data_of_land,
                                    cell_land: lb,
                                    image_photo: image_i,
                                    image_map: image_m,
                                    property_type_id: list[index]
                                            ['verbal_property_id']
                                        .toString(),
                                    lat: list[index]['latlong_la'].toString(),
                                    lng: list[index]['latlong_log'].toString(),
                                    address: list[index]['verbal_address']
                                        .toString(),
                                    approve_id:
                                        list[index]['approve_id'].toString(),
                                    agent:
                                        list[index]['agenttype_id'].toString(),
                                    bank_branch_id: (list[index]
                                                ['verbal_bank_branch_id'] ==
                                            null)
                                        ? '0'
                                        : list[index]['verbal_bank_branch_id']
                                            .toString(),
                                    bank_contact: list[index]
                                            ['verbal_bank_contact']
                                        .toString(),
                                    bank_id: list[index]['verbal_bank_id']
                                        .toString(),
                                    bank_officer: list[index]
                                            ['verbal_bank_officer']
                                        .toString(),
                                    comment: list[index]['verbal_comment']
                                        .toString(),
                                    contact: list[index]['verbal_contact']
                                        .toString(),
                                    image:
                                        list[index]['verbal_image'].toString(),
                                    option:
                                        list[index]['verbal_option'].toString(),
                                    owner:
                                        list[index]['verbal_owner'].toString(),
                                    user: list[index]['verbal_user'].toString(),
                                    verbal_com:
                                        list[index]['verbal_com'].toString(),
                                    verbal_con:
                                        list[index]['verbal_con'].toString(),
                                    verbal: data_of_land,
                                    verbal_id: int.parse(
                                      list[index]['verbal_id'].toString(),
                                    ),
                                    n_pro: list[index]['property_type_name']
                                        .toString(),
                                    n_bank:
                                        list[index]['bank_acronym'].toString(),
                                    n_agent: list[index]['agenttype_name']
                                        .toString(),
                                    n_appro:
                                        list[index]['approve_name'].toString(),
                                  ),
                                ));
                              });
                            },
                            text: 'Edit',
                            icon: const Icon(
                              Icons.edit,
                              color: Colors.white,
                            ),
                          ),
                          GFButton(
                            shape: GFButtonShape.pills,
                            color: Colors.red,
                            elevation: 5,
                            onPressed: () {
                              setState(() {
                                deleteDataId(
                                    verbalIds:
                                        list[index]['verbal_id'].toString());
                                Navigator.pop(context);
                                Navigator.of(context).push(MaterialPageRoute(
                                    builder: (context) => Verbals_list()));
                              });
                            },
                            text: 'Delete',
                            icon: const Icon(
                              Icons.delete,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                      //   //         flex: 1,
                    ),
                    //       GFButton(
                    //         shape: GFButtonShape.pills,
                    //         color: Color.fromRGBO(33, 150, 243, 1),
                    //         elevation: 10.0,
                    //         fullWidthButton: true,
                    //         onPressed: () async {
                    //           await getimage(snapshot.data![index].verbalId);
                    //           await getimage_m(snapshot.data![index].verbalId);
                    //           Navigator.push(
                    //               context,
                    //               MaterialPageRoute(
                    //                   builder: (context) =>
                    //                       Get_Image_By_Firbase(
                    //                         com_id: snapshot
                    //                             .data![index].verbalId
                    //                             .toString(),
                    //                         fsv: snapshot.data![index].verbalCon
                    //                             .toString(),
                    //                         i: index,
                    //                         property_check: '2',
                    //                         image: image_i,
                    //                         image_map: image_m,
                    //                       )));
                    //         },
                    //         text: 'Print',
                    //         icon: const Icon(
                    //           Icons.print,
                    //           color: Colors.white,
                    //         ),
                    // ),
                  ],
                ),
              );
            }),
      ),
      // floatingActionButton: FloatingActionButton(
      //   backgroundColor: Colors.blue[700],
      //   elevation: 10,
      //   onPressed: () {
      //     // setState(() {});
      //     showSearch(
      //       context: context,
      //       delegate: SearchUser(),
      //       // query: '2022',
      //     );
      //   },
      //   child: const Icon(
      //     Icons.search_sharp,
      //   ),
      // ),
    );
  }

  List data_of_land = [];
  Future<void> Get_land(id) async {
    setState(() {
      // lb.clear();
    });
    var rs = await http.get(Uri.parse(
        'https://www.oneclickonedollar.com/laravel_kfa_2023/public/api/autoverbal/list_land?verbal_landid=$id'));
    if (rs.statusCode == 200) {
      var jsonData = jsonDecode(rs.body);
      setState(() {
        data_of_land = jsonData;
        // print(data_of_land);
        // for (int i = 0; i < data_of_land.length; i++) {
        //   lb.add(L_B(
        //       data_of_land[i]['verbal_land_type'],
        //       data_of_land[i]['verbal_land_des'],
        //       data_of_land[i]['verbal_land_dp'],
        //       data_of_land[i]['address'],
        //       int.parse(data_of_land[i]['verbal_landid']),
        //       double.parse(data_of_land[i]['verbal_land_area']),
        //       double.parse(data_of_land[i]['verbal_land_minsqm']),
        //       double.parse(data_of_land[i]['verbal_land_maxsqm']),
        //       double.parse(data_of_land[i]['verbal_land_minvalue']),
        //       double.parse(data_of_land[i]['verbal_land_maxvalue'])));
        // }
      });
    }
  }
}
