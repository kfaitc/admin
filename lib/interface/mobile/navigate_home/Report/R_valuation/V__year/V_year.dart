import 'dart:convert';
import 'dart:math';

import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:get/get.dart';
import 'package:getwidget/components/badge/gf_button_badge.dart';
import 'package:getwidget/getwidget.dart';
import 'package:kfa_admin/components/ToFromDate.dart';
import 'package:kfa_admin/components/bank.dart';
import 'package:kfa_admin/contants.dart';
import 'package:http/http.dart' as http;
import 'package:async/async.dart';

class v_year extends StatefulWidget {
  const v_year({super.key});

  @override
  State<v_year> createState() => _v_yearState();
}

class _v_yearState extends State<v_year> with SingleTickerProviderStateMixin {
  TabController? _tabController;
  List options = [];
  List<String> selectedOptions = [];
  String? start, end;
  double count_number_y1 = 0.0;
  double count_number_y2 = 0.0;
  double count_number_y3 = 0.0;
  String name_of_year1 = '', name_of_year2 = '', name_of_year3 = '';
  var name_bank, bank_branch_id;
  List<String>? selectedDataString;
  List<PieChartSectionData> dataset = [];
  Object? dropdownValue;
  Random random = Random();
  Future<List> fetchData_get_by_bank_has_branch() async {
    List list = [];
    int count_number;
    var rs = await http.get(
      Uri.parse(
          'https://www.oneclickonedollar.com/laravel_kfa_2023/public/api/verbals/list?start=${start}&end=${end}&bank_id=${name_bank}&bank_branch_id=${json.encode(options)}'),
      headers: {'Content-Type': 'application/json'},
    );
    if (rs.statusCode == 200) {
      var jsonData = jsonDecode(rs.body);

      setState(() {
        list = jsonData['data'];
        for (int i = 0; i < list.length; i++) {
          dataset.add(PieChartSectionData(
              value: double.parse(list[i]['count'].toString()),
              title: list[i]['count'].toString(),
              titleStyle: TextStyle(fontSize: 14),
              badgeWidget: Text(
                list[i]['name'][0]['bank_branch_name'],
                style: TextStyle(fontSize: 5),
              ),
              badgePositionPercentageOffset: 1,
              color: Color.fromARGB(
                255,
                random.nextInt(256),
                random.nextInt(256),
                random.nextInt(256),
              ),
              radius: 110));
        }
      });
    }
    return list;
  }

  Future<List> fetchData_get_by_bank() async {
    List list = [];
    int count_number;
    var rs = await http.get(Uri.parse(
        'https://www.oneclickonedollar.com/laravel_kfa_2023/public/api/verbals/list?start=${start}&end=${end}&bank_id=${name_bank}'));
    if (rs.statusCode == 200) {
      var jsonData = jsonDecode(rs.body);

      setState(() {
        print(jsonData['data'][0]['bank_name']);
        dataset.add(PieChartSectionData(
            value: double.parse(jsonData['count'].toString()),
            title: jsonData['count'].toString(),
            titleStyle: TextStyle(fontSize: 14),
            badgeWidget: Text(
              jsonData['data'][0]['bank_name'],
              style: TextStyle(fontSize: 5),
            ),
            badgePositionPercentageOffset: 1,
            color: Color.fromARGB(
              255,
              random.nextInt(256),
              random.nextInt(256),
              random.nextInt(256),
            ),
            radius: 110));
      });
    }
    return list;
  }

  var _list = [];
  var _branch = [];
  late String bankvalue;
  late String branchvalue;
  var bank = [
    'Bank',
    'Private',
    'Other',
  ];
  void Load() async {
    setState(() {});
    var rs = await http.get(Uri.parse(
        'https://www.oneclickonedollar.com/laravel_kfa_2023/public/api/bank'));
    if (rs.statusCode == 200) {
      var jsonData = jsonDecode(rs.body);
      // print(jsonData);
      // print(jsonData);

      setState(() {
        _list = jsonData['banks'];
      });
    }
  }

  branch(String value) async {
    var rs = await http.get(Uri.parse(
        'https://www.oneclickonedollar.com/laravel_kfa_2023/public/api/bankbranch?bank_branch_details_id=' +
            value));
    if (rs.statusCode == 200) {
      var jsonData = jsonDecode(rs.body.toString());
      // print(jsonData);
      setState(() {
        _branch = jsonData['bank_branches'];
      });
    }
  }

  void _onCountriesSelectionComplete(value) {
    selectedDataString?.addAll(value);
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    Load();
    _tabController = TabController(
        length: 3,
        vsync: this); // Change the length according to your number of tabs
  }

  int i = 0;
  bool b1 = true, b2 = false, b3 = false;
  @override
  void dispose() {
    _tabController!.animateTo(3);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Valuation Report by Year'),
        backgroundColor: Colors.deepPurple[900],
        elevation: 0.0,
      ),
      backgroundColor: Colors.blue[100],
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.all(10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Colors.blue[200],
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  GFButton(
                    onPressed: () {
                      setState(() {
                        i = 0;
                        b1 = true;
                        b2 = false;
                        b3 = false;
                      });
                      setState(() {
                        options.clear();
                        dataset.clear();
                      });
                    },
                    color: (b1) ? kImageColor : Colors.blue,
                    text: "Bank 1",
                    boxShadow: BoxShadow(
                        blurRadius: 5,
                        color: (b1)
                            ? Colors.grey
                            : Color.fromRGBO(187, 222, 251, 1),
                        offset: Offset(3, 5)),
                    shape: GFButtonShape.pills,
                  ),
                  GFButton(
                    onPressed: () {
                      setState(() {
                        i = 1;
                        b1 = false;
                        b2 = true;
                        b3 = false;
                      });
                      setState(() {
                        options.clear();
                        dataset.clear();
                      });
                    },
                    boxShadow: BoxShadow(
                        blurRadius: 5,
                        color: (b2)
                            ? Colors.grey
                            : Color.fromRGBO(187, 222, 251, 1),
                        offset: Offset(3, 5)),
                    text: "Bank 2",
                    color: (b2) ? kImageColor : Colors.blue,
                    shape: GFButtonShape.pills,
                  ),
                  GFButton(
                    onPressed: () {
                      setState(() {
                        i = 2;
                        b1 = false;
                        b2 = false;
                        b3 = true;
                      });
                      setState(() {
                        options.clear();
                        dataset.clear();
                      });
                    },
                    boxShadow: BoxShadow(
                        blurRadius: 5,
                        color: (b3)
                            ? Colors.grey
                            : Color.fromRGBO(187, 222, 251, 1),
                        offset: Offset(3, 5)),
                    text: "Bank 3",
                    color: (b3) ? kImageColor : Colors.blue,
                    shape: GFButtonShape.pills,
                  ),
                ],
              ),
            ),
            if (i == 0)
              SingleChildScrollView(
                  child: Column(
                children: [
                  SizedBox(height: 10),
                  Container(
                    height: 57,
                    padding: const EdgeInsets.fromLTRB(30, 0, 30, 0),
                    margin: EdgeInsets.only(bottom: 10),
                    child: DropdownButtonFormField<String>(
                      isExpanded: true,
                      onChanged: (newValue) {
                        setState(() {
                          dataset.clear();
                          bankvalue = newValue as String;
                          if (_branch.isNotEmpty) {
                            _branch.clear();
                          }
                          name_bank = newValue;
                          branch(newValue.toString());
                        });
                      },
                      validator: (String? value) {
                        if (value?.isEmpty ?? true) {
                          return 'Please select bank';
                        }
                        return null;
                      },
                      items: _list
                          .map<DropdownMenuItem<String>>(
                            (value) => DropdownMenuItem<String>(
                              value: value["bank_id"].toString(),
                              child: Text(
                                value["bank_name"],
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                    fontSize:
                                        MediaQuery.textScaleFactorOf(context) *
                                            13,
                                    height: 1),
                              ),
                            ),
                          )
                          .toList(),
                      // add extra sugar..
                      icon: Icon(
                        Icons.arrow_drop_down,
                        color: kImageColor,
                      ),

                      decoration: InputDecoration(
                        fillColor: kwhite,
                        contentPadding: EdgeInsets.symmetric(vertical: 8),
                        filled: true,
                        labelText: 'Bank',
                        hintText: 'Select',
                        labelStyle: TextStyle(color: kPrimaryColor),
                        prefixIcon: Icon(
                          Icons.home_work,
                          color: kImageColor,
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: const BorderSide(
                              color: kPrimaryColor, width: 2.0),
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            width: 1,
                            color: kPrimaryColor,
                          ),
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        errorBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            width: 1,
                            color: kerror,
                          ),
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        focusedErrorBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            width: 2,
                            color: kerror,
                          ),
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        //   decoration: InputDecoration(
                        //       labelText: 'From',
                        //       prefixIcon: Icon(Icons.business_outlined)),
                      ),
                    ),
                  ),
                  if (_branch.length >= 1)
                    GFMultiSelect(
                      items: _branch.map((e) => e['bank_branch_name']).toList(),
                      onSelect: (value) {
                        setState(() {
                          options.clear();
                          dataset.clear();
                        });
                        setState(() {
                          for (int i = 0; i < value.length; i++) {
                            int num = value.elementAt(i);
                            options
                                .add(_branch[num]['bank_branch_id'].toString());
                            print(
                                'Values ${_branch[num]['bank_branch_id']} \n');
                          }
                        });
                      },
                      dropdownTitleTileText: 'bank branch',
                      dropdownTitleTileColor: Colors.white,
                      dropdownTitleTileMargin:
                          EdgeInsets.only(left: 30, right: 30, bottom: 10),
                      // dropdownTitleTilePadding: EdgeInsets.all(10),
                      dropdownUnderlineBorder:
                          const BorderSide(color: Colors.white, width: 1),
                      dropdownTitleTileBorder:
                          Border.all(color: kPrimaryColor, width: 2),
                      dropdownTitleTileBorderRadius: BorderRadius.circular(10),
                      expandedIcon: const Icon(
                        Icons.arrow_drop_down,
                        color: kImageColor,
                      ),
                      collapsedIcon: const Icon(
                        Icons.keyboard_arrow_up,
                        color: Colors.blue,
                      ),
                      submitButton: Text('OK'),
                      dropdownTitleTileTextStyle:
                          const TextStyle(fontSize: 14, color: Colors.black),
                      padding: const EdgeInsets.all(2),
                      margin: const EdgeInsets.only(left: 20, right: 20),
                      type: GFCheckboxType.square,
                      activeBgColor: Colors.green,
                      inactiveBorderColor: Colors.black,
                    ),
                  Padding(
                    padding: const EdgeInsets.only(left: 20, right: 20),
                    child: ToFromDate(
                      fromDate: (value) {
                        setState(() {
                          start = value.toString();
                        });
                      },
                      toDate: (value) {
                        setState(() {
                          end = value.toString();
                        });
                      },
                    ),
                  ),
                  SizedBox(height: 20),
                  Padding(
                    padding: const EdgeInsets.only(left: 30, right: 30),
                    child: GFButton(
                      onPressed: () async {
                        setState(() {
                          dataset.clear();
                        });
                        if (options.length >= 1) {
                          await fetchData_get_by_bank_has_branch();
                        } else {
                          await fetchData_get_by_bank();
                        }
                      },
                      color: Color.fromRGBO(171, 71, 188, 1),
                      fullWidthButton: true,
                      text: "Search",
                      boxShadow: BoxShadow(
                          blurRadius: 5,
                          color: Colors.grey,
                          offset: Offset(4, 5)),
                      icon: Icon(Icons.search, color: Colors.white),
                    ),
                  ),
                  if (dataset.length >= 1)
                    Container(
                        height: MediaQuery.of(context).size.height * 0.4,
                        child: PieChart(PieChartData(
                            centerSpaceRadius: 20,
                            borderData: FlBorderData(show: false),
                            sectionsSpace: 10,
                            sections: [
                              for (int i = 0; i < dataset.length; i++)
                                dataset.elementAt(i),
                            ]))),
                ],
              )),
            if (i == 1)
              Column(
                children: [
                  SizedBox(height: 10),
                  Container(
                    height: 57,
                    padding: const EdgeInsets.fromLTRB(30, 0, 30, 0),
                    margin: EdgeInsets.only(bottom: 10),
                    child: DropdownButtonFormField<String>(
                      isExpanded: true,
                      onChanged: (newValue) {
                        setState(() {
                          dataset.clear();
                          bankvalue = newValue as String;
                          if (_branch.isNotEmpty) {
                            _branch.clear();
                          }
                          name_bank = newValue;
                          branch(newValue.toString());
                        });
                      },
                      validator: (String? value) {
                        if (value?.isEmpty ?? true) {
                          return 'Please select bank';
                        }
                        return null;
                      },
                      items: _list
                          .map<DropdownMenuItem<String>>(
                            (value) => DropdownMenuItem<String>(
                              value: value["bank_id"].toString(),
                              child: Text(
                                value["bank_name"],
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                    fontSize:
                                        MediaQuery.textScaleFactorOf(context) *
                                            13,
                                    height: 1),
                              ),
                            ),
                          )
                          .toList(),
                      // add extra sugar..
                      icon: Icon(
                        Icons.arrow_drop_down,
                        color: kImageColor,
                      ),

                      decoration: InputDecoration(
                        fillColor: kwhite,
                        contentPadding: EdgeInsets.symmetric(vertical: 8),
                        filled: true,
                        labelText: 'Bank',
                        hintText: 'Select',
                        labelStyle: TextStyle(color: kPrimaryColor),
                        prefixIcon: Icon(
                          Icons.home_work,
                          color: kImageColor,
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: const BorderSide(
                              color: kPrimaryColor, width: 2.0),
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            width: 1,
                            color: kPrimaryColor,
                          ),
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        errorBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            width: 1,
                            color: kerror,
                          ),
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        focusedErrorBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            width: 2,
                            color: kerror,
                          ),
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                      ),
                    ),
                  ),
                  if (_branch.length >= 1)
                    GFMultiSelect(
                      items: _branch.map((e) => e['bank_branch_name']).toList(),
                      onSelect: (value) {
                        setState(() {
                          options.clear();
                          dataset.clear();
                        });
                        setState(() {
                          for (int i = 0; i < value.length; i++) {
                            int num = value.elementAt(i);
                            options
                                .add(_branch[num]['bank_branch_id'].toString());
                            print(
                                'Values ${_branch[num]['bank_branch_id']} \n');
                          }
                        });
                      },
                      dropdownTitleTileText: 'bank branch',
                      dropdownTitleTileColor: Colors.white,
                      dropdownTitleTileMargin:
                          EdgeInsets.only(left: 30, right: 30, bottom: 10),
                      // dropdownTitleTilePadding: EdgeInsets.all(10),
                      dropdownUnderlineBorder:
                          const BorderSide(color: Colors.white, width: 1),
                      dropdownTitleTileBorder:
                          Border.all(color: kPrimaryColor, width: 2),
                      dropdownTitleTileBorderRadius: BorderRadius.circular(10),
                      expandedIcon: const Icon(
                        Icons.arrow_drop_down,
                        color: kImageColor,
                      ),
                      collapsedIcon: const Icon(
                        Icons.keyboard_arrow_up,
                        color: Colors.blue,
                      ),
                      submitButton: Text('OK'),
                      dropdownTitleTileTextStyle:
                          const TextStyle(fontSize: 14, color: Colors.black),
                      padding: const EdgeInsets.all(2),
                      margin: const EdgeInsets.only(left: 20, right: 20),
                      type: GFCheckboxType.square,
                      activeBgColor: Colors.green,
                      inactiveBorderColor: Colors.black,
                    ),
                  Padding(
                    padding: const EdgeInsets.only(left: 20, right: 20),
                    child: ToFromDate(
                      fromDate: (value) {
                        setState(() {
                          start = value.toString();
                        });
                      },
                      toDate: (value) {
                        setState(() {
                          end = value.toString();
                        });
                      },
                    ),
                  ),
                  SizedBox(height: 20),
                  Padding(
                    padding: const EdgeInsets.only(left: 30, right: 30),
                    child: GFButton(
                      onPressed: () async {
                        setState(() {
                          dataset.clear();
                        });
                        if (options.length >= 1) {
                          await fetchData_get_by_bank_has_branch();
                        } else {
                          await fetchData_get_by_bank();
                        }
                      },
                      color: Color.fromRGBO(171, 71, 188, 1),
                      fullWidthButton: true,
                      text: "Search",
                      boxShadow: BoxShadow(
                          blurRadius: 5,
                          color: Colors.grey,
                          offset: Offset(4, 5)),
                      icon: Icon(Icons.search, color: Colors.white),
                    ),
                  ),
                  if (dataset.length >= 1)
                    Container(
                        height: MediaQuery.of(context).size.height * 0.4,
                        child: PieChart(PieChartData(
                            centerSpaceRadius: 20,
                            borderData: FlBorderData(show: false),
                            sectionsSpace: 10,
                            sections: [
                              for (int i = 0; i < dataset.length; i++)
                                dataset.elementAt(i),
                            ]))),
                ],
              ),
            if (i == 2)
              Column(
                children: [
                  SizedBox(height: 10),
                  Container(
                    height: 57,
                    padding: const EdgeInsets.fromLTRB(30, 0, 30, 0),
                    margin: EdgeInsets.only(bottom: 10),
                    child: DropdownButtonFormField<String>(
                      isExpanded: true,
                      onChanged: (newValue) {
                        setState(() {
                          dataset.clear();
                          bankvalue = newValue as String;
                          if (_branch.isNotEmpty) {
                            _branch.clear();
                          }
                          name_bank = newValue;
                          branch(newValue.toString());
                        });
                      },
                      validator: (String? value) {
                        if (value?.isEmpty ?? true) {
                          return 'Please select bank';
                        }
                        return null;
                      },
                      items: _list
                          .map<DropdownMenuItem<String>>(
                            (value) => DropdownMenuItem<String>(
                              value: value["bank_id"].toString(),
                              child: Text(
                                value["bank_name"],
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                    fontSize:
                                        MediaQuery.textScaleFactorOf(context) *
                                            13,
                                    height: 1),
                              ),
                            ),
                          )
                          .toList(),
                      // add extra sugar..
                      icon: Icon(
                        Icons.arrow_drop_down,
                        color: kImageColor,
                      ),

                      decoration: InputDecoration(
                        fillColor: kwhite,
                        contentPadding: EdgeInsets.symmetric(vertical: 8),
                        filled: true,
                        labelText: 'Bank',
                        hintText: 'Select',
                        labelStyle: TextStyle(color: kPrimaryColor),
                        prefixIcon: Icon(
                          Icons.home_work,
                          color: kImageColor,
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: const BorderSide(
                              color: kPrimaryColor, width: 2.0),
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            width: 1,
                            color: kPrimaryColor,
                          ),
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        errorBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            width: 1,
                            color: kerror,
                          ),
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        focusedErrorBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            width: 2,
                            color: kerror,
                          ),
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        //   decoration: InputDecoration(
                        //       labelText: 'From',
                        //       prefixIcon: Icon(Icons.business_outlined)),
                      ),
                    ),
                  ),
                  if (_branch.length >= 1)
                    GFMultiSelect(
                      items: _branch.map((e) => e['bank_branch_name']).toList(),
                      onSelect: (value) {
                        setState(() {
                          options.clear();
                          dataset.clear();
                        });
                        setState(() {
                          for (int i = 0; i < value.length; i++) {
                            int num = value.elementAt(i);
                            options
                                .add(_branch[num]['bank_branch_id'].toString());
                            print(
                                'Values ${_branch[num]['bank_branch_id']} \n');
                          }
                        });
                      },
                      dropdownTitleTileText: 'bank branch',
                      dropdownTitleTileColor: Colors.white,
                      dropdownTitleTileMargin:
                          EdgeInsets.only(left: 30, right: 30, bottom: 10),
                      // dropdownTitleTilePadding: EdgeInsets.all(10),
                      dropdownUnderlineBorder:
                          const BorderSide(color: Colors.white, width: 1),
                      dropdownTitleTileBorder:
                          Border.all(color: kPrimaryColor, width: 2),
                      dropdownTitleTileBorderRadius: BorderRadius.circular(10),
                      expandedIcon: const Icon(
                        Icons.arrow_drop_down,
                        color: kImageColor,
                      ),
                      collapsedIcon: const Icon(
                        Icons.keyboard_arrow_up,
                        color: Colors.blue,
                      ),
                      submitButton: Text('OK'),
                      dropdownTitleTileTextStyle:
                          const TextStyle(fontSize: 14, color: Colors.black),
                      padding: const EdgeInsets.all(2),
                      margin: const EdgeInsets.only(left: 20, right: 20),
                      type: GFCheckboxType.square,
                      activeBgColor: Colors.green,
                      inactiveBorderColor: Colors.black,
                    ),
                  Padding(
                    padding: const EdgeInsets.only(left: 20, right: 20),
                    child: ToFromDate(
                      fromDate: (value) {
                        setState(() {
                          start = value.toString();
                        });
                      },
                      toDate: (value) {
                        setState(() {
                          end = value.toString();
                        });
                      },
                    ),
                  ),
                  SizedBox(height: 20),
                  Padding(
                    padding: const EdgeInsets.only(left: 30, right: 30),
                    child: GFButton(
                      onPressed: () async {
                        setState(() {
                          dataset.clear();
                        });
                        if (options.length >= 1) {
                          await fetchData_get_by_bank_has_branch();
                        } else {
                          await fetchData_get_by_bank();
                        }
                      },
                      color: Color.fromRGBO(171, 71, 188, 1),
                      fullWidthButton: true,
                      text: "Search",
                      boxShadow: BoxShadow(
                          blurRadius: 5,
                          color: Colors.grey,
                          offset: Offset(4, 5)),
                      icon: Icon(Icons.search, color: Colors.white),
                    ),
                  ),
                  if (dataset.length >= 1)
                    Container(
                        height: MediaQuery.of(context).size.height * 0.4,
                        child: PieChart(PieChartData(
                            centerSpaceRadius: 20,
                            borderData: FlBorderData(show: false),
                            sectionsSpace: 10,
                            sections: [
                              for (int i = 0; i < dataset.length; i++)
                                dataset.elementAt(i),
                            ]))),
                ],
              ),
          ],
        ),
      ),
    );
  }
}
