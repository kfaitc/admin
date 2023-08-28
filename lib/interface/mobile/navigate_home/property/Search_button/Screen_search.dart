// ignore_for_file: prefer_const_constructors, camel_case_types, prefer_const_literals_to_create_immutables, non_constant_identifier_names, prefer_typing_uninitialized_variables, unused_field, unused_element, sized_box_for_whitespace, avoid_print, unnecessary_brace_in_string_interps, unused_local_variable, must_be_immutable

import 'dart:convert';
import 'dart:typed_data';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import '../Detail_Screen/Detail_all_list_Screen.dart';

class Screen_detail_Search extends StatefulWidget {
  Screen_detail_Search(
      {super.key,
      required this.bathroom,
      required this.bedhroom,
      required this.max,
      required this.min,
      required this.hometype,
      required this.province});
  String? bathroom;
  String? bedhroom;
  String? min;
  String? max;
  String? hometype;
  String? province;

  @override
  State<Screen_detail_Search> createState() => _Screen_detail_SearchState();
}

class _Screen_detail_SearchState extends State<Screen_detail_Search> {
  bool _isLoading_re = false;
  Future<void> _search() async {
    _isLoading_re = true;
    _pageController = PageController(initialPage: 0);
    await Future.wait([proerty_search_bathrooms(widget.bathroom)]);

    setState(() {
      _isLoading_re = false;
    });
  }

  Future<void> _search_minmax() async {
    _isLoading_re = true;
    _pageController = PageController(initialPage: 0);
    await Future.wait([]);

    setState(() {
      _isLoading_re = false;
    });
  }

  String? min, max;
  void Min() {
    if (widget.min == '1k') {
      min = '1000';
    } else if (widget.min == '2k') {
      min = '2000';
    } else if (widget.min == '5k') {
      min = '5000';
    } else if (widget.min == '10k') {
      min = '10000';
    } else if (widget.min == '20k') {
      min = '20000';
    } else if (widget.min == '50k') {
      min = '50000';
    } else if (widget.min == '100k') {
      min = '100000';
    } else if (widget.min == '200k') {
      min = '200000';
    } else if (widget.min == '500k') {
      min = '500000';
    }
  }

  void Max() {
    if (widget.max == '1k') {
      max = '1000';
    } else if (widget.max == '2k') {
      max = '2000';
    } else if (widget.max == '5k') {
      max = '5000';
    } else if (widget.max == '10k') {
      max = '10000';
    } else if (widget.max == '20k') {
      max = '20000';
    } else if (widget.max == '50k') {
      max = '50000';
    } else if (widget.max == '100k') {
      max = '100000';
    } else if (widget.max == '200k') {
      max = '200000';
    } else if (widget.max == '500k') {
      max = '500000';
    }
  }

  @override
  void initState() {
    Min();
    Max();
    _pageController = PageController(initialPage: 0);

    super.initState();
  }

  List? search_list;
  Future<void> proerty_search_bathrooms(query) async {
    var jsonData;
    final response = await http.get(Uri.parse(
        'https://www.oneclickonedollar.com/laravel_kfa_2023/public/api/More_option?min=10&max=10000&hometype=Factory'));

    if (response.statusCode == 200) {
      jsonData = jsonDecode(response.body);
      search_list = jsonData;
      setState(() {
        search_list;
      });
    }
  }

  late PageController _pageController;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _bady(),
    );
  }

  Widget _bady() {
    return SingleChildScrollView(
      child: Column(
        children: [
          _app(),
        ],
      ),
    );
  }

  Widget _app() {
    return Container(
      height: MediaQuery.of(context).size.height * 0.15,
      width: double.infinity,
      decoration: BoxDecoration(color: Color.fromARGB(255, 9, 11, 119)),
      child: ListTile(),
    );
  }

  List hometype_api = [];
  Widget dropdown_hometype() {
    return Padding(
      padding: const EdgeInsets.only(top: 40),
      child: Row(
        children: [
          IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: Icon(
                Icons.arrow_back_ios,
                color: Color.fromARGB(255, 107, 105, 105),
              )),
          Row(
            children: [
              Container(
                height: MediaQuery.of(context).size.width * 0.13,
                width: MediaQuery.of(context).size.width * 0.67,
                padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                child: DropdownButtonFormField<String>(
                  isExpanded: true,
                  onChanged: (newValue) {
                    newValue!;
                  },
                  validator: (String? value) {
                    if (value?.isEmpty ?? true) {
                      return 'Please select bank';
                    }
                    return null;
                  },
                  items: hometype_api
                      .map<DropdownMenuItem<String>>(
                        (value) => DropdownMenuItem<String>(
                          value: value["hometype"].toString(),
                          child: Text(
                            value["hometype"],
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                                fontSize:
                                    MediaQuery.textScaleFactorOf(context) * 11),
                          ),
                        ),
                      )
                      .toList(),
                  icon: Icon(
                    Icons.arrow_drop_down,
                    color: Color.fromARGB(255, 84, 83, 83),
                  ),
                  decoration: InputDecoration(
                    // fillColor: kwhite,
                    filled: true,
                    labelText: 'Hometpye',
                    hintText: 'Select',
                    contentPadding:
                        EdgeInsets.symmetric(vertical: 8, horizontal: 0),
                    labelStyle: TextStyle(
                        color: Colors.grey,
                        fontSize: MediaQuery.textScaleFactorOf(context) * 11),
                    prefixIcon: Icon(
                      Icons.search,
                      color: Color.fromARGB(255, 84, 83, 83),
                      size: MediaQuery.of(context).size.height * 0.035,
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide:
                          const BorderSide(color: Colors.white, width: 1.0),
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    border: InputBorder.none,
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        width: 1,
                        color: Colors.white,
                      ),
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  String? verbal_ID;
  Future<void> detail_property(int index, List list) async {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => Detail_property_sale_all(
          verbal_ID: verbal_ID,
          list_get_sale: list,
        ),
      ),
    );
  }
}
