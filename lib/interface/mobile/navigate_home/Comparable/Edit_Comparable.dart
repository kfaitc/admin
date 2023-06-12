// ignore_for_file: must_be_immutable, body_might_complete_normally_nullable, unused_field, unused_element, unnecessary_null_comparison, unused_local_variable

import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:kfa_admin/components/l_w_total_edit.dart';
import '../../../../Profile/contants.dart';
import 'package:http/http.dart' as http;

import '../../../../components/bank_edit_dropdown.dart';
import '../../../../components/province.dart';
import '../../../../components/total_dropdown_edit.dart';
import '../Property/mapproperty/map_in_add_verbal.dart';

class Detail_Screen extends StatefulWidget {
  Detail_Screen({super.key, required this.list, required this.index});
  String? index;
  List? list;

  @override
  State<Detail_Screen> createState() => _Detail_ScreenState();
}

class _Detail_ScreenState extends State<Detail_Screen> {
  List option = const [];
  List _condition = [
    {
      'id': 1,
      'Condition': 'Condition 1',
    },
    {
      'id': 2,
      'Condition': 'Condition 2',
    }
    // comparable_condition_id
  ];
  String? condition;
  int index_p = 0;
  @override
  void initState() {
    _hometype();
    Raod();

    index_p = int.parse(widget.index.toString());
    super.initState();

    _bankofficercontxt = TextEditingController(
        text: '${widget.list![index_p]['com_bankofficer']}');
    bank_officer = _bankofficercontxt!.text;
    _log =
        TextEditingController(text: '${widget.list![index_p]['latlong_log']}');
    log = _log!.text;
    _lat =
        TextEditingController(text: '${widget.list![index_p]['latlong_la']}');
    lat = _lat!.text;

    ///
    property_type = widget.list![index_p]['comparable_property_id'].toString();
    l = widget.list![index_p]['comparable_land_length'].toString();
    w = widget.list![index_p]['comparable_land_width'].toString();
    total = widget.list![index_p]['comparable_land_total'].toString();
    lb = widget.list![index_p]['comparable_sold_length'].toString();
    wb = widget.list![index_p]['comparable_sold_width'].toString();
    askingprice = widget.list![index_p]['comparable_adding_total'].toString();
    sqm_total = widget.list![index_p]['comparable_sold_price'].toString();
    total_b = widget.list![index_p]['comparable_sold_total'].toString();
    officer_price_total =
        widget.list![index_p]['comparable_sold_total_price'].toString();
    condition = widget.list![index_p]['comparable_condition_id'].toString();
    _year = TextEditingController(
        text: '${widget.list![index_p]['comparable_year']}');
    year = _year!.text;
    address = widget.list![index_p]['comparable_address'].toString();
    provnce_id = widget.list![index_p]['comparable_province_id'].toString();
    district_id = widget.list![index_p]['comparable_district_id'].toString();
    cummune_id = widget.list![index_p]['comparable_commune_id'].toString();
    _Remak = TextEditingController(
        text: '${widget.list![index_p]['comparable_remark']}');
    remark = _Remak!.text;

    _bank_contact_contxt = TextEditingController(
        text: '${widget.list![index_p]['com_bankofficer_contact']}');
    bank_contact = _bank_contact_contxt!.text;
    bankname = widget.list![index_p]['compare_bank_id'].toString();
    sold_price = widget.list![index_p]['comparableaddprice'].toString();
    total_price = widget.list![index_p]['comparableaddpricetotal'].toString();
    _Amount = TextEditingController(
        text: '${widget.list![index_p]['comparableAmount']}');
    Amount = _Amount!.text;
    _con_user = TextEditingController(
        text: '${widget.list![index_p]['comparable_con']}');
    con_user = _con_user!.text;
    bank_brand = widget.list![index_p]['compare_bank_branch_id'].toString();
    id_road = widget.list![index_p]['comparable_road'].toString();
  }

  String? brand_bank;
  String? total_price;
  String? sold_price;
  String? lb;
  String? wb;
  String? total_b;
  String? district_id;
  String? cummune_id;
  String? provnce_id;
  String? log;
  String? lat;
  String? provice_map;
  TextEditingController? _log;
  TextEditingController? _lat;
  String? khan;
  String? songkat;
  TextEditingController? _Amount;
  String? Amount;
  String? con_user;
  TextEditingController? _Remak;
  TextEditingController? _con_user;
  String? year;
  String? remark;
  TextEditingController? _year;
  String? property_type;
  TextEditingController? _bankofficercontxt;
  TextEditingController? _bank_contact_contxt;
  List<Icon> optionIconList = const [
    Icon(
      Icons.account_balance_outlined,
      color: kImageColor,
    ),
  ];
  String? bank_brand;
  String? bankname;
  String? bank_officer = '';
  String? bank_contact;
  @override
  Widget build(BuildContext context) {
    double sizefont = MediaQuery.of(context).size.height * 0.015;
    double textstye = MediaQuery.of(context).size.height * 0.09;
    return Scaffold(
      appBar: AppBar(
        title: Text(''),
        actions: [
          InkWell(
            onTap: () {
              update_new();
              // AwesomeDialog(
              //     context: context,
              //     animType: AnimType.leftSlide,
              //     headerAnimationLoop: false,
              //     dialogType: DialogType.success,
              //     showCloseIcon: false,
              //     title: 'Save Successfully',
              //     autoHide: Duration(seconds: 3),
              //     onDismissCallback: (type) {
              //       setState(() {
              //         update_new();
              //       });
              //       Navigator.pop(context);
              //     }).show();
            },
            child: Container(
              alignment: Alignment.center,
              height: MediaQuery.of(context).size.height * 0.05,
              width: MediaQuery.of(context).size.width * 0.2,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Color.fromARGB(255, 32, 167, 8)),
              child: Text(
                'Edit',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
          ),
          SizedBox(
            width: 10,
          )
        ],
        centerTitle: true,
        backgroundColor: Colors.deepPurple[900],
      ),
      body: SingleChildScrollView(
          child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Form(
          //     child: Column(
          //   children: [
          //     Text(bank_officer.toString()),
          //     Text(log.toString()),
          //     Text('lat = ${lat.toString()}'),
          //     Text('property_type = ${property_type.toString()}'),
          //     Text('l = ${l.toString()}'),
          //     Text('w = ${w.toString()}'),
          //     Text('total = ${total.toString()}'),
          //     Text('lb = ${lb.toString()}'),
          //     Text('wb = ${wb.toString()}'),
          //   ],
          // )),
          SizedBox(
            height: 20,
          ),
          BankDropdown_Edit(
            brand_id:
                widget.list![index_p]['compare_bank_branch_id'].toString(),
            bank_id: widget.list![index_p]['compare_bank_id'].toString(),
            dbank: widget.list![index_p]['bank_name'].toString(),
            bank: (value) {
              setState(() {
                bankname = value;
              });
            },
            branch: widget.list![index_p]['bank_branch_name'].toString(),
            bankbranch: (value) {
              setState(() {
                bank_brand = value;
              });
            },
          ),
          /////////////
          Padding(
            padding: const EdgeInsets.only(left: 30, right: 30, bottom: 10),
            child: Container(
              child: TextFormField(
                controller: _bankofficercontxt,
                style: TextStyle(
                    fontSize: MediaQuery.of(context).size.height * 0.015,
                    fontWeight: FontWeight.bold),
                onChanged: (value) {
                  setState(() {
                    bank_officer = value;
                  });
                },
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.symmetric(vertical: 8),
                  prefixIcon: Icon(
                    Icons.branding_watermark_outlined,
                    color: kImageColor,
                  ),
                  hintText: "Bank Officer",
                  fillColor: kwhite,
                  filled: true,
                  focusedBorder: OutlineInputBorder(
                    borderSide:
                        const BorderSide(color: kPrimaryColor, width: 2.0),
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      width: 1,
                      color: kPrimaryColor,
                    ),
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),
              ),
            ),
          ),
          /////////////
          Padding(
            padding:
                const EdgeInsets.only(left: 30, right: 30, bottom: 10, top: 10),
            child: Container(
              child: TextFormField(
                controller: _bank_contact_contxt,
                keyboardType: TextInputType.number,
                style: TextStyle(
                    fontSize: MediaQuery.of(context).size.height * 0.015,
                    fontWeight: FontWeight.bold),
                onChanged: (value) {
                  setState(() {
                    bank_contact = value;
                  });
                },
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.symmetric(vertical: 8),
                  prefixIcon: Icon(
                    Icons.branding_watermark_outlined,
                    color: kImageColor,
                  ),
                  hintText: "bank Contact",
                  fillColor: kwhite,
                  filled: true,
                  focusedBorder: OutlineInputBorder(
                    borderSide:
                        const BorderSide(color: kPrimaryColor, width: 2.0),
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      width: 1,
                      color: kPrimaryColor,
                    ),
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),
              ),
            ),
          ),
          /////////////
          Container(
            height: 58,
            padding: const EdgeInsets.fromLTRB(30, 0, 30, 0),
            child: DropdownButtonFormField<String>(
              isExpanded: true,
              onChanged: (newValue) {
                setState(() {
                  property_type = newValue;
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
                      value: value["property_type_id"].toString(),
                      child: Text(
                        value["property_type_name"],
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                            fontSize:
                                MediaQuery.textScaleFactorOf(context) * 13,
                            height: 1),
                      ),
                    ),
                  )
                  .toList(),
              icon: Icon(
                Icons.arrow_drop_down,
                color: kImageColor,
              ),
              decoration: InputDecoration(
                fillColor: kwhite,
                filled: true,
                contentPadding: EdgeInsets.symmetric(vertical: 8),
                labelText:
                    widget.list![index_p]['property_type_name'].toString(),
                hintText: 'Select',
                prefixIcon: Icon(
                  Icons.real_estate_agent_outlined,
                  color: kImageColor,
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide:
                      const BorderSide(color: kPrimaryColor, width: 2.0),
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
          /////////////
          Container(
            height: 58,
            padding: const EdgeInsets.fromLTRB(30, 0, 30, 0),
            child: DropdownButtonFormField<String>(
              //value: genderValue,
              isExpanded: true,
              onChanged: (newValue) {
                setState(() {
                  id_road = newValue;
                });
              },
              items: _list_raod
                  .map<DropdownMenuItem<String>>(
                    (value) => DropdownMenuItem<String>(
                      value: value["road_id"].toString(),
                      child: Text(value["road_name"]),
                      onTap: () {
                        setState(() {});
                      },
                    ),
                  )
                  .toList(),
              // add extra sugar..
              icon: Icon(
                Icons.arrow_drop_down,
                color: kImageColor,
              ),
              decoration: InputDecoration(
                contentPadding: EdgeInsets.symmetric(vertical: 8),
                fillColor: kwhite,
                filled: true,
                labelText: widget.list![index_p]['road_name'].toString(),
                hintText: 'Select one',
                prefixIcon: Icon(
                  Icons.edit_road_outlined,
                  color: kImageColor,
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide:
                      const BorderSide(color: kPrimaryColor, width: 2.0),
                  borderRadius: BorderRadius.circular(10.0),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    width: 1,
                    color: kPrimaryColor,
                  ),
                  borderRadius: BorderRadius.circular(10.0),
                ),
              ),
            ),
          ),
          /////////////
          // Land_building_edit(
          //   l: (value) {
          //     setState(() {
          //       l = value;
          //     });
          //   },
          //   l_edit: widget.list![index_p]['comparable_land_length'].toString(),
          //   total: (value) {
          //     setState(() {
          //       total = value;
          //     });
          //   },
          //   total_edit:
          //       widget.list![index_p]['comparable_land_total'].toString(),
          //   w: (value) {
          //     setState(() {
          //       w = value;
          //     });
          //   },
          //   w_edit: widget.list![index_p]['comparable_land_width'].toString(),
          // ),
          /////////////
          Padding(
            padding: const EdgeInsets.only(left: 30, bottom: 10, top: 10),
            child: Text(
              'Price Per SQM',
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: MediaQuery.of(context).size.height * 0.022),
            ),
          ),
          /////////////
          // Total_dropdown_edit(
          //   total_id:
          //       widget.list![index_p]['comparable_adding_total'].toString(),
          //   sqm_price:
          //       widget.list![index_p]['comparable_adding_price'].toString(),
          //   input: (value) {
          //     setState(() {
          //       askingprice = value;
          //     });
          //   },
          //   total_type: (value) {
          //     setState(() {
          //       sqm_total = value;
          //     });
          //   },
          // ),
          /////////////
          Padding(
            padding:
                const EdgeInsets.only(left: 30, right: 30, bottom: 10, top: 10),
            child: Container(
              child: TextFormField(
                controller: _Amount,
                keyboardType: TextInputType.number,
                style: TextStyle(
                    fontSize: MediaQuery.of(context).size.height * 0.015,
                    fontWeight: FontWeight.bold),
                onChanged: (value) {
                  setState(() {
                    Amount = value;
                  });
                },
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.symmetric(vertical: 8),
                  prefixIcon: Icon(
                    Icons.question_answer_outlined,
                    color: kImageColor,
                  ),
                  hintText: 'Asking Price(TTAmount)',
                  fillColor: kwhite,
                  filled: true,
                  focusedBorder: OutlineInputBorder(
                    borderSide:
                        const BorderSide(color: kPrimaryColor, width: 2.0),
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      width: 1,
                      color: kPrimaryColor,
                    ),
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),
              ),
            ),
          ),
          /////////////
          InkWell(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(
                  builder: (context) {
                    return Map_verbal_address_Sale(
                      get_province: (value) {
                        setState(() {
                          songkat = value.toString();
                          print(songkat);
                        });
                      },
                      get_district: (value) {
                        setState(() {
                          provice_map = value.toString();
                        });
                      },
                      get_commune: (value) {
                        setState(() {
                          khan = value.toString();
                        });
                      },
                      get_log: (value) {
                        setState(() {
                          log = value.toString();
                          _log = TextEditingController(text: '${log}');
                          log = _log!.text;
                        });
                      },
                      get_lat: (value) {
                        setState(() {
                          lat = value.toString();
                          _lat = TextEditingController(text: '${lat}');
                          lat = _lat!.text;
                        });
                      },
                    );
                  },
                ));
              },
              child: (khan != null || songkat != null)
                  ? Container(
                      height: textstye,
                      margin: EdgeInsets.only(right: 30, left: 30, bottom: 10),
                      padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                      width: double.infinity,
                      decoration: BoxDecoration(
                          border: Border.all(width: 1),
                          borderRadius: BorderRadius.circular(10),
                          color: Color.fromARGB(255, 255, 255, 255)),
                      child: Row(
                        children: [
                          Icon(
                            Icons.location_city_outlined,
                            size: 30,
                            color: kImageColor,
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Text(
                            '${khan}',
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 12),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Text(
                            '/ ${provice_map}',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: sizefont),
                          ),
                        ],
                      ),
                    )
                  : Container(
                      height: textstye,
                      margin: EdgeInsets.only(right: 30, left: 30),
                      padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                      width: double.infinity,
                      decoration: BoxDecoration(
                          border: Border.all(width: 1),
                          borderRadius: BorderRadius.circular(10),
                          color: Color.fromARGB(255, 255, 255, 255)),
                      child: Row(
                        children: [
                          Icon(
                            Icons.location_city_outlined,
                            size: 30,
                            color: kImageColor,
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Text(
                            '${widget.list![index_p]['comparable_address'].toString()}',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: sizefont),
                          ),
                        ],
                      ),
                    )),
          ///////////
          Padding(
            padding: const EdgeInsets.only(top: 10, right: 30, left: 30),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  width: MediaQuery.of(context).size.width * 0.4,
                  child: TextFormField(
                    controller: _log,
                    keyboardType: TextInputType.number,
                    style: TextStyle(
                        fontSize: MediaQuery.of(context).size.height * 0.015,
                        fontWeight: FontWeight.bold),
                    onChanged: (value) {
                      setState(() {
                        log = value;
                      });
                    },
                    decoration: InputDecoration(
                      prefixIcon: Icon(
                        Icons.numbers_outlined,
                        color: kImageColor,
                      ),
                      hintText: "log",
                      contentPadding: EdgeInsets.symmetric(vertical: 8),

                      fillColor: kwhite,
                      // hintText: (bankcontact == null || bankcontact == '')
                      //     ? '${widget.list![index_edit]['bankcontact'].toString()}'
                      //     : bankcontact,
                      filled: true,
                      focusedBorder: OutlineInputBorder(
                        borderSide:
                            const BorderSide(color: kPrimaryColor, width: 2.0),
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          width: 1,
                          color: kPrimaryColor,
                        ),
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                    ),
                  ),
                ),
                Container(
                  width: MediaQuery.of(context).size.width * 0.4,
                  child: TextFormField(
                    controller: _lat,
                    keyboardType: TextInputType.number,
                    style: TextStyle(
                        fontSize: MediaQuery.of(context).size.height * 0.015,
                        fontWeight: FontWeight.bold),
                    onChanged: (value) {
                      setState(() {
                        lat = value;
                      });
                    },
                    decoration: InputDecoration(
                      hintText: "lat",
                      contentPadding: EdgeInsets.symmetric(vertical: 8),
                      prefixIcon: Icon(
                        Icons.numbers_outlined,
                        color: kImageColor,
                      ),
                      fillColor: kwhite,
                      // hintText: (bankcontact == null || bankcontact == '')
                      //     ? '${widget.list![index_edit]['bankcontact'].toString()}'
                      //     : bankcontact,
                      filled: true,
                      focusedBorder: OutlineInputBorder(
                        borderSide:
                            const BorderSide(color: kPrimaryColor, width: 2.0),
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          width: 1,
                          color: kPrimaryColor,
                        ),
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          /////////////
          SizedBox(
            height: 10,
          ),
          Province_dropdown(
            cummone_id0: widget.list![index_p]['commune_name'].toString(),
            district_id0: widget.list![index_p]['district_name'].toString(),
            province_id0: widget.list![index_p]['provinces_name'].toString(),
            provicne_id: (value) {
              setState(() {
                provnce_id = value;
              });
            },
            cummone_id: (value) {
              setState(() {
                cummune_id = value.toString();
              });
            },
            district_id: (value) {
              setState(() {
                district_id = value.toString();
                district_id;
              });
            },
          ),
          /////////////
          SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 30, top: 10, bottom: 10),
            child: Text(
              'Building',
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: MediaQuery.of(context).size.height * 0.022),
            ),
          ),
          /////////////
          Land_building_edit(
            l: (value) {
              setState(() {
                lb = value;
              });
            },
            l_edit: widget.list![index_p]['comparable_sold_length'].toString(),
            total: (value) {
              setState(() {
                total_b = value;
              });
            },
            total_edit:
                widget.list![index_p]['comparable_sold_total'].toString(),
            w: (value) {
              setState(() {
                wb = value;
              });
            },
            w_edit: widget.list![index_p]['comparable_sold_width'].toString(),
          ),
          /////////////
          Padding(
            padding: const EdgeInsets.only(left: 30, bottom: 10, top: 10),
            child: Text(
              'Offered Price',
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: MediaQuery.of(context).size.height * 0.022),
            ),
          ),
          /////////////
          Total_dropdown_edit(
            sqm_price: widget.list![index_p]['comparableaddprice'].toString(),
            total_id:
                widget.list![index_p]['comparableaddpricetotal'].toString(),
            input: (value) {
              setState(() {
                sold_price = value;
              });
            },
            total_type: (value) {
              setState(() {
                total_price = value;
              });
            },
          ),
          /////////////
          Padding(
            padding: const EdgeInsets.only(top: 10, right: 30, left: 25),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  width: MediaQuery.of(context).size.height * 0.2,
                  padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                  child: DropdownButtonFormField<String>(
                    isExpanded: true,
                    onChanged: (newValue) {
                      setState(() {
                        print(newValue.toString());
                        condition = newValue;
                      });
                    },
                    validator: (String? value) {
                      if (value?.isEmpty ?? true) {
                        return 'Please select';
                      }
                      return null;
                    },
                    items: _condition
                        .map<DropdownMenuItem<String>>(
                          (value) => DropdownMenuItem<String>(
                            value: value['id'].toString(),
                            child: Text(
                              value['Condition'].toString(),
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
                      filled: true,
                      contentPadding: EdgeInsets.symmetric(vertical: 8),
                      prefixIcon: Icon(
                        Icons.landscape_outlined,
                        color: kImageColor,
                      ),
                      labelText: 'Condition',
                      hintText: 'select',

                      focusedBorder: OutlineInputBorder(
                        borderSide:
                            const BorderSide(color: kPrimaryColor, width: 2.0),
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
                Container(
                  width: MediaQuery.of(context).size.height * 0.2,
                  child: TextFormField(
                    controller: _year,
                    keyboardType: TextInputType.number,
                    style: TextStyle(
                        fontSize: MediaQuery.of(context).size.height * 0.015,
                        fontWeight: FontWeight.bold),
                    onChanged: (value) {
                      setState(() {
                        year = value;
                      });
                    },
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.symmetric(vertical: 8),
                      prefixIcon: Icon(
                        Icons.calendar_month,
                        color: kImageColor,
                      ),
                      hintText: 'Year',
                      fillColor: kwhite,
                      filled: true,
                      focusedBorder: OutlineInputBorder(
                        borderSide:
                            const BorderSide(color: kPrimaryColor, width: 2.0),
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          width: 1,
                          color: kPrimaryColor,
                        ),
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          /////////////
          Padding(
            padding:
                const EdgeInsets.only(right: 30, left: 30, top: 10, bottom: 10),
            child: Container(
              width: MediaQuery.of(context).size.height * 0.75,
              child: TextFormField(
                controller: _Remak,
                style: TextStyle(
                    fontSize: MediaQuery.of(context).size.height * 0.015,
                    fontWeight: FontWeight.bold),
                onChanged: (value) {
                  setState(() {
                    remark = value;
                  });
                },
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.symmetric(vertical: 8),
                  prefixIcon: Icon(
                    Icons.label,
                    color: kImageColor,
                  ),
                  hintText: 'Remak',
                  fillColor: kwhite,
                  filled: true,
                  focusedBorder: OutlineInputBorder(
                    borderSide:
                        const BorderSide(color: kPrimaryColor, width: 2.0),
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      width: 1,
                      color: kPrimaryColor,
                    ),
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),
              ),
            ),
          ),
          /////////////
          Padding(
            padding:
                const EdgeInsets.only(right: 30, left: 30, top: 10, bottom: 10),
            child: Container(
              width: MediaQuery.of(context).size.height * 0.75,
              child: TextFormField(
                controller: _con_user,
                keyboardType: TextInputType.number,
                style: TextStyle(
                    fontSize: MediaQuery.of(context).size.height * 0.015,
                    fontWeight: FontWeight.bold),
                onChanged: (value) {
                  setState(() {
                    con_user = value;
                  });
                },
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.symmetric(vertical: 8),
                  prefixIcon: Icon(
                    Icons.phone,
                    color: kImageColor,
                  ),
                  hintText: 'Owner Phone *',
                  fillColor: kwhite,
                  filled: true,
                  focusedBorder: OutlineInputBorder(
                    borderSide:
                        const BorderSide(color: kPrimaryColor, width: 2.0),
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      width: 1,
                      color: kPrimaryColor,
                    ),
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),
              ),
            ),
          ),
        ],
      )),
    );
  }

  String? sqm_total;
  String? askingprice;
  var _list_raod = [];
  void Raod() async {
    setState(() {});
    var rs = await http.get(Uri.parse(
        'https://www.oneclickonedollar.com/laravel_kfa_2023/public/api/road'));
    if (rs.statusCode == 200) {
      var jsonData = jsonDecode(rs.body);
      setState(() {
        _list_raod = jsonData['roads'];
      });
    }
  }

  var _list = [];
  void _hometype() async {
    setState(() {});
    var rs = await http.get(Uri.parse(
        'https://www.oneclickonedollar.com/laravel_kfa_2023/public/api/properties_dropdown'));
    if (rs.statusCode == 200) {
      var jsonData = jsonDecode(rs.body);
      // print(jsonData);
      // print(jsonData);

      setState(() {
        _list = jsonData;
      });
    }
  }

  String? id_road0;
  String? con_post;
  String? address;
  String? l;
  String? w;
  String? total;
  String? officer_price;
  String? officer_price_total;
  void update_new() async {
    setState(() {
      address = '$khan / $songkat / $provice_map';
    });
    try {
      Map<String, dynamic> payload = {
        'comparable_id':
            int.parse(widget.list![index_p]['comparable_id'].toString()),
        'latlong_log': double.parse(log.toString()),
        'latlong_la': double.parse(lat.toString()),
        'comparable_property_id': int.parse(property_type.toString()),
        'comparable_land_length': l.toString(),
        'comparable_land_width': w.toString(),
        'comparable_land_total': total.toString(),
        'comparable_sold_length': lb.toString(),
        'comparable_sold_width': wb.toString(),
        'comparable_sold_total': total_b.toString(),
        'comparable_adding_price': askingprice.toString(),
        'comparable_adding_total': sqm_total.toString(),

        ///
        // 'comparable_sold_price': officer_price.toString(),
        'comparable_sold_total_price': officer_price_total.toString(),
        'comparable_condition_id': condition.toString(),
        'comparable_year': year.toString(),
        'comparable_address': address.toString(),
        'comparable_province_id': provnce_id.toString(),
        'comparable_district_id': district_id.toString(),
        'comparable_commune_id': cummune_id.toString(),
        'comparable_remark': remark.toString(),
        'comparable_phone': '0',
        'comparable_distance': 0,
        'com_bankofficer_contact': bank_contact.toString(),
        'com_bankofficer': bank_officer.toString(),
        'compare_bank_id': int.parse(bankname.toString()),
        'comparable_status_id': 0,
        'comparableaddprice': sold_price.toString(),
        'comparableaddpricetotal': total_price.toString(),
        'comparableboughtprice': '0',
        'comparableAmount': Amount.toString(),
        'comparabl_user': 0,
        // 'comparable_con': 0,
        'comparable_con': int.parse(con_user.toString()),
        'comparableboughtpricetotal': '0',
        'compare_bank_branch_id': bank_brand.toString(),
        // 'comparable_road': 0,
        'comparable_road': int.parse(id_road.toString()),
      };

      final url = Uri.parse(
          'https://www.oneclickonedollar.com/laravel_kfa_2023/public/api/update_Comparable/${widget.list![index_p]['comparable_id']}');
      final response = await http.post(
        url,
        headers: {'Content-Type': 'application/json'},
        body: json.encode(payload),
      );

      if (response.statusCode == 200) {
        print('Success Comparable');
      } else {
        print('Error 1: ${response.reasonPhrase}');
      }
    } catch (error) {
      print('Error: $error');
    }
  }

  String? id_road;
}
//  Map<String, dynamic> payload = {
//         'comparable_id':
//             int.parse(widget.list![index_p]['comparable_id'].toString()),
//         'latlong_log': double.parse(log.toString()),
//         'latlong_la': double.parse(lat.toString()),
//         'comparable_property_id': int.parse(property_type.toString()),
//         'comparable_land_length': l.toString(),
//         'comparable_land_width': w.toString(),
//         'comparable_land_total': total.toString(),
//         'comparable_sold_length': (lb == null) ? 'Null' : lb.toString(),
//         'comparable_sold_width': wb.toString(),

//         'comparable_sold_total': total_b.toString(),
//         'comparable_adding_price':
//             (askingprice == null) ? askingprice : askingprice.toString(),
//         'comparable_adding_total':
//             (sqm_total == null) ? 'Null' : sqm_total.toString(),
//         'comparable_sold_price':
//             (officer_price == null) ? 'Null' : officer_price.toString(),

//         'comparable_sold_total_price': (officer_price_total == null)
//             ? 'Null'
//             : officer_price_total.toString(),
//         'comparable_condition_id':
//             (condition == null) ? 'Null' : condition.toString(),

//         'comparable_year': (year == null) ? 'Null' : year.toString(),
//         'comparable_address': address.toString(),
//         'comparable_province_id': provnce_id.toString(),
//         'comparable_district_id': district_id.toString(),
//         'comparable_commune_id': cummune_id.toString(),
//         'comparable_remark': (remark == null) ? 'Null' : remark.toString(),
//         'comparable_phone': '0',
//         'comparable_distance': 0,
//         'com_bankofficer_contact':
//             (bank_contact == null) ? 'Null' : bank_contact.toString(),
//         'com_bankofficer':
//             (bank_officer == null) ? 'Null' : bank_officer.toString(),
//         'compare_bank_id': int.parse(bankname.toString()),
// //////////////////////// Text Button

//         'comparable_status_id': 0,
//         'comparableaddprice':
//             (sold_price == null) ? 'Null' : sold_price.toString(),
//         'comparableaddpricetotal':
//             (total_price == null) ? 'Null' : total_price.toString(),
//         'comparableboughtprice': '0',
//         'comparableAmount': Amount.toString(),

//         'comparabl_user': 0,
//         // 'comparable_con': 0,
//         'comparable_con':
//             (con_post == null) ? null : int.parse(con_post.toString()),
//         'comparableboughtpricetotal': '0',
//         'compare_bank_branch_id': (bank_brand == null.toString())
//             ? null
//             : int.parse(bank_brand.toString()),
//         // 'comparable_road': 0,
//         'comparable_road':
//             (id_road0 == null) ? null : int.parse(id_road0.toString()),
//       };