// ignore_for_file: unused_import, must_call_super, unused_local_variable

import 'package:getwidget/components/button/gf_button.dart';
import 'package:getwidget/types/gf_button_type.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../../../Customs/Contants.dart';
import '../../../../model/executive/executive.dart';

typedef OnChangeCallback = void Function(dynamic value);

class LandBuilding_valuaction extends StatefulWidget {
  LandBuilding_valuaction(
      {super.key,
      required this.listback,
      required this.list,
      this.id,
      this.edit_Executive});
  final OnChangeCallback listback;
  final List list;
  String? edit_Executive;
  String? id;
  @override
  State<LandBuilding_valuaction> createState() => _LandBuildingState();
}

class _LandBuildingState extends State<LandBuilding_valuaction> {
  final _formKey = GlobalKey<FormState>();

  List list = [];
  var formatter = NumberFormat("##,###,###,##0.00", "en_US");

  List<String> option = [
    'Residencial',
    'Commercial',
    'Agricultural',
  ];
  String? building_executive_id;
  String? building_size;
  String? building_price;
  String? building_price_per;
  String? building_des;
  List<building_execuactive> lb = [
    building_execuactive(0, '', '', '', '', 1, '')
  ];
  void addItemToList() {
    setState(() {
      if (widget.list == []) {
        list.add({
          "building_executive_id": int.parse(widget.id.toString()),
          "building_size": '$building_size',
          "building_price": '$building_price',
          "building_price_per": '$building_price_per',
          "building_des": '$building_des',
          "building_published": 1,
          "remember_token": ""
        });
        lb.add(
          building_execuactive(0, building_size, building_price,
              building_price_per, building_des, 1, ''),
        );
      } else {
        widget.list.add({
          "building_executive_id": int.parse(widget.id.toString()),
          "building_size": '$building_size',
          "building_price": '$building_price',
          "building_price_per": '$building_price_per',
          "building_des": '$building_des',
          "building_published": 1,
          "remember_token": ""
        });
        lb.add(
          building_execuactive(0, building_size, building_price,
              building_price_per, building_des, 1, ''),
        );
      }
    });
    //  print(id);
  }

  // ignore: non_constant_identifier_names
  double? Minimum, Maximun;

  void deleteItemToList(int Id) {
    setState(() {
      list.removeAt(Id);
      // lb.removeAt(Id);
    });
  }

  int i = 1;
  @override
  void initState() {
    widget.list != list;
  }

  String? ds;
  String? _purpose;
  String? build_size;
  String? build_price;
  String? price_per;
  @override
  Widget build(BuildContext context) {
    var sizebox_ = SizedBox(
      height: 10,
    );
    var sizef = TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: MediaQuery.of(context).size.height * 0.018);
    var Size_h = EdgeInsets.only(right: 30, left: 30, top: 10);
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: Size_h,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Buliding *',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: MediaQuery.of(context).size.height * 0.03,
                  ),
                ),
                Row(
                  children: [
                    IconButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        icon: Icon(
                          Icons.remove_circle_outline_sharp,
                          color: Colors.red,
                          size: MediaQuery.of(context).size.height * 0.05,
                        )),
                  ],
                ),
              ],
            ),
          ),
          Padding(
            padding: Size_h,
            child: Row(
              children: [
                _TextFiled_Input('no_number', 'Description', ds),
              ],
            ),
          ),
          Padding(
            padding: Size_h,
            child: Row(
              children: [
                _TextFiled_Input('number', 'Building Size', build_size),
              ],
            ),
          ),
          Padding(
            padding: Size_h,
            child: Row(
              children: [
                _TextFiled_Input('number', 'Building Price', build_price),
              ],
            ),
          ),
          Padding(
            padding: Size_h,
            child: Row(
              children: [
                _TextFiled_Input('number', 'Price Per sqm', price_per),
              ],
            ),
          ),
          Padding(
              padding: Size_h,
              child: Container(
                alignment: Alignment.center,
                height: MediaQuery.of(context).size.height * 0.08,
                width: double.infinity,
                decoration: BoxDecoration(
                    color: Color.fromARGB(255, 52, 167, 56),
                    borderRadius: BorderRadius.circular(10)),
                child: Center(
                  child: GFButton(
                    elevation: 10,
                    onPressed: () {
                      setState(() {
                        addItemToList();
                        if (widget.list == []) {
                        } else {
                          widget.listback(widget.list);
                        }
                      });
                    },
                    text: "Save",
                    textStyle: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: MediaQuery.of(context).size.height * 0.024),
                    color: Color.fromARGB(255, 21, 142, 8),
                    icon: Icon(Icons.save),
                    type: GFButtonType.outline2x,
                  ),
                ),
              )),
          SizedBox(
            height: 0,
          ),
          (widget.list == [])
              ? Container(
                  height: MediaQuery.of(context).size.height * 0.25,
                  width: double.infinity,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: list.length,
                    itemBuilder: (context, index) {
                      return Stack(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                                '${list[index]['building_des'].toString()}'),
                          )
                        ],
                      );
                    },
                  ),
                )
              : Container(
                  height: MediaQuery.of(context).size.height * 0.25,
                  width: double.infinity,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: widget.list.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: EdgeInsets.only(left: 10, right: 10, top: 10),
                        child: Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all(width: 1)),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Discription',
                                      style: sizef,
                                    ),
                                    sizebox_,
                                    Text(
                                      'Building Size',
                                      style: sizef,
                                    ),
                                    sizebox_,
                                    Text(
                                      'Building Price',
                                      style: sizef,
                                    ),
                                    sizebox_,
                                    Text(
                                      'Price Per Sqm',
                                      style: sizef,
                                    ),
                                  ],
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      '  :  ${(widget.list[index]['building_des'].toString() != 'null') ? widget.list[index]['building_des'].toString() : ''}',
                                      style: sizef,
                                    ),
                                    sizebox_,
                                    Text(
                                      '  :  ${(widget.list[index]['building_size'].toString() != 'null') ? widget.list[index]['building_size'].toString() : ''} sqm',
                                      style: sizef,
                                    ),
                                    sizebox_,
                                    Text(
                                      '  :  ${(widget.list[index]['building_price'].toString() != 'null') ? widget.list[index]['building_price'].toString() : ''} \$',
                                      style: sizef,
                                    ),
                                    sizebox_,
                                    Text(
                                      '  :  ${(widget.list[index]['building_price_per'].toString() != 'null') ? widget.list[index]['building_price_per'].toString() : ''} \$/sqm',
                                      style: sizef,
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                )
        ],
      ),
    );
  }

  Widget _TextFiled_Input(type, lable, _value) {
    return Expanded(
      child: TextFormField(
        keyboardType: (type == 'number') ? TextInputType.number : null,
        style: TextStyle(
          fontSize: MediaQuery.of(context).size.height * 0.015,
          fontWeight: FontWeight.bold,
        ),
        onChanged: (value) {
          setState(() {
            if (lable == 'Description') {
              building_des = value;
            } else if (lable == 'Building Size') {
              building_size = value;
            } else if (lable == 'Building Price') {
              building_price = value;
            } else if (lable == 'Price Per sqm') {
              building_price_per = value;
            }
          });
        },
        decoration: InputDecoration(
          contentPadding: EdgeInsets.symmetric(vertical: 8),
          prefixIcon: Icon(
            Icons.feed_outlined,
            color: kImageColor,
          ),
          hintText: lable,
          // fillColor: kwhite,
          filled: true,
          focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(
              color: kPrimaryColor,
              width: 2.0,
            ),
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
    );
  }

  TextStyle Label() {
    return TextStyle(color: kPrimaryColor, fontSize: 9);
  }

  TextStyle Name() {
    return TextStyle(
        color: kImageColor, fontSize: 9, fontWeight: FontWeight.bold);
  }

  TextStyle NameProperty() {
    return TextStyle(
        color: kImageColor, fontSize: 10, fontWeight: FontWeight.bold);
  }
}
