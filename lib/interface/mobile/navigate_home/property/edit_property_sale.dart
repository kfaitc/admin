// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, prefer_typing_uninitialized_variables, non_constant_identifier_names, camel_case_types, avoid_print, unused_field, prefer_final_fields, prefer_interpolation_to_compose_strings, unnecessary_brace_in_string_interps, equal_keys_in_map, unrelated_type_equality_checks, body_might_complete_normally_nullable, unused_element, await_only_futures, unnecessary_string_interpolations, unnecessary_cast, prefer_const_constructors_in_immutables, avoid_unnecessary_containers, sized_box_for_whitespace, prefer_is_empty, unnecessary_null_comparison, unused_local_variable, unused_catch_clause, depend_on_referenced_packages, use_build_context_synchronously, unused_import
import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:geolocator/geolocator.dart';
import 'package:getwidget/components/shimmer/gf_shimmer.dart';
import 'package:getwidget/getwidget.dart';
import 'package:image/image.dart' as img;
import 'dart:typed_data';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_image_compress/flutter_image_compress.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';

import 'package:liquid_progress_indicator/liquid_progress_indicator.dart';
import 'package:multi_image_picker/multi_image_picker.dart';
import 'package:path_provider/path_provider.dart';
import 'dart:ui' as ui;
import '../../../../Profile/contants.dart';
import '../../../../components/building.dart';
import '../../../../components/building_Edit.dart';
import 'Getx_api/vetbal_controller.dart';
import 'Map/map_in_add_verbal.dart';
import 'Model/Autho_verbal.dart';

typedef OnChangeCallback = void Function(dynamic value);

// ignore: must_be_immutable
class Edit_verbal_property extends StatefulWidget {
  Edit_verbal_property({super.key, required this.list, required this.index});
  List list = [];
  String? index;
  @override
  State<Edit_verbal_property> createState() => _Add_verbal_saleState();
}

class _Add_verbal_saleState extends State<Edit_verbal_property> {
  late AutoVerbal_property_a requestAutoVerbal_property;
  final List<String> _items_2 = [];
  double? lat = 0, log = 0;
  TextEditingController? _Parking;
  TextEditingController? _LivingRoom;
  TextEditingController? _aircon;
  late TextEditingController _description;
  TextEditingController? _Title;
  TextEditingController? _address;
  TextEditingController? _bath;
  TextEditingController? _bed;
  TextEditingController? _price;
  TextEditingController? _sqm;
  TextEditingController? _total_area;
  TextEditingController? _price_sqm;
  TextEditingController? _private_area;
  TextEditingController? _Size_l;
  TextEditingController? _size_w;
  TextEditingController? _size_house;
  TextEditingController? _floor;
  TextEditingController? _land_l;
  TextEditingController? _land_w;
  TextEditingController? _land;
  ////////////////////
  int? id_ptys;
  // int? property_type_id;
  String? property_type_id;
  double price = 0;
  double sqm = 0;
  int bed = 0;
  int bath = 0;
  String? type = '';
  double land = 0;
  String? address = '';
  String? Title;
  String? description;
  String? hometype;
  //proeperty_2
  double Private_Area = 0;
  int Livingroom = 0;
  int Parking = 0;
  int size_w = 0;
  int size_l = 0;
  int floor = 0;
  int land_l = 0;
  int land_w = 0;
  double size_house = 0;
  double total_area = 0;
  double price_sqm = 0;
  int? hometype_api_index;
  int indexN = 0;
  int? index_Sale;
  int? index_Rent;
  late String branchvalue;
  bool _isLoading = true;
  var _items = [];
  String urgent = '';
  bool? ug;
  var last_verbal_id;
  String? Urgent_wiget;
  @override
  void initState() {
    _initData();

    indexN = int.parse(widget.index.toString());
    super.initState();

    Urgent_wiget = widget.list[indexN]['urgent'].toString();
    if (Urgent_wiget == 'Urgent') {
      ug = true;
    } else {
      ug = false;
    }
    id_ptys = int.parse(widget.list[indexN]['id_ptys'].toString());
    property_type_id = widget.list[indexN]['property_type_id'].toString();
    _price = TextEditingController(
        text: '${widget.list[indexN]['price'].toString()}');
    price = double.parse(_price!.text);
    _bed = TextEditingController(
        text:
            '${(widget.list[indexN]['bed'] != null) ? widget.list[indexN]['bed'] : 0}');
    bed = int.parse(_bed!.text);
    _bath = TextEditingController(
        text:
            '${(widget.list[indexN]['bath'] != null) ? widget.list[indexN]['bath'] : 0}');
    bath = int.parse(_bath!.text);
    _Title = TextEditingController(
        text:
            '${(widget.list[indexN]['Title'] != null) ? widget.list[indexN]['Title'] : ""}');
    Title = _Title!.text;

    _description = TextEditingController(
        text:
            '${(widget.list[indexN]['description'] != null) ? widget.list[indexN]['description'] : ""}');
    description = _description.text;
    hometype = widget.list[indexN]['hometype'].toString();
    _total_area = TextEditingController(
        text:
            '${(widget.list[indexN]['total_area'] != null) ? widget.list[indexN]['total_area'].toString() : 0}');
    total_area = double.parse(_total_area!.text);

    // ///property2
    _Size_l = TextEditingController(
        text:
            '${(widget.list[indexN]['Size_l'] != null) ? widget.list[indexN]['Size_l'].toString() : 0}');
    size_l = int.parse(_Size_l!.text);
    _size_w = TextEditingController(
        text:
            '${(widget.list[indexN]['size_w'] != null) ? widget.list[indexN]['size_w'].toString() : 0}');
    size_w = int.parse(_Size_l!.text);
    /////sssssssssssssss
    _land_l = TextEditingController(
        text:
            '${(widget.list[indexN]['land_l'] != null) ? widget.list[indexN]['land_l'].toString() : 0}');
    land_l = int.parse(_land_l!.text);
    _land_w = TextEditingController(
        text:
            '${(widget.list[indexN]['land_w'] != null) ? widget.list[indexN]['land_w'].toString() : 0}');
    land_w = int.parse(_land_w!.text);
    _land = TextEditingController(
        text:
            '${(widget.list[indexN]['land'] != null) ? widget.list[indexN]['land'].toString() : 0}');
    land = double.parse(_land!.text);
    size_house = double.parse(widget.list[indexN]['size_house'].toString());

    _sqm = TextEditingController(
        text:
            '${(widget.list[indexN]['sqm'] != null) ? widget.list[indexN]['sqm'].toString() : 0}');
    sqm = double.parse(_sqm!.text);
    _price_sqm = TextEditingController(
        text:
            '${(widget.list[indexN]['price_sqm'] != null) ? widget.list[indexN]['price_sqm'].toString() : 0}');
    price_sqm = double.parse(_total_area!.text);
    _private_area = TextEditingController(
        text:
            '${(widget.list[indexN]['Private_Area'] != null) ? widget.list[indexN]['Private_Area'].toString() : 0}');
    Private_Area = double.parse(_private_area!.text);
    _aircon = TextEditingController(
        text:
            '${(widget.list[indexN]['aircon'] != null) ? widget.list[indexN]['aircon'].toString() : 0}');
    aircon = int.parse(_aircon!.text);
    _LivingRoom = TextEditingController(
        text:
            '${(widget.list[indexN]['Livingroom'] != null) ? widget.list[indexN]['Livingroom'].toString() : 0}');
    Livingroom = int.parse(_LivingRoom!.text);
    _floor = TextEditingController(
        text:
            '${(widget.list[indexN]['floor'] != null) ? widget.list[indexN]['floor'].toString() : 0}');
    floor = int.parse(_floor!.text);
    _Parking = TextEditingController(
        text:
            '${(widget.list[indexN]['Parking'] != null) ? widget.list[indexN]['Parking'].toString() : 0}');
    Parking = int.parse(_Parking!.text);
    //backent for latlog
    lat = double.parse(widget.list[indexN]['lat'].toString());
    log = double.parse(widget.list[indexN]['log'].toString());
    type = widget.list[indexN]['type'].toString();
    urgent = widget.list[indexN]['urgent'].toString();
    property_type_id = widget.list[indexN]['property_type_id'].toString();
  }

  bool? index12 = true;
  var SizedBox_10w = SizedBox(
    width: 10,
  );
  var SizedBox_5 = SizedBox(
    height: 5,
  );
  var khan;
  var songkat;
  var provice_map;
  Future<void> _initData() async {
    await Future.wait([
      controller_verbal.verbal_Hometype(),
      controller_verbal.verbal_Commune_25_all(),
    ]);

    setState(() {
      _isLoading = false;
    });
  }

  Widget _text(text) {
    return Text(
      text,
      style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: MediaQuery.of(context).size.height * 0.02,
          color: Color.fromARGB(255, 77, 76, 76)),
    );
  }

  Widget _text_noFWf(text) {
    return Padding(
      padding: const EdgeInsets.only(right: 30, left: 30, bottom: 5),
      child: Text(
        text,
        style: TextStyle(
            fontSize: MediaQuery.of(context).size.height * 0.016,
            color: Color.fromARGB(255, 87, 86, 86)),
      ),
    );
  }

  var controller_verbal = Controller_verbal();
  bool switchValue = false;
  String _switchValue = 'Switch';
  bool way = false;
  TextEditingController address1 = TextEditingController();

  String? await_functino;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color.fromARGB(255, 244, 244, 244),
        body: (await_functino != '1')
            ? body()
            : LiquidLinearProgressIndicator(
                value: 0.25, // Defaults to 0.5.
                valueColor: AlwaysStoppedAnimation(Color.fromARGB(255, 53, 33,
                    207)), // Defaults to the current Theme's accentColor.
                backgroundColor: Colors
                    .white, // Defaults to the current Theme's backgroundColor.
                borderColor: Colors.white,
                borderWidth: 5.0,
                borderRadius: 12.0,
                direction: Axis
                    .vertical, // The direction the liquid moves (Axis.vertical = bottom to top, Axis.horizontal = left to right). Defaults to Axis.horizontal.
                center: Text(
                  "Please waiting...!",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: MediaQuery.of(context).size.height * 0.025),
                ),
              ));
  }

  String? commune;
  String? district;

  var _size_10 = SizedBox(height: 10);

  // int? aircon;
  int aircon = 0;
  void update_property(_url) async {
    Map<String, dynamic> payload = await {
      'id_ptys': int.parse(widget.list[indexN]['id_ptys'].toString()),
      'property_type_id': property_type_id,
      'price': price,
      'sqm': sqm,
      'bed': bed,
      'bath': bath,
      'type': type.toString(),
      'land': land,
      // 'land': 12.2,
      'address': address,
      'Title': Title,
      'description': description,
      'hometype': hometype,

      'property_two': [
        {
          "id_ptys": int.parse(widget.list[indexN]['id_ptys'].toString()),
          "Private_Area": Private_Area,
          "Livingroom": Livingroom,
          "Parking": Parking,
          "size_w": size_w,
          "Size_l": size_l,
          "floor": floor,
          "land_l": land_l,
          "land_w": land_w,
          "size_house": size_house,
          "total_area": total_area,
          "price_sqm": price_sqm,
          "aircon": aircon,
        }
      ]
    };

    final url = await Uri.parse(
        'https://www.oneclickonedollar.com/laravel_kfa_2023/public/api/$_url');
    final response = await http.post(
      url,
      headers: {'Content-Type': 'application/json'},
      body: json.encode(payload),
    );

    if (response.statusCode == 200) {
      if (_await == true) {
        AwesomeDialog(
            context: context,
            animType: AnimType.leftSlide,
            headerAnimationLoop: false,
            dialogType: DialogType.success,
            showCloseIcon: false,
            title: 'Succesfully',
            autoHide: Duration(seconds: 3),
            onDismissCallback: (type) {
              setState(() {});
              Navigator.pop(context);
            }).show();
      } else {
        print('post with image');
      }
      print('Success value Sale');
    } else {
      print('Error Sale: ${response.reasonPhrase}');
    }
  }

  void _latlog(_url) async {
    Map<String, dynamic> payload = await {
      'id_ptys': int.parse(widget.list[indexN]['id_ptys'].toString()),
      'property_type_id': property_type_id,
      'lat': lat,
      'log': log,
    };

    final url = await Uri.parse(
        'https://www.oneclickonedollar.com/laravel_kfa_2023/public/api/$_url');
    final response = await http.post(
      url,
      headers: {'Content-Type': 'application/json'},
      body: json.encode(payload),
    );

    if (response.statusCode == 200) {
      print('Success latlog');
    } else {
      print('Error Latlog: ${response.reasonPhrase}');
    }
  }

  bool _await = false;
  void Urgent(_url) async {
    Map<String, dynamic> payload = await {
      'id_ptys': int.parse(widget.list[indexN]['id_ptys'].toString()),
      'property_type_id': property_type_id,
      'hometype': hometype.toString(),
      'urgent': urgent.toString(),
    };

    final url = await Uri.parse(
        'https://www.oneclickonedollar.com/laravel_kfa_2023/public/api/$_url');
    final response = await http.post(
      url,
      headers: {'Content-Type': 'application/json'},
      body: json.encode(payload),
    );

    if (response.statusCode == 200) {
      print('Success urgent_Sale');
    } else {
      print('Error Rent: ${response.reasonPhrase}');
    }
  }

  Widget appbar() {
    return Stack(children: [
      Container(
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
                bottomRight: Radius.circular(60),
                bottomLeft: Radius.circular(60))),
        height: MediaQuery.of(context).size.height * 0.18,
        width: double.infinity,
      ),
      Container(
        decoration: BoxDecoration(
            color: Color.fromARGB(255, 14, 16, 143),
            borderRadius: BorderRadius.only(
                bottomRight: Radius.circular(60),
                bottomLeft: Radius.circular(60))),
        height: MediaQuery.of(context).size.height * 0.15,
        width: double.infinity,
        child: Padding(
          padding:
              EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.03),
          child: ListTile(
            leading: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: Icon(Icons.arrow_back_ios_new_outlined,
                  size: MediaQuery.of(context).size.height * 0.04,
                  color: Colors.white),
            ),
            title: Center(
              child: Text(
                '${widget.list[indexN]['id_ptys']}',
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 13),
              ),
            ),
            trailing: GFButton(
              textStyle: TextStyle(color: Colors.white),
              onPressed: () async {
                setState(() {
                  address = '${khan} / ${provice_map}';
                  type;
                  urgent;
                });
                if (type == 'For Sale') {
                  await_functino = '1';
                  if (_imageFile != null) {
                    _await = false;
                    _latlog('lat_log_update/${widget.list[indexN]['id_ptys']}');
                    Urgent(
                        'Urgent_update_sale/${widget.list[indexN]['id_ptys']}');
                    update_property(
                        'property_sale_update/${widget.list[indexN]['id_ptys']}');
                    await _uploadImage(
                        'Image_ptys_post_id_last/${widget.list[indexN]['id_ptys']}',
                        'image_name_sale');
                  } else {
                    _await = true;
                    update_property(
                        'property_sale_update/${widget.list[indexN]['id_ptys']}');

                    _latlog('lat_log_update/${widget.list[indexN]['id_ptys']}');
                    Urgent(
                        'Urgent_update_sale/${widget.list[indexN]['id_ptys']}');
                  }
                  // await _uploadImag_Multiple('mutiple_image_post');
                } else if (type == 'For Rent') {
                  await_functino = '1';
                  //  await _uploadImag_Multiple('mutiple_imageR_post');

                  if (_imageFile != null) {
                    _await = false;
                    print('_____________if__Rent__________________');
                    _latlog(
                        'lat_log_update_rent/${widget.list[indexN]['id_ptys']}');
                    update_property(
                        'property_rent_update/${widget.list[indexN]['id_ptys']}');
                    Urgent('Urgen_update/${widget.list[indexN]['id_ptys']}');
                    await _uploadImage(
                        'Image_ptys_post_rent_last/${widget.list[indexN]['id_ptys']}',
                        'image_name_rent');
                  } else {
                    print('_____________else__Rent__________________');
                    _await = true;

                    _latlog(
                        'lat_log_update_rent/${widget.list[indexN]['id_ptys']}');

                    update_property(
                        'property_rent_update/${widget.list[indexN]['id_ptys']}');
                    Urgent('Urgen_update/${widget.list[indexN]['id_ptys']}');
                  }
                }
              },
              text: "Save",
              icon: Icon(Icons.save_alt_outlined),
              color: Colors.white,
              type: GFButtonType.outline,
            ),
          ),
        ),
      ),
    ]);
  }

  Widget body() {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          appbar(),
          _size_10,
          body_value(),
          body2_value(),
        ],
      ),
    );
  }

  Widget Image_select(text) {
    return Container(
      decoration: BoxDecoration(
          // color: Color.fromARGB(255, 158, 20, 20),
          border: Border.all(width: 1, color: Colors.grey),
          borderRadius: BorderRadius.circular(5)),
      height: MediaQuery.of(context).size.height * 0.222,
      width: double.infinity,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(5),
        child: FadeInImage.assetNetwork(
          fit: BoxFit.cover,
          placeholderFit: BoxFit.contain,
          placeholder: 'assets/earth.gif',
          image: text,
        ),
      ),
    );
  }

  Widget body_value() {
    return Container(
      height: MediaQuery.of(context).size.height,
      width: double.infinity,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(60), topRight: Radius.circular(60))),
      child: Padding(
        padding: const EdgeInsets.only(right: 30, left: 30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Text(
            //     'latlng = ${widget.list[indexN]['lat'].toString()} ${widget.list[indexN]['log'].toString()} ${widget.list[indexN]['property_type_id'].toString()}'),
            _size_10,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _text_noFWf(
                    '${widget.list[indexN]['type'] ?? ""}(${(urgent == "null") ? "" : urgent})'),
                Container(
                  height: MediaQuery.of(context).size.height * 0.04,
                  width: MediaQuery.of(context).size.width * 0.27,
                  decoration: BoxDecoration(
                      color: Color.fromARGB(255, 208, 208, 211),
                      border: Border.all(
                        width: 0.6,
                        color: Color.fromARGB(255, 210, 210, 213),
                      ),
                      borderRadius: BorderRadius.circular(10)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Switch(
                        autofocus: false,
                        activeColor: Colors.white,
                        value: ug!,
                        onChanged: (value) {
                          setState(() {
                            ug = value;
                            if (value == true) {
                              urgent = 'Urgent';
                            } else {
                              urgent = '';
                            }
                            print('Urgent : $urgent');
                          });
                        },
                      ),
                      Text(
                        '${(urgent == "null") ? "" : urgent}',
                        style: TextStyle(
                            color: Color.fromARGB(255, 100, 100, 100),
                            fontSize: 10,
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            _size_10,
            InkWell(
              onTap: () {
                setState(() {
                  _getImage();
                });
              },
              child: (_imageFile != null)
                  ? Container(
                      height: MediaQuery.of(context).size.height * 0.222,
                      width: double.infinity,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(5),
                        child: Image.file(
                          _imageFile!,
                          height: MediaQuery.of(context).size.height * 0.19,
                          width: double.infinity,
                          fit: BoxFit.cover,
                        ),
                      ),
                    )
                  : Image_select('${widget.list[indexN]['url'].toString()}'),
            ),
            _size_10,
            InkWell(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(
                  builder: (context) {
                    return Map_verbal_address_Sale(
                      get_province: (value) {
                        setState(() {
                          songkat = value.toString();
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
                          log = double.parse(value);
                        });
                      },
                      get_lat: (value) {
                        lat = double.parse(value);
                      },
                    );
                  },
                ));
              },
              child: Image_select(
                  'https://maps.googleapis.com/maps/api/staticmap?center=${lat.toString()},${log.toString()}&zoom=20&size=1080x920&maptype=hybrid&markers=color:red%7C%7C${lat.toString()},${log.toString()}&key=AIzaSyAJt0Zghbk3qm_ZClIQOYeUT0AaV5TeOsI'),
            ),
            dropdown(
                hometype,
                controller_verbal.list_hometype,
                'hometype',
                'hometype',
                'Hometype',
                '${widget.list[indexN]['hometype'].toString()}'),
            dropdown(
                property_type_id,
                controller_verbal.list_cummone,
                'property_type_id',
                'Name_cummune',
                'Province*',
                '${widget.list[indexN]['Name_cummune'].toString()}'),
            _size_10,
            Row(
              children: [
                text_double(price, 'Price*', _price),
                SizedBox_10w,
                text_double(sqm, 'Sqm', _sqm),
              ],
            ),
            _size_10,
            Row(
              children: [
                text_int(bed, 'Bed', _bed),
                SizedBox_10w,
                text_int(bath, 'Bath', _bath),
              ],
            ),
            _size_10,
            _text('Size Land*'),
            Building_Edit(
              type: 'Edit',
              total_value: widget.list[indexN]['land'].toString(),
              w_value: widget.list[indexN]['land_w'].toString(),
              l_value: widget.list[indexN]['land_l'].toString(),
              // size_house: _size_house,
              l: (value) {
                setState(() {
                  land_l = int.parse(value);
                });
              },
              w: (value) {
                setState(() {
                  land_w = int.parse(value);
                });
              },
              total: (value) {
                setState(() {
                  land = double.parse(value.toString());
                });
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget body2_value() {
    return Container(
      height: MediaQuery.of(context).size.height,
      color: Colors.white,
      width: double.infinity,
      child: Padding(
        padding: const EdgeInsets.only(right: 30, left: 30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _text('Size House'),
            Building_Edit(
              type: 'Edit',
              total_value: widget.list[indexN]['size_house'].toString(),
              w_value: widget.list[indexN]['size_w'].toString(),
              l_value: widget.list[indexN]['Size_l'].toString(),
              l: (value) {
                setState(() {
                  size_l = int.parse(value);
                });
              },
              w: (value) {
                setState(() {
                  size_w = int.parse(value);
                });
              },
              total: (value) {
                setState(() {
                  size_house = double.parse(value.toString());
                });
              },
            ),
            _size_10,
            Row(
              children: [
                text_int(floor, 'floor', _floor),
                SizedBox_10w,
                text_int(Parking, 'Parking', _Parking),
              ],
            ),
            _size_10,
            Row(
              children: [
                text_double(total_area, 'Total Area', _total_area),
                SizedBox_10w,
                text_double(price_sqm, 'Price(sqm)*', _price_sqm),
              ],
            ),
            _size_10,
            Row(
              children: [
                text_int(Livingroom, 'LivingRoom', _LivingRoom),
                SizedBox_10w,
                text_int(aircon, 'Aricon', _aircon),
              ],
            ),
            _size_10,
            Row(
              children: [
                Type_Property(type),
                SizedBox_10w,
                text_double(Private_Area, 'Private Area', _private_area),
              ],
            ),
            _size_10,
            _text('Title'),
            SizedBox_5,
            W_Title(_Title),
            _size_10,
            _text('Discription'),
            SizedBox_5,
            W_Description(_description)
          ],
        ),
      ),
    );
  }

  Widget W_Description(controller) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.3,
      width: double.infinity,
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(
          color: Colors.grey,
          width: 1,
        ),
      ),
      child: TextFormField(
        controller: controller,
        onChanged: (value) {
          setState(() {
            controller = TextEditingController(text: value);
            description = controller.text;
            print(description.toString());
          });
        },
        maxLines: 3,
        decoration: InputDecoration.collapsed(
          hintText: 'Description',
        ),
      ),
    );
  }

  Widget W_Title(controller) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.1,
      width: double.infinity,
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(
          color: Colors.grey,
          width: 1,
        ),
      ),
      child: TextFormField(
        controller: controller,
        onChanged: (value) {
          setState(() {
            Title = value;
          });
        },
        maxLines: 3,
        decoration: InputDecoration.collapsed(
          hintText: 'Title',
        ),
      ),
    );
  }

  Widget Type_Property(lable) {
    return Expanded(
      child: SizedBox(
        child: Padding(
          padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
          child: DropdownButtonFormField<String>(
            isDense: false,
            onChanged: (newValue) {
              setState(() {
                type = newValue;
              });
              if (type == 'For Sale') {
                index_Sale = _items_2.indexOf('For Sale');
              } else if (type == 'For Rent') {
                index_Rent = _items_2.indexOf('For Rent');
                // print('$type');
                // print('$index_Rent');
              }
            },
            validator: (String? value) {
              if (value?.isEmpty ?? true) {
                return 'Please select bank';
              }
              return null;
            },
            items: _items_2
                .map<DropdownMenuItem<String>>(
                  (value) => DropdownMenuItem<String>(
                    value: value,
                    child: Text(
                      value,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                          fontSize: MediaQuery.textScaleFactorOf(context) * 13,
                          height: 1),
                    ),
                  ),
                )
                .toList(),
            // add extra sugar..
            icon: Icon(
              Icons.arrow_drop_down,
              color: Colors.grey,
            ),

            decoration: InputDecoration(
              contentPadding: EdgeInsets.symmetric(vertical: 8),
              prefixIcon: Icon(
                Icons.type_specimen_outlined,
                color: Colors.grey,
              ),
              hintText: (lable != 'null') ? lable : 'Type*',
              fillColor: kwhite,
              filled: true,
              focusedBorder: OutlineInputBorder(
                borderSide: const BorderSide(
                  color: Colors.grey,
                  width: 2.0,
                ),
                borderRadius: BorderRadius.circular(10.0),
              ),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  width: 1,
                  color: Colors.grey,
                ),
                borderRadius: BorderRadius.circular(10.0),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget text_int(int _value, text, controller) {
    return Expanded(
      child: SizedBox(
        child: Padding(
          padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
          child: TextFormField(
            controller: controller,
            style: TextStyle(
              fontSize: MediaQuery.of(context).size.height * 0.015,
              fontWeight: FontWeight.bold,
            ),
            keyboardType: TextInputType.number,
            onChanged: (value) {
              setState(() {
                // _value = int.parse(value.toString());
                if (text == 'Bed') {
                  bed = int.parse(value.toString());
                } else if (text == 'Bath') {
                  bath = int.parse(value.toString());
                } else if (text == 'floor') {
                  floor = int.parse(value.toString());
                } else if (text == 'Parking') {
                  Parking = int.parse(value.toString());
                } else if (text == 'LivingRoom') {
                  Livingroom = int.parse(value.toString());
                } else {
                  aircon = int.parse(value.toString());
                }
              });
            },
            decoration: InputDecoration(
              contentPadding: EdgeInsets.symmetric(vertical: 8),
              prefixIcon: Icon(
                (text == 'Bed')
                    ? Icons.bed_rounded
                    : (text == 'Bath')
                        ? Icons.bathtub_sharp
                        : (text == 'floor')
                            ? Icons.stairs_outlined
                            : (text == 'Parking')
                                ? Icons.local_parking
                                : (text == 'LivingRoom')
                                    ? Icons.living_rounded
                                    : Icons.kitchen_outlined,
                color: Colors.grey,
              ),
              hintText: '$text',
              fillColor: kwhite,
              filled: true,
              labelText: '$text',
              focusedBorder: OutlineInputBorder(
                borderSide: const BorderSide(
                  color: Colors.grey,
                  width: 2.0,
                ),
                borderRadius: BorderRadius.circular(10.0),
              ),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  width: 1,
                  color: Colors.grey,
                ),
                borderRadius: BorderRadius.circular(10.0),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget text_double(double _value, text, controller) {
    return Expanded(
      child: SizedBox(
        child: Padding(
          padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
          child: TextFormField(
            controller: controller,
            style: TextStyle(
              fontSize: MediaQuery.of(context).size.height * 0.015,
              fontWeight: FontWeight.bold,
            ),
            keyboardType: TextInputType.number,
            onChanged: (value) {
              setState(() {
                // _value = double.parse(value.toString());
                if (text == 'Price*') {
                  price = double.parse(value.toString());
                } else if (text == 'Sqm') {
                  sqm = double.parse(value.toString());
                } else if (text == 'Total Area') {
                  total_area = double.parse(value.toString());
                } else if (text == 'Price(sqm)*') {
                  price_sqm = double.parse(value.toString());
                } else {
                  Private_Area = double.parse(value.toString());
                }
              });
            },
            decoration: InputDecoration(
              labelText: '$text',
              contentPadding: EdgeInsets.symmetric(vertical: 8),
              prefixIcon: Icon(
                (text == 'Price*')
                    ? Icons.price_change_outlined
                    : (text == 'Sqm')
                        ? Icons.square_foot_rounded
                        : (text == 'Total Area')
                            ? Icons.tornado_outlined
                            : (text == 'Price(sqm)*')
                                ? Icons.price_check_outlined
                                : Icons.privacy_tip_outlined,
                color: Colors.grey,
              ),
              hintText: '$text',
              fillColor: kwhite,
              filled: true,
              focusedBorder: OutlineInputBorder(
                borderSide: const BorderSide(
                  color: Colors.grey,
                  width: 2.0,
                ),
                borderRadius: BorderRadius.circular(10.0),
              ),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  width: 1,
                  color: Colors.grey,
                ),
                borderRadius: BorderRadius.circular(10.0),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget dropdown(value, List list, text1, text2, lable, widget_value) {
    return Container(
      padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
      child: DropdownButtonFormField<String>(
        isExpanded: true,
        onChanged: (newValue) {
          setState(() {
            if (lable == 'Province*') {
              property_type_id = newValue;
            } else {
              hometype = newValue;
            }
          });
        },
        validator: (String? value) {
          if (value?.isEmpty ?? true) {
            return 'Please select bank';
          }
          return null;
        },
        items: list
            .map<DropdownMenuItem<String>>(
              (value) => DropdownMenuItem<String>(
                value: value["$text1"].toString(),
                child: Text(
                  value['$text2'],
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontSize: MediaQuery.textScaleFactorOf(context) * 11,
                  ),
                ),
              ),
            )
            .toList(),
        // add extra sugar..
        icon: Icon(
          Icons.arrow_drop_down,
          color: Colors.grey,
        ),
        //property_type_id
        decoration: InputDecoration(
            fillColor: kwhite,
            filled: true,
            contentPadding: EdgeInsets.symmetric(vertical: 8),
            labelText: (widget_value.toString() == 'null')
                ? "Hometype"
                : widget_value.toString(),
            labelStyle: TextStyle(
                fontSize: MediaQuery.of(context).size.height * 0.015,
                color: ((widget_value.toString() == 'null')
                    ? Colors.grey
                    : Color.fromARGB(255, 26, 25, 25))),
            hintText: '$lable',
            helperStyle: TextStyle(
                fontSize: MediaQuery.of(context).size.height * 0.015,
                color: Colors.grey),
            prefixIcon: Icon(
              (lable == 'Hometype')
                  ? Icons.home_work_outlined
                  : Icons.edit_location_alt_sharp,
              color: Colors.grey,
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: const BorderSide(
                  color: Color.fromARGB(255, 133, 132, 132), width: 2.0),
              borderRadius: BorderRadius.circular(10.0),
            ),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(
                width: 1,
                color: Colors.grey,
              ),
              borderRadius: BorderRadius.circular(10.0),
            ),
            border: InputBorder.none),
      ),
    );
  }

  File? _imageFile;
  Future<void> _getImage() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      setState(() {
        _imageFile = File(pickedFile.path);
        print(_imageFile);
      });
    }
  }

  List<File> _images = [];
  Future<void> pickImages() async {
    List<Asset> resultList = [];
    try {
      resultList = await MultiImagePicker.pickImages(
        maxImages: 2,
        enableCamera: true,
      );
    } on Exception catch (e) {
      // Handle exception
    }
    // setState(() {
    //   _images;
    // });

    List<File> files = [];
    for (var asset in resultList) {
      ByteData byteData = await asset.getByteData();
      final tempDir = await getTemporaryDirectory();

      final file = File('${tempDir.path}/${asset.name}');
      await file.writeAsBytes(byteData.buffer.asUint8List());
      files.add(file);
    }

    setState(() {
      _images = files;
    });
  }

  Future<void> _uploadImageRentMultiple() async {
    final url = Uri.parse(
        'https://www.oneclickonedollar.com/laravel_kfa_2023/public/api/mutiple_imageR_post');

    final request = http.MultipartRequest('POST', url);
    request.fields['id_ptys'] = controller_verbal.id_last.toString();
    request.fields['property_type_id'] = property_type_id.toString();

    if (_images != null) {
      final tempDir = await getTemporaryDirectory();
      final path = tempDir.path;

      List<File> compressedImages = [];

      for (int i = 0; i < _images.length; i++) {
        var compressedImageFile = await FlutterImageCompress.compressAndGetFile(
          _images[i].absolute.path,
          '$path/${DateTime.now().millisecondsSinceEpoch}_$i.jpg',
          quality: 70,
        );

        if (compressedImageFile != null) {
          compressedImages.add(compressedImageFile);
        }
      }

      request.files.add(
        await http.MultipartFile.fromPath(
          'image',
          compressedImages[0].path,
        ),
      );
      request.files.add(
        await http.MultipartFile.fromPath(
          'images',
          compressedImages[1].path,
        ),
      );
    }

    final response = await request.send();

    if (response.statusCode == 200) {
      print('Images uploaded successfully!');
      AwesomeDialog(
          context: context,
          animType: AnimType.leftSlide,
          headerAnimationLoop: false,
          dialogType: DialogType.success,
          showCloseIcon: false,
          title: 'Succesfully',
          autoHide: Duration(seconds: 3),
          onDismissCallback: (type) {
            setState(() {});
            Navigator.pop(context);
          }).show();
    } else {
      print('Error uploading images: ${response.reasonPhrase}');
    }
  }

  Future<File?> _uploadImage(_url, type_image) async {
    if (_imageFile == null) {
      return _imageFile;
    }

    final url = Uri.parse(
        'https://www.oneclickonedollar.com/laravel_kfa_2023/public/api/$_url');

    final request = http.MultipartRequest('POST', url);
    request.fields['id_image'] = widget.list[indexN]['id_ptys'].toString();
    request.fields['hometype'] = hometype.toString();
    request.fields['property_type_id'] = property_type_id.toString();
    if (_imageFile != null) {
      final tempDir = await getTemporaryDirectory();
      final path = tempDir.path;

      var compressedImageFile = await FlutterImageCompress.compressAndGetFile(
        _imageFile!.absolute.path,
        '$path/${DateTime.now().millisecondsSinceEpoch}.jpg',
        quality: 70,
      );

      request.files.add(await http.MultipartFile.fromPath(
          '$type_image', compressedImageFile!.path));

      final response = await request.send();

      if (response.statusCode == 200) {
        AwesomeDialog(
            context: context,
            animType: AnimType.leftSlide,
            headerAnimationLoop: false,
            dialogType: DialogType.success,
            showCloseIcon: false,
            title: 'Succesfully',
            autoHide: Duration(seconds: 3),
            onDismissCallback: (type) {
              setState(() {});
              Navigator.pop(context);
            }).show();
        print('Image image_name_sale!');
      } else {
        print('Error uploading image: ${response.reasonPhrase}');
      }
    }
  }
}
