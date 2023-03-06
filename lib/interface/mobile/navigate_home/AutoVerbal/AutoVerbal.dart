import 'package:flutter/material.dart';
import 'package:getwidget/getwidget.dart';
import 'package:http/http.dart' as http;
import 'package:kfa_admin/components/get_image_by_firsbase.dart';
import 'package:kfa_admin/interface/mobile/navigate_home/AutoVerbal/Deteil.dart';
import 'package:kfa_admin/interface/mobile/navigate_home/AutoVerbal/Edit.dart';

import 'package:kfa_admin/model/models/autoVerbal.dart';
import 'package:kfa_admin/search/Search-Verbal-ID.dart';
import 'dart:convert';

import '../../../../model/land_building.dart';

class Show_autoVerbals extends StatefulWidget {
  const Show_autoVerbals({super.key});

  @override
  State<Show_autoVerbals> createState() => _Show_autoVerbalState();
}

class _Show_autoVerbalState extends State<Show_autoVerbals> {
  Future<List<AutoVerbal_List>> fetchData() async {
    final response = await http.get(Uri.parse(
        'https://www.oneclickonedollar.com/laravel_kfa_2023/public/api/autoverbal/list'));
    if (response.statusCode == 200) {
      List jsonResponse = json.decode(response.body);
      return jsonResponse
          .map((data) => new AutoVerbal_List.fromJson(data))
          .toList();
    } else {
      throw Exception('Unexpected error occured!');
    }
  }

  void deleteDataId({required String verbalIds}) async {
    final response = await http.delete(Uri.parse(
        'https://www.oneclickonedollar.com/laravel_kfa_2023/public/api/autoverbal/delete/${verbalIds}'));
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
    var rs = await http.get(Uri.parse(
        'https://www.oneclickonedollar.com/laravel_kfa_2023/public/api/get_image/${id}'));
    if (rs.statusCode == 200) {
      var jsonData = jsonDecode(rs.body);
      setState(() {
        get_image = jsonData;
        image_i = get_image[0]['url'];
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
  List<L_B> lb = [];
  @override
  void initState() {
    land;
    total_MIN = 0;
    total_MAX = 0;
    data_pdf;
    fsvM = 0;
    fsvN = 0;
    fx = 0;
    fn = 0;

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.lightBlue[900],
        title: const Text(
          "AutoVerbal List",
          style: TextStyle(
              fontWeight: FontWeight.bold, fontSize: 25, color: Colors.white),
        ),
      ),
      body: Container(
        child: FutureBuilder<List<AutoVerbal_List>>(
          future: fetchData(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return ListView.builder(
                  itemCount: snapshot.data?.length,
                  itemBuilder: (BuildContext context, int index) {
                    final cdt = snapshot.data![index];
                    data_pdf.add(snapshot.data![index]);
                    data_pdf[index] = snapshot.data![index];
                    return Container(
                        height: MediaQuery.of(context).size.height * 0.47,
                        margin: const EdgeInsets.all(10),
                        padding: const EdgeInsets.all(20),
                        decoration: const BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(25),
                                bottomRight: Radius.circular(25)),
                            boxShadow: [
                              BoxShadow(color: Colors.black, blurRadius: 5)
                            ]),
                        child: Column(children: [
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
                                        Text(cdt.verbalId.toString(),
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
                                        Text(cdt.propertyTypeName.toString(),
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
                                        Text(cdt.verbalAddress.toString(),
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
                                                  fontSize:
                                                      MediaQuery.of(context)
                                                              .textScaleFactor *
                                                          15)),
                                        ),
                                        Expanded(
                                          flex: 3,
                                          child: Text(cdt.bankName.toString(),
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
                                        Text(cdt.agenttypeName.toString(),
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
                                        Text(cdt.verbalCreatedDate.toString(),
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
                                      Navigator.of(context)
                                          .push(MaterialPageRoute(
                                              builder: (context) => Detail(
                                                    id: index,
                                                    code: data_pdf
                                                        .elementAt(index)
                                                        .verbalId
                                                        .toString(),
                                                    pro_check: 1,
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
                                    await getimage(
                                        snapshot.data![index].verbalId);
                                    await getimage_m(
                                        snapshot.data![index].verbalId);
                                    await Get_land(snapshot
                                        .data![index].verbalId
                                        .toString());

                                    setState(() {
                                      // print("koko");
                                      Navigator.of(context)
                                          .push(MaterialPageRoute(
                                        builder: (context) => Edit(
                                          land_list: data_of_land,
                                          cell_land: lb,
                                          image_photo: image_i,
                                          image_map: image_m,
                                          property_type_id: snapshot
                                              .data![index].propertyTypeId
                                              .toString(),
                                          lat: snapshot.data![index].latlongLa
                                              .toString(),
                                          lng: snapshot.data![index].latlongLog
                                              .toString(),
                                          address: snapshot
                                              .data![index].verbalAddress
                                              .toString(),
                                          approve_id: snapshot
                                              .data![index].approveId
                                              .toString(),
                                          agent: snapshot
                                              .data![index].agenttypeId
                                              .toString(),
                                          bank_branch_id: (snapshot.data![index]
                                                      .verbalBankBranchId ==
                                                  null)
                                              ? '0'
                                              : snapshot.data![index]
                                                  .verbalBankBranchId
                                                  .toString(),
                                          bank_contact: snapshot
                                              .data![index].verbalBankContact
                                              .toString(),
                                          bank_id: snapshot
                                              .data![index].verbalBankId
                                              .toString(),
                                          bank_officer: snapshot
                                              .data![index].verbalBankOfficer
                                              .toString(),
                                          comment: snapshot
                                              .data![index].verbalComment
                                              .toString(),
                                          contact: snapshot
                                              .data![index].verbalContact
                                              .toString(),
                                          image: snapshot.data![index].verbalId
                                              .toString(),
                                          option: snapshot
                                              .data![index].verbalOption
                                              .toString(),
                                          owner: snapshot
                                              .data![index].verbalOwner
                                              .toString(),
                                          user: snapshot.data![index].verbalUser
                                              .toString(),
                                          verbal_com: snapshot
                                              .data![index].verbalCom
                                              .toString(),
                                          verbal_con: snapshot
                                              .data![index].verbalCon
                                              .toString(),
                                          verbal: data_of_land,
                                          verbal_id: int.parse(snapshot
                                              .data![index].verbalId
                                              .toString()),
                                          n_pro: snapshot
                                              .data![index].propertyTypeName
                                              .toString(),
                                          n_bank: snapshot
                                              .data![index].bankAcronym
                                              .toString(),
                                          n_agent: snapshot
                                              .data![index].agenttypeName
                                              .toString(),
                                          n_appro: snapshot
                                              .data![index].approveName
                                              .toString(),
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
                                          verbalIds: cdt.verbalId.toString());
                                      Navigator.pop(context);
                                      Navigator.of(context).push(
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  Show_autoVerbals()));
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
                            flex: 1,
                          ),
                          GFButton(
                            shape: GFButtonShape.pills,
                            color: Color.fromRGBO(33, 150, 243, 1),
                            elevation: 10.0,
                            fullWidthButton: true,
                            onPressed: () async {
                              await getimage(snapshot.data![index].verbalId);
                              await getimage_m(snapshot.data![index].verbalId);
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          Get_Image_By_Firbase(
                                            com_id: snapshot
                                                .data![index].verbalId
                                                .toString(),
                                            fsv: snapshot.data![index].verbalCon
                                                .toString(),
                                            i: index,
                                            property_check: '1',
                                            image: image_i,
                                            image_map: image_m,
                                          )));
                            },
                            text: 'Print',
                            icon: const Icon(
                              Icons.print,
                              color: Colors.white,
                            ),
                          ),
                        ]));
                  });
            } else if (snapshot.hasError) {
              return const Center(child: Text("Server is not responding"));
            } else {
              return Container(
                  alignment: Alignment.center,
                  height: MediaQuery.of(context).size.height * 1,
                  decoration: BoxDecoration(
                    color: Colors.blue[50],
                    image: const DecorationImage(
                      alignment: Alignment.center,
                      image: ExactAssetImage('assets/images/New_KFA_Logo.png'),
                      fit: BoxFit.fitWidth,
                    ),
                  ),
                  child: CircularProgressIndicator());
            }
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.blue[700],
        elevation: 10,
        onPressed: () {
          setState(() {});
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => Search_verbal(),
              ));
        },
        child: const Icon(
          Icons.search_sharp,
        ),
      ),
    );
  }

  void Land(String i, String fsv) async {
    double x = 0, n = 0;
    var jsonData;
    var rs = await http.get(Uri.parse(
        'https://www.oneclickonedollar.com/laravel_kfa_2023/public/api/autoverbal/list_land?verbal_landid=$i'));
    if (rs.statusCode == 200) {
      jsonData = jsonDecode(rs.body);
      land = jsonData;
      setState(() {
        for (int i = 0; i < land.length; i++) {
          total_MIN = total_MIN! + int.parse(land[i]["verbal_land_minvalue"]);
          total_MAX = total_MAX! + int.parse(land[i]["verbal_land_maxvalue"]);
          // address = land[i]["address"];
          x = x + int.parse(land[i]["verbal_land_maxsqm"]);
          n = n + int.parse(land[i]["verbal_land_minsqm"]);
        }
        fsvM = (total_MAX! * double.parse(fsv)) / 100;
        fsvN = (total_MIN! * double.parse(fsv)) / 100;

        if (land.length < 1) {
          total_MIN = 0;
          total_MAX = 0;
        } else {
          fx = x * (double.parse(fsv) / 100);
          fn = n * (double.parse(fsv) / 100);
        }
      });
    }
  }

  List data_of_land = [];
  Future<void> Get_land(id) async {
    setState(() {
      lb.clear();
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
