// ignore_for_file: unused_element, unused_local_variable, unused_field, unnecessary_null_comparison, must_be_immutable

import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_image_compress/flutter_image_compress.dart';
import 'package:getwidget/components/animation/gf_animation.dart';
import 'package:getwidget/components/button/gf_button.dart';
import 'package:getwidget/shape/gf_button_shape.dart';
import 'package:getwidget/types/gf_animation_type.dart';
import 'package:getwidget/types/gf_button_type.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';
import 'package:multi_image_picker/multi_image_picker.dart';
import 'package:path_provider/path_provider.dart';
import '../../../../components/L_w_total.dart';
import '../../../../components/contants.dart';
import '../../../../model/executive/Edit_Executive.dart';
import '../../../../model/executive/executive.dart';
import 'LandBuilding.dart';
import 'google_map/google_map.dart';
import 'landbuilding_appraiser.dart';

class Detail_Executive extends StatefulWidget {
  Detail_Executive(
      {super.key, required this.list, required this.index, this.delete});
  List list = [];
  String? index;
  String? delete;
  @override
  State<Detail_Executive> createState() => _New_ExecutiveState();
}

class _New_ExecutiveState extends State<Detail_Executive>
    with SingleTickerProviderStateMixin {
  TextEditingController fromdate = TextEditingController();
  TextEditingController Valuation = TextEditingController();
  TextEditingController Issue = TextEditingController();
  TextEditingController todate = TextEditingController();
  late AnimationController controller;
  late Animation<double> animation;
  late Animation<Offset> offsetAnimation;
  TextEditingController? _executive_purpose;
  TextEditingController? _executive_land_price_per;
  TextEditingController? _executive_land_price;
  TextEditingController? _executive_market_min;
  TextEditingController? _executive_market_max;
  TextEditingController? _executive_property_name;
  TextEditingController? _executive_obligation;
  TextEditingController? _executive_building;
  TextEditingController? _executive_fire;
  TextEditingController? _executive_fair;
  TextEditingController? _executive_forced;
  TextEditingController? _remark;
  int index_i = 0;
  int index_pppp = 0;
  String? name_customer;
  String? executive_purpose;
  String? executive_land_price_lable;
  String? executive_land_price;
  void delete_executive() async {
    final response = await http.delete(Uri.parse(
        'https://www.oneclickonedollar.com/laravel_kfa_2023/public/api/delete_list_ex/${widget.list[index_i]['executive_id']}'));
    if (response.statusCode == 200) {
      setState(() {
        Navigator.pop(context);
      });
    } else {
      throw Exception('Delete error occured!');
    }
  }

  void delete_talbe_first(id) async {
    final response = await http.delete(Uri.parse(
        'https://www.oneclickonedollar.com/laravel_kfa_2023/public/api/delect_table/$id'));
    if (response.statusCode == 200) {
      setState(() {});
    } else {
      throw Exception('Delete error occured!');
    }
  }

  @override
  void initState() {
    _Customer_name();
    _hometype();
    if (widget.delete == 'No_Delete') {
      _approvals();
    } else {
      print('no');
    }
    fetchImageUrls();
    // last_id();
    zoning();
    _road();
    today_formart();
    _lat =
        TextEditingController(text: '${widget.list[index_i]['executive_lon']}');
    // executive_purpose = _lat!.text;
    _log =
        TextEditingController(text: '${widget.list[index_i]['executive_lng']}');
    //
    _executive_purpose = TextEditingController(
        text: '${widget.list[index_i]['executive_purpose']}');
    executive_purpose = _executive_purpose!.text;
    //
    _executive_land_price_per = TextEditingController(
        text: '${widget.list[index_i]['executive_land_price_per']}');
    executive_land_price_lable = _executive_land_price_per!.text;
    //
    _executive_market_min = TextEditingController(
        text: '${widget.list[index_i]['executive_market_min']}');
    // executive_land_price = _executive_market_min!.text;
    //
    _executive_market_max = TextEditingController(
        text: '${widget.list[index_i]['executive_market_max']}');
    // executive_land_price = _executive_market_max!.text;
    //
    _executive_land_price = TextEditingController(
        text: '${widget.list[index_i]['executive_land_price']}');
    executive_land_price = _executive_land_price!.text;
    //
    _executive_property_name = TextEditingController(
        text: '${widget.list[index_i]['executive_property_name']}');
    //
    _executive_obligation = TextEditingController(
        text: '${widget.list[index_i]['executive_obligation']}');
    //
    _executive_building = TextEditingController(
        text: '${widget.list[index_i]['executive_building']}');
    //
    _executive_fire = TextEditingController(
        text: '${widget.list[index_i]['executive_fire']}');
    //
    _executive_fair = TextEditingController(
        text: '${widget.list[index_i]['executive_fair']}');
    //
    _executive_forced = TextEditingController(
        text: '${widget.list[index_i]['executive_forced']}');
    //
    _remark = TextEditingController(
        text: '${widget.list[index_i]['executive_remarks']}');

    ///
    frist_switch = 'one';
    index_i = int.parse(widget.index.toString());
    name_customer = widget.list[index_i]['customerengname'].toString();
    // switchValues = List<bool>.generate(list_map.length, (index) => false);

    requestModelbuildng = ExecutiveRequestModel(
        executive_id:
            int.parse(widget.list[index_i]['executive_id'].toString()),
        executiveStatus: 1,
        executive_address: widget.list[index_i]['executive_address'].toString(),
        executive_app:
            (widget.list[index_i]['executive_app'].toString() == 'null')
                ? 0
                : int.parse(widget.list[index_i]['executive_app'].toString()),
        executive_approvel: 0,
        executive_building:
            widget.list[index_i]['executive_building'].toString(),
        executive_by: 0,
        executive_com: 0,
        executive_comment: '1',
        executive_commune_id: (widget.list[index_i]['executive_commune_id']
                    .toString() !=
                'null')
            ? int.parse(widget.list[index_i]['executive_commune_id'].toString())
            : 0,
        executive_create_by: 0,
        executive_customer_id:
            int.parse(widget.list[index_i]['customer_id'].toString()),
        executive_district_id:
            (widget.list[index_i]['executive_district_id'].toString() != 'null')
                ? int.parse(
                    widget.list[index_i]['executive_district_id'].toString())
                : 0,
        executive_fair: widget.list[index_i]['executive_fair'].toString(),
        executive_fire: widget.list[index_i]['executive_fire'].toString(),
        executive_forced: widget.list[index_i]['executive_forced'].toString(),
        ////
        executive_land_lengh:
            widget.list[index_i]['executive_land_lengh'].toString(),
        executive_land_price:
            widget.list[index_i]['executive_land_price'].toString(),
        executive_land_price_per:
            widget.list[index_i]['executive_land_price_per'].toString(),
        executive_land_total:
            widget.list[index_i]['executive_land_total'].toString(),
        executive_land_width:
            widget.list[index_i]['executive_land_width'].toString(),
        executive_lng: widget.list[index_i]['executive_lng'].toString(),
        executive_lon: widget.list[index_i]['executive_lon'].toString(),
        executive_market_max: widget.list[index_i]['executive_market_min'].toString(),
        executive_market_min: widget.list[index_i]['executive_market_max'].toString(),
        executive_modify_by: 0,
        executive_modify_date: widget.list[index_i]['executive_modify_date'].toString(),
        executive_name: 0,
        executive_obligation: widget.list[index_i]['executive_obligation'].toString(),
        executive_property_name: widget.list[index_i]['executive_property_name'].toString(),
        executive_property_type_id: (widget.list[index_i]['property_type_id'].toString() != 'null') ? int.parse(widget.list[index_i]['property_type_id'].toString()) : 0,
        executive_province_id: (widget.list[index_i]['executive_province_id'].toString() != 'null') ? int.parse(widget.list[index_i]['executive_province_id'].toString()) : 0,
        executive_published: 1,
        executive_purpose: widget.list[index_i]['executive_purpose'].toString(),
        executive_remark: '',
        executive_remarks: widget.list[index_i]['executive_remarks'].toString(),
        executive_road_type_id: (widget.list[index_i]['executive_road_type_id'].toString() != 'null') ? int.parse(widget.list[index_i]['executive_road_type_id'].toString()) : 0,
        executive_user: '',
        executive_valuate_id: 0,

        ///
        executive_valuation_date: widget.list[index_i]['executive_valuation_date'].toString(),
        executive_valuation_issue_date: widget.list[index_i]['executive_valuation_issue_date'].toString(),

        ///
        executive_zone_id: (widget.list[index_i]['executive_zone_id'].toString() != 'null') ? int.parse(widget.list[index_i]['executive_zone_id'].toString()) : 0,
        executiveapprove1status: (widget.list[index_i]['executiveapprove1status'].toString() != 'null') ? int.parse(widget.list[index_i]['executiveapprove1status'].toString()) : 0,
        executivestatusid: (widget.list[index_i]['executivestatusid'].toString() != 'null') ? int.parse(widget.list[index_i]['executivestatusid'].toString()) : 0,
        remember_token: '',
        building: [],
        appriaser: [],
        conparable_map: []
        // conparable_map: [],
        // building: list_building,
        // appriaser: list_appraiser,
        // conparable_map: list_appraiser,
        );

    _appraiser();
    _building();
    _list_map_table();
    _table_map();
    // agency();
    super.initState();
    controller = AnimationController(
        duration: const Duration(milliseconds: 645), vsync: this);
    animation = new CurvedAnimation(parent: controller, curve: Curves.linear);
    controller.repeat();
    offsetAnimation = Tween<Offset>(
      begin: Offset(0, 0),
      end: const Offset(0, -0.3),
    ).animate(CurvedAnimation(
      parent: controller,
      curve: Curves.easeIn,
    ));
  }

  late ExecutiveRequestModel requestModelbuildng;
  String? reloard = '1';
  List customer_name = [];
  List raod_name = [];
  String? ds;
  String? Edit_Map = 'Edit_Map';
  String? build_size;
  String? build_price;
  String? price_per;
  String? Raod_id;
  String? land;
  String? total;
  String? _customer_name;
  String? _property;
  String? _zoning;
  String? formattedDate;
  void today_formart() {
    DateTime now = DateTime.now();
    formattedDate = DateFormat('yyyy-MM-dd').format(now);
  }

  String? succes;
  String? frist_switch;
  @override
  Widget build(BuildContext context) {
    double _h = MediaQuery.of(context).size.height * 0.07;
    double _w = MediaQuery.of(context).size.width * 0.2;
    var pading_r_l_t = EdgeInsets.only(right: 30, left: 30, top: 10);
    var pading_r_l_t_b =
        EdgeInsets.only(right: 30, left: 30, top: 10, bottom: 10);
    var _Sizebox_w = SizedBox(
      width: 10,
    );
    var _Sizebox_h = SizedBox(
      height: 10,
    );
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurple[900],
        centerTitle: true,
        // title: Text('New Executive'),
        // title: Text(widget.list[index_i]['url1'].toString()),
        title: Text(
            '${widget.list[index_i]['executive_id']} (${requestModelbuildng.executive_app.toString()})'),
        // title: Text('${f}'),
        actions: [
          InkWell(
            onTap: () async {
              if (widget.list[index_i]['url1'].toString() == 'null' &&
                  _images.length != 0) {
                print('1111111');
                await _uploadImage_Multiple(
                    widget.list[index_i]['executive_id'].toString());
                postApiData();
              }
              /////////////////
              else if (widget.list[index_i]['url1'].toString() != 'null') {
                print('22222222222');
                await _updateImage_Multiple(
                    widget.list[index_i]['executive_id'].toString());
                postApiData();
              }
              /////////////////
              else {
                postApiData();
                print('333333333333');
              }
            },
            child: Container(
              height: _h,
              width: _w,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: Colors.lightGreen[700],
                boxShadow: [BoxShadow(color: Colors.green, blurRadius: 5)],
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(10),
                  bottomLeft: Radius.circular(10),
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Edit'),
                  SizedBox(
                    width: 10,
                  ),
                  Icon(Icons.save_alt_outlined),
                ],
              ),
            ),
          ),
          SizedBox(
            width: 5,
          )
        ],
      ),
      body: NestedScrollView(
        headerSliverBuilder: (context, innerBoxIsScrolled) {
          return [
            SliverToBoxAdapter(
                child: Column(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    (widget.delete == 'No_Delete')
                        ? dropdown_approvals()
                        : Row(
                            children: [
                              Spacer(),
                              Padding(
                                padding: const EdgeInsets.only(left: 10),
                                child: GFButton(
                                  elevation: 10,
                                  color: Color.fromARGB(255, 137, 10, 35),
                                  onPressed: () {
                                    AwesomeDialog(
                                      context: context,
                                      title: 'Confirmation',
                                      desc:
                                          'Are you sure you want to delete this item?',
                                      btnOkText: 'Yes',
                                      btnOkColor:
                                          Color.fromARGB(255, 72, 157, 11),
                                      btnCancelText: 'No',
                                      btnCancelColor:
                                          Color.fromARGB(255, 133, 8, 8),
                                      btnOkOnPress: () {
                                        setState(() {
                                          delete_executive();
                                        });
                                      },
                                      btnCancelOnPress: () {},
                                    ).show();
                                  },
                                  text: "Delete",
                                  icon: Icon(
                                    Icons.delete,
                                    color: Colors.white,
                                  ),
                                  shape: GFButtonShape.pills,
                                ),
                              ),
                            ],
                          ),

                    Padding(
                      padding: pading_r_l_t,
                      child: Row(
                        children: [
                          _dropdown('', customer_name, '$name_customer',
                              'customer_id', 'customerengname', _customer_name),
                        ],
                      ),
                    ),
                    Padding(
                      padding: pading_r_l_t,
                      child: Row(
                        children: [
                          _date(
                              Valuation,
                              requestModelbuildng.executive_valuation_date,
                              'Valuation Date*'),
                          _Sizebox_w,
                          _date(
                              Issue,
                              requestModelbuildng
                                  .executive_valuation_issue_date,
                              ''),
                        ],
                      ),
                    ),
                    Padding(
                      padding: pading_r_l_t,
                      child: Row(
                        children: [
                          // _TextFiled_Input('no_number',
                          //     requestModelbuildng.executive_purpose, 'null'),
                        ],
                      ),
                    ),
                    Padding(
                      padding: pading_r_l_t,
                      child: Row(
                        children: [
                          _dropdown(
                              '',
                              _list_type,
                              widget.list[index_i]['property_type_name']
                                  .toString(),
                              'property_type_id',
                              'property_type_name',
                              _property),
                          _Sizebox_w,
                          _dropdown(
                              'Zoning',
                              _list_zoning,
                              widget.list[index_i]['zoning_name'].toString(),
                              'zoning_id',
                              'zoning_name',
                              _zoning),
                        ],
                      ),
                    ),
                    _Text('Land Size', pading_r_l_t_b),
                    Land_building(
                      l_get: requestModelbuildng.executive_land_lengh,
                      l: (value) {
                        setState(() {
                          requestModelbuildng.executive_land_lengh = value;
                        });
                      },
                      total_get: requestModelbuildng.executive_land_total,
                      total: (value) {
                        setState(() {
                          requestModelbuildng.executive_land_total = value;
                        });
                      },
                      w_get: requestModelbuildng.executive_land_width,
                      w: (value) {
                        setState(() {
                          requestModelbuildng.executive_land_width = value;
                        });
                      },
                    ),
                    Padding(
                      padding: pading_r_l_t,
                      child: Row(
                        children: [
                          // _TextFiled_Input(
                          //     'number',
                          //     widget.list[index_i]['executive_land_price_per']
                          //         .toString(),
                          //     'null'),
                          // _Sizebox_w,
                          // _TextFiled_Input(
                          //     'number',
                          //     widget.list[index_i]['executive_land_price']
                          //         .toString(),
                          //     'null'),
                        ],
                      ),
                    ),

                    _Text('Market Price (Per sqr)', pading_r_l_t_b),
                    Padding(
                      padding: pading_r_l_t,
                      child: Row(
                        children: [
                          // _TextFiled_Input(
                          //     'number',
                          //     widget.list[index_i]['executive_market_min']
                          //         .toString(),
                          //     'null'),
                          _TextFiled_Input('number', 'Min Price', 'null'),
                          _Sizebox_w,
                          // _TextFiled_Input(
                          //     'number',
                          //     widget.list[index_i]['executive_market_max']
                          //         .toString(),
                          //     'null'),
                          _TextFiled_Input('number', 'Max Price', 'null'),
                        ],
                      ),
                    ),
                    build_add(),
                    (requestModelbuildng.building.length != 0)
                        ? list_view(requestModelbuildng.building, '1')
                        : SizedBox(),
                    Appraiser_add(),
                    (requestModelbuildng.appriaser.length != 0)
                        ? list_view(requestModelbuildng.appriaser, '2')
                        : SizedBox(),

                    Padding(
                      padding: pading_r_l_t,
                      child: Row(
                        children: [
                          _TextFiled_Input('no_number', 'Propert Name', ''),
                          // _TextFiled_Input('no_number',
                          //     requestModelbuildng.executive_property_name, ''),
                          // _Sizebox_w,
                          _TextFiled_Input('no_number', 'Obligation', ''),
                          // _TextFiled_Input('no_number',
                          //     requestModelbuildng.executive_obligation, ''),
                        ],
                      ),
                    ),
                    //sssssssssssss
                    Padding(
                      padding: pading_r_l_t,
                      child: Row(
                        children: [
                          _TextFiled_Input(
                              'number', 'Gross Floor Area (GFA)', ''),
                          // _TextFiled_Input('number',
                          //     requestModelbuildng.executive_building, ''),
                          // _Sizebox_w,
                          _TextFiled_Input('number', 'Fair Market Value', ''),
                          // _TextFiled_Input(
                          //     'number', requestModelbuildng.executive_fire, ''),
                        ],
                      ),
                    ),
                    Padding(
                      padding: pading_r_l_t,
                      child: Row(
                        children: [
                          _TextFiled_Input('number', 'Forced Sale Value', ''),
                          // _TextFiled_Input('no_number',
                          //     requestModelbuildng.executive_fair, ''),
                          _Sizebox_w,
                          _TextFiled_Input(
                              'number', 'Fire Insurance Value', ''),
                          // _TextFiled_Input('no_number',
                          //     requestModelbuildng.executive_forced, ''),
                        ],
                      ),
                    ),
                    skc(
                        'address : ${(widget.list[index_i]['executive_address'].toString() == 'null') ? '' : widget.list[index_i]['executive_address'].toString()}',
                        'Province : ${(widget.list[index_i]['provinces_name'].toString() == 'null') ? '' : widget.list[index_i]['provinces_name'].toString()}',
                        'District : ${(widget.list[index_i]['district_name'].toString() == 'null') ? '' : widget.list[index_i]['district_name'].toString()}',
                        'Cummune : ${(widget.list[index_i]['commune_name'].toString() == 'null') ? '' : widget.list[index_i]['commune_name'].toString()}'),
                    dropdown_(raod_name),
                    Remark(),
                    (_images.length != 0) ? mutiple_pic_get() : SizedBox(),
                    Mutiple_image_button(),
                    Padding(
                      padding: pading_r_l_t,
                      child: Row(
                        children: [
                          // _TextFiled_Input('no_number',
                          //     requestModelbuildng.executive_lon, ''),
                          // _Sizebox_w,
                          // _TextFiled_Input('no_number',
                          //     requestModelbuildng.executive_lng, ''),
                        ],
                      ),
                    ),
                    Padding(
                      padding: pading_r_l_t,
                      child: Row(
                        children: [
                          _date_day('From Date*', '', fromdate),
                          _Sizebox_w,
                          _date_day('To Date*', '', todate)
                        ],
                      ),
                    ),
                    google_map(),
                    Text(list_map_T.length.toString())
                    // data_table(context),

                    // Text(list_comparble.toString())
                  ],
                ),
              ],
            )),
          ];
        },
        body: table_bool
            ? Center(
                child: CircularProgressIndicator(),
              )
            : ScrollerViewContainer_(),
        // body: ScrollerViewContainer(
        //   List_map_back_bool: (value) {
        //     setState(() {
        //       list_comeback_bool = value;
        //     });
        //   },
        //   List_map_back: (value) {
        //     setState(() {
        //       list_comeback = value;
        //     });
        //   },
        //   conparable_map: requestModelbuildng.conparable_map,
        //   list_map: list_comparble,
        // ),
      ),
      // body: SingleChildScrollView(
      //   child:
      // ),
    );
  }

  Future<void> _uploadImage_Multiple(id) async {
    final url = Uri.parse(
        'https://www.oneclickonedollar.com/laravel_kfa_2023/public/api/executive/image');

    final request = http.MultipartRequest('POST', url);
    request.fields['executive_file_id'] = id.toString();

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
          'image1',
          compressedImages[0].path,
        ),
      );
      request.files.add(
        await http.MultipartFile.fromPath(
          'image2',
          compressedImages[1].path,
        ),
      );
      if (_images.length < 3) {
        print('null');
      } else {
        print('no null');
        request.files.add(
          await http.MultipartFile.fromPath(
            'image3',
            compressedImages[2].path,
          ),
        );
      }

      if (_images.length < 4) {
        print('null');
      } else {
        request.files.add(
          await http.MultipartFile.fromPath(
            'image4',
            compressedImages[3].path,
          ),
        );
      }
    }

    final response = await request.send();

    if (response.statusCode == 200) {
      print('Images uploaded successfully!');
    } else {
      print('Error uploading images: ${response.reasonPhrase}');
    }
  }

  Future<void> _updateImage_Multiple(id) async {
    final url = Uri.parse(
        'https://www.oneclickonedollar.com/laravel_kfa_2023/public/api/update_ex/image/${id}');

    final request = http.MultipartRequest('POST', url);
    request.fields['executive_file_id'] = id.toString();

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
          'image1',
          compressedImages[0].path,
        ),
      );
      request.files.add(
        await http.MultipartFile.fromPath(
          'image2',
          compressedImages[1].path,
        ),
      );
      if (_images.length < 3) {
        print('null');
      } else {
        print('no null');
        request.files.add(
          await http.MultipartFile.fromPath(
            'image3',
            compressedImages[2].path,
          ),
        );
      }

      if (_images.length < 4) {
        print('null');
      } else {
        request.files.add(
          await http.MultipartFile.fromPath(
            'image4',
            compressedImages[3].path,
          ),
        );
      }
    }

    final response = await request.send();

    if (response.statusCode == 200) {
      print('Images update successfully!');
    } else {
      print('Error uploading images: ${response.reasonPhrase}');
    }
  }

  TextEditingController? _log;
  TextEditingController? _lat;
  String? Purpose = '';

  String? executive_lon = '';
  String? executive_lng = '';

  List _list_type = [];
  void _hometype() async {
    setState(() {});
    var rs = await http.get(Uri.parse(
        'https://www.oneclickonedollar.com/laravel_kfa_2023/public/api/properties_dropdown'));
    if (rs.statusCode == 200) {
      var jsonData = jsonDecode(rs.body);

      setState(() {
        _list_type = jsonData;
      });
    }
  }

  void _approvals() async {
    setState(() {});
    var rs = await http.get(Uri.parse(
        'https://www.oneclickonedollar.com/laravel_kfa_2023/public/api/executive_approvel'));
    if (rs.statusCode == 200) {
      var jsonData = jsonDecode(rs.body);

      setState(() {
        approvals_list = jsonData;
      });
    }
  }

  List _list_zoning = [];
  void zoning() async {
    setState(() {});
    var rs = await http.get(Uri.parse(
        'https://www.oneclickonedollar.com/laravel_kfa_2023/public/api/zoning/name'));
    if (rs.statusCode == 200) {
      var jsonData = jsonDecode(rs.body);
      // print(jsonData);
      // print(jsonData);

      setState(() {
        _list_zoning = jsonData;
      });
    }
  }

  Widget ScrollerViewContainer_() {
    return (requestModelbuildng.conparable_map.toString() != '[]')
        ? Container(
            height: MediaQuery.of(context).size.height * 0.4,
            width: double.infinity,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Container(
                    height: MediaQuery.of(context).size.height * 0.07,
                    width: double.infinity,
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: SingleChildScrollView(
                        scrollDirection: Axis.vertical,
                        child: Row(
                          children: [
                            container('No', 'color'),
                            container('Action', 'color'),
                            container('Property Type', 'color'),
                            container('Land Size', 'color'),
                            container('Building Size', 'color'),
                            container('Asking', 'color'),
                            container('Offered', 'color'),
                            container('Bought', 'color'),
                            container('Sold Out', 'color'),
                            container('Location', 'color'),
                            container('Survey Date', 'color'),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Container(
                    height: MediaQuery.of(context).size.height * 0.7,
                    width: double.infinity,
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: SingleChildScrollView(
                        scrollDirection: Axis.vertical,
                        child: Container(
                          decoration:
                              BoxDecoration(border: Border.all(width: 2)),
                          width: 30 *
                              50.0, // Set the width of the container to accommodate all the List items
                          child: ListView.builder(
                            scrollDirection: Axis.vertical,
                            shrinkWrap: true,
                            physics: NeverScrollableScrollPhysics(),
                            itemCount: list_map_T.length,
                            itemBuilder: (context, index) {
                              return Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: InkWell(
                                  onTap: () {},
                                  child: Container(
                                    height: MediaQuery.of(context).size.height *
                                        0.07,
                                    width: double.infinity,
                                    color: Color.fromARGB(255, 41, 27, 133),
                                    child: Row(
                                      children: [
                                        // Text(list_map_T[index_i]
                                        //         ['propertycomparable_id']
                                        //     .toString()),
                                        // Text(switchValues[index].toString()),
                                        container(index, 'no_color'),
                                        _switch(index),
                                        container(
                                            list_map_T[index]
                                                    ['property_type_name']
                                                .toString(),
                                            'no_color'),
                                        container(
                                            list_map_T[index]
                                                    ['comparable_land_total']
                                                .toString(),
                                            'no_color'),
                                        container(
                                            list_map_T[index]
                                                    ['comparable_sold_total']
                                                .toString(),
                                            'no_color'),
                                        container(
                                            list_map_T[index]
                                                    ['comparable_adding_price']
                                                .toString(),
                                            'no_color'),
                                        container(
                                            (list_map_T[index][
                                                            'comparableaddprice']
                                                        .toString() ==
                                                    'null'
                                                ? ''
                                                : list_map_T[index]
                                                        ['comparableaddprice']
                                                    .toString()),
                                            'no_color'),
                                        container(
                                            (list_map_T[index][
                                                            'comparableboughtprice']
                                                        .toString() ==
                                                    'null'
                                                ? ''
                                                : list_map_T[index][
                                                        'comparableboughtprice']
                                                    .toString()),
                                            'no_color'),
                                        container(
                                            list_map_T[index]
                                                    ['comparable_sold_price']
                                                .toString(),
                                            'no_color'),
                                        container(
                                            '${(list_map_T[index]['provinces_name'].toString() == 'null' ? '' : list_map_T[index]['provinces_name'].toString())} ${(list_map_T[index]['district_name'].toString() == 'null' ? '' : list_map_T[index]['district_name'].toString())} ${(list_map_T[index]['commune_name'].toString() == 'null' ? '' : list_map_T[index]['commune_name'].toString())}',
                                            'no_color'),
                                        container(
                                            '${list_map_T[index]['comparable_survey_date'].toString()}',
                                            'no_color'),
                                      ],
                                    ),
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          )
        : SizedBox();
  }

  String? executive_id;
  String? executiveStatus;
  String? executive_address;
  String? executive_app;
  String? executive_approvel;
  String? executive_building;
  String? executive_by;
  String? executive_com;
  String? executive_comment;
  String? executive_commune_id;
  String? executive_create_by;
  String? executive_customer_id;
  String? executive_district_id;
  String? executive_fair;
  String? executive_fire;
  String? executive_forced;

  String? executive_land_lengh;
  // String? executive_land_price;
  String? executive_land_price_per;
  String? executive_land_total;
  String? executive_land_width;
  // String? executive_lng;
  // String? executive_lon;
  String? executive_market_min;
  String? executive_modify_by;
  String? executive_modify_date;
  String? executive_name;
  String? executive_obligation;
  String? executive_property_name;
  String? executive_property_type_id;
  String? executive_province_id;
  String? executive_published;
  // String? executive_purpose;
  String? executive_remark;
  String? executive_remarks;
  String? executive_road_type_id;
  String? executive_user;
  String? executive_valuate_id;
  String? executive_valuation_date;
  String? executive_valuation_issue_date;
  String? executive_zone_id;
  String? executiveapprove1status;
  String? executivestatusid;
  String? remember_token;

  void upate_executive() async {
    Map<String, dynamic> payload = await {
      'executive_id':
          int.parse(widget.list[index_i]['executive_id'].toString()),
      'executiveStatus': 1,
      'executive_address': widget.list[index_i]['executive_address'].toString(),
      'executive_app': 0,
      'executive_approvel': 0,
      'executive_building':
          widget.list[index_i]['executive_building'].toString(),
      'executive_by': 0,
      'executive_com': 0,
      'executive_comment': '',
      'executive_commune_id': (widget.list[index_i]['executive_commune_id']
                  .toString() !=
              'null')
          ? int.parse(widget.list[index_i]['executive_commune_id'].toString())
          : 0,
      'executive_create_by': 0,
      'executive_customer_id':
          int.parse(widget.list[index_i]['customer_id'].toString()),
      'executive_district_id': (widget.list[index_i]['executive_district_id']
                  .toString() !=
              'null')
          ? int.parse(widget.list[index_i]['executive_district_id'].toString())
          : 0,
      'executive_fair': widget.list[index_i]['executive_fair'].toString(),
      'executive_fire': widget.list[index_i]['executive_fire'].toString(),
      'executive_forced': widget.list[index_i]['executive_forced'].toString(),
      'executive_land_lengh':
          widget.list[index_i]['executive_land_lengh'].toString(),
      'executive_land_price':
          widget.list[index_i]['executive_land_price'].toString(),
      'executive_land_price_per':
          widget.list[index_i]['executive_land_price_per'].toString(),
      'executive_land_total':
          widget.list[index_i]['executive_land_total'].toString(),
      'executive_land_width':
          widget.list[index_i]['executive_land_width'].toString(),
      'executive_lng': widget.list[index_i]['executive_lng'].toString(),
      'executive_lon': widget.list[index_i]['executive_lon'].toString(),
      'executive_market_min':
          widget.list[index_i]['executive_market_min'].toString(),
      'executive_market_max':
          widget.list[index_i]['executive_market_max'].toString(),
      'executive_modify_by': 0,
      'executive_modify_date': null,
      'executive_name': 0,
      'executive_obligation':
          widget.list[index_i]['executive_obligation'].toString(),
      'executive_property_name':
          widget.list[index_i]['executive_property_name'].toString(),
      'executive_property_type_id':
          (widget.list[index_i]['property_type_id'].toString() != 'null')
              ? int.parse(widget.list[index_i]['property_type_id'].toString())
              : 0,
      'executive_province_id': (widget.list[index_i]['executive_province_id']
                  .toString() !=
              'null')
          ? int.parse(widget.list[index_i]['executive_province_id'].toString())
          : 0,
      'executive_published': 1,
      'executive_purpose': widget.list[index_i]['executive_purpose'].toString(),
      'executive_remark': '',
      'executive_remarks': widget.list[index_i]['executive_remarks'].toString(),
      'executive_road_type_id': (widget.list[index_i]['executive_road_type_id']
                  .toString() !=
              'null')
          ? int.parse(widget.list[index_i]['executive_road_type_id'].toString())
          : 0,
      'executive_user': null,
      'executive_valuate_id': null,
      'executive_valuation_date':
          widget.list[index_i]['executive_valuation_date'].toString(),
      'executive_valuation_issue_date':
          widget.list[index_i]['executive_valuation_issue_date'].toString(),
      'executive_zone_id':
          (widget.list[index_i]['executive_zone_id'].toString() != 'null')
              ? int.parse(widget.list[index_i]['executive_zone_id'].toString())
              : 0,
      'executiveapprove1status': 0,
      'executivestatusid': 1,
      'remember_token': null,
    };

    final url = await Uri.parse(
        'https://www.oneclickonedollar.com/laravel_kfa_2023/public/api/update_executive/${widget.list[index_i]['executive_id'].toString()}');
    final response = await http.post(
      url,
      headers: {'Content-Type': 'application/json'},
      body: json.encode(payload),
    );

    if (response.statusCode == 200) {
      print('Success ARF ID POST');
      AwesomeDialog(
          context: context,
          animType: AnimType.leftSlide,
          headerAnimationLoop: false,
          dialogType: DialogType.success,
          showCloseIcon: false,
          title: 'Save Successfully',
          autoHide: Duration(seconds: 3),
          onDismissCallback: (type) {
            setState(() {
              Navigator.pop(context);
            });
          }).show();
    } else {
      print('Error New customer:');
    }
  }

  List _list_comparable = [];
  void get_comparable() async {
    var rs = await http.get(Uri.parse(
        'https://www.oneclickonedollar.com/laravel_kfa_2023/public/api/search_comparable/11.123123132/104.123123?start=2019-2-1&end=2023-1-1'));
    if (rs.statusCode == 200) {
      var jsonData = jsonDecode(rs.body);
      setState(() {
        _list_comparable = jsonData;
      });
    }
  }

  String? id_only;
  List ID_List = [];
  // void last_id() async {
  //   setState(() {});
  //   var rs = await http.get(Uri.parse(
  //       'https://www.oneclickonedollar.com/laravel_kfa_2023/public/api/ex_last/id'));
  //   if (rs.statusCode == 200) {
  //     var jsonData = jsonDecode(rs.body);
  //     setState(() {
  //       ID_List = jsonData;
  //       var a = int.parse(ID_List[0]['executive_id'].toString()) + 1;
  //       id_only = a.toString();
  //       requestModelbuildng.executive_id = int.parse(id_only.toString());
  //     });
  //   }
  // }

  List list_comparble = [];
  List<Map<String, dynamic>> list_map = [];
  String? comparablecode = '';
  String? start = '';
  String? end = '';
  List table_list_value = [];
  Widget google_map() {
    return Padding(
      padding: const EdgeInsets.only(left: 30, right: 30, top: 10),
      child: InkWell(
        onTap: () {
          Navigator.push(context, MaterialPageRoute(
            builder: (context) {
              return Map_Search_Comparable_(
                delect_first_time: (value) {
                  setState(() {
                    delete_first = value;
                  });
                },
                back_f_value: (value) {
                  setState(() {
                    f = value;
                  });
                },
                executive_map_table: (value) {
                  setState(() {
                    requestModelbuildng.conparable_map = value;
                  });
                },

                executive_map_table_comback: requestModelbuildng.conparable_map,
                list_CP: list_map_T,
                list_comparable: (value) {
                  setState(() {
                    list_map_T = value;

                    // requestModelbuildng.conparable_map = value;
                    // print(list_comparble.toString());
                  });
                },
                //////////////
                list: requestModelbuildng.conparable_map,
                // list: [],
                listback: (value) {
                  setState(() {
                    requestModelbuildng.conparable_map = value;
                    print(requestModelbuildng.conparable_map.toString());
                  });
                },
                y_lat: (value) {
                  setState(() {
                    requestModelbuildng.executive_lon = value.toString();
                    _lat = TextEditingController(
                        text: '${requestModelbuildng.executive_lon}');
                    requestModelbuildng.executive_lon = _lat!.text;
                  });
                },
                y_log: (value) {
                  setState(() {
                    requestModelbuildng.executive_lng = value.toString();
                    _log = TextEditingController(
                        text: '${requestModelbuildng.executive_lng}');
                    requestModelbuildng.executive_lng = _log!.text;
                  });
                },
                comparablecode: (value) {
                  setState(() {
                    comparablecode = value;
                  });
                },
                id: (Edit_Map == 'Edit_Map')
                    ? widget.list[index_i]['executive_id'].toString()
                    : id_only,
                start: start,
                end: end,
                hh_: '30',
                get_commune: (value) {},
                get_district: (value) {},
                get_lat: (value) {
                  setState(() {
                    // lat = value;
                  });
                },
                get_log: (value) {
                  setState(() {
                    // log = value;
                  });
                },
                get_max1: (value) {},
                get_max2: (value) {},
                get_min1: (value) {},
                get_min2: (value) {},
                get_province: (value) {},
              );
            },
          ));
        },
        child: Container(
            alignment: Alignment.center,
            decoration: BoxDecoration(
                border: Border.all(width: 2),
                // color: Color.fromARGB(255, 59, 22, 169),
                borderRadius: BorderRadius.circular(10)),
            height: MediaQuery.of(context).size.height * 0.2,
            width: MediaQuery.of(context).size.width * 1,
            child: Image.network(
              'https://www.agiratech.com/wp-content/uploads/2020/04/google_maps.png',
              fit: BoxFit.cover,
            )),
      ),
    );
  }

  Widget _date_day(lable, value, controller) {
    return Expanded(
      child: TextField(
        style: TextStyle(
          fontSize: MediaQuery.of(context).size.height * 0.015,
        ),
        controller: controller, //editing controller of this TextField
        decoration: InputDecoration(
          prefixIcon: Icon(
            Icons.calendar_today,
            color: kImageColor,
            size: MediaQuery.of(context).size.height * 0.025,
          ), //icon of text field
          labelText: "${lable}",
          fillColor: kwhite,
          filled: true,
          focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: kPrimaryColor, width: 2.0),
            borderRadius: BorderRadius.circular(10.0),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
              width: 1,
              color: kPrimaryColor,
            ),
            borderRadius: BorderRadius.circular(10.0),
          ), //label text of field
        ),
        readOnly: true, //set it true, so that user will not able to edit text
        onTap: () async {
          DateTime? pickedDate = await showDatePicker(
              context: context,
              initialDate: DateTime.now(),
              firstDate: DateTime(2000),
              lastDate: DateTime(2101));

          if (pickedDate != null) {
            (lable == 'From Date*')
                ? start = DateFormat('yyyy-MM-dd').format(pickedDate)
                : end = DateFormat('yyyy-MM-dd').format(pickedDate);

            setState(() {
              (lable == 'From Date*')
                  ? controller.text = start!
                  : controller.text = end;
            });
          } else {
            print("Date is not selected");
          }
        },
      ),
    );
  }

  List<building_execuactive> lb = [
    building_execuactive(0, '', '', '', '', 1, '')
  ];
  void deleteItemToList(int Id) {
    setState(() {
      // print(requestModelbuildng.building.length.toString());
      // requestModelbuildng.building != list;
      // requestModelbuildng.building.removeAt(Id);
      lb.removeAt(int.parse(Id.toString()));
    });
  }

  Future<void> postApiData() async {
    setState(() {
      for (int i = 0; i < requestModelbuildng.conparable_map.length; i++) {
        if (switchValues[i] == false) {
          requestModelbuildng.conparable_map.removeAt(i);
          // print('true');
          // print(switchValues[i].toString());
        } else {
          requestModelbuildng.conparable_map;
          // print('no true');
        }
      }
      // print(list_map_T.length.toString());
      // list_map_T = requestModelbuildng.conparable_map;
    });
    final url =
        'https://www.oneclickonedollar.com/laravel_kfa_2023/public/api/update_executive/${widget.list[index_i]['executive_id'].toString()}'; // Replace with your actual API endpoint URL

    // Create your JSON data based on the structure you provided
    final Map<String, dynamic> jsonData = {
      "executive_id":
          int.parse(widget.list[index_i]['executive_id'].toString()),
      "executiveStatus": 1,
      "executive_address": requestModelbuildng.executive_address,
      "executive_app": requestModelbuildng.executive_app,
      "executive_approvel": 0,
      "executive_building": requestModelbuildng.executive_building,
      "executive_by": 0,
      "executive_com": 0,
      "executive_comment": requestModelbuildng.executive_comment,
      "executive_commune_id": requestModelbuildng.executive_commune_id,
      "executive_create_by": 0,
      "executive_customer_id": requestModelbuildng.executive_customer_id,
      "executive_district_id": requestModelbuildng.executive_district_id,
      "executive_fair": requestModelbuildng.executive_fair,
      "executive_fire": requestModelbuildng.executive_fire,
      "executive_forced": requestModelbuildng.executive_forced,
      "executive_land_lengh": requestModelbuildng.executive_land_lengh,
      "executive_land_price": requestModelbuildng.executive_land_price,
      "executive_land_price_per": requestModelbuildng.executive_land_price_per,
      "executive_land_total": requestModelbuildng.executive_land_total,
      "executive_land_width": requestModelbuildng.executive_land_width,
      "executive_lng": requestModelbuildng.executive_lng,
      "executive_lon": requestModelbuildng.executive_lon,
      "executive_market_max": requestModelbuildng.executive_market_max,
      "executive_market_min": requestModelbuildng.executive_market_min,
      "executive_modify_by": 0,
      // "executive_modify_date": "2021-1-2",
      "executive_modify_date": "2021-1-2",
      "executive_name": 0,
      "executive_obligation": requestModelbuildng.executive_obligation,
      "executive_property_name": requestModelbuildng.executive_property_name,
      "executive_property_type_id":
          requestModelbuildng.executive_property_type_id,
      "executive_province_id": requestModelbuildng.executive_province_id,
      "executive_published": requestModelbuildng.executive_published,
      "executive_purpose": requestModelbuildng.executive_purpose,
      "executive_remark": requestModelbuildng.executive_remark,
      "executive_remarks": requestModelbuildng.executive_remarks,
      "executive_road_type_id": requestModelbuildng.executive_road_type_id,
      "executive_user": requestModelbuildng.executive_user,
      "executive_valuate_id": requestModelbuildng.executive_valuate_id,
      "executive_valuation_date": requestModelbuildng.executive_valuation_date,
      "executive_valuation_issue_date":
          requestModelbuildng.executive_valuation_issue_date,
      "executive_zone_id": requestModelbuildng.executive_zone_id,
      "executiveapprove1status": requestModelbuildng.executiveapprove1status,
      "executivestatusid": requestModelbuildng.executivestatusid,
      "remember_token": "2",
      "building": requestModelbuildng.building,
      "appraiser": requestModelbuildng.appriaser,
      "conparable_map": requestModelbuildng.conparable_map,
    };

    // Encode the JSON data to a string
    final String jsonString = jsonEncode(jsonData);

    try {
      // Send the HTTP POST request
      final response = await http.post(
        Uri.parse(url),
        headers: {'Content-Type': 'application/json'},
        body: jsonString,
      );

      // Check the response status
      if (response.statusCode == 200) {
        AwesomeDialog(
            context: context,
            animType: AnimType.leftSlide,
            headerAnimationLoop: false,
            dialogType: DialogType.success,
            showCloseIcon: false,
            title: 'Successfully',
            autoHide: Duration(seconds: 3),
            onDismissCallback: (type) {
              Navigator.pop(context);
            }).show();
        print('API Response: ${response.body}');
      } else {
        // Request failed with an error, handle the error here
        print('Error: ${response.statusCode}');
      }
    } catch (e) {
      // Exception occurred while sending the request, handle the error here
      print('Error: $e');
    }
  }

  List data = [];
  List<String> _imageUrls = [];
  bool _isLoading = true;
  Future<void> fetchImageUrls() async {
    final response = await http.get(
      Uri.parse(
          'https://www.oneclickonedollar.com/laravel_kfa_2023/public/api/image_executive_by/${widget.list[index_i]['executive_id'].toString()}'),
    );

    if (response.statusCode == 200) {
      data = jsonDecode(response.body);

      final Map<String, dynamic> imageData = data.first;

      setState(() {
        _imageUrls = [
          imageData['url1'],
          imageData['url2'],
          imageData['url3'],
          imageData['url4'],
        ];
        _isLoading = false;
      });
    } else {
      throw Exception('Failed to fetch image URLs');
    }
  }

  void showConfirmationBottomSheet() {
    showModalBottomSheet<void>(
      context: context,
      builder: (BuildContext context) {
        return Container(
          height: MediaQuery.of(context).size.height * 0.35,
          width: double.infinity,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10), color: Colors.white),
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'You need Input',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize:
                                MediaQuery.of(context).size.height * 0.02),
                      )
                    ],
                  ),
                  SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          (requestModelbuildng.executive_customer_id == 0)
                              ? Padding(
                                  padding: const EdgeInsets.only(top: 5),
                                  child: Text(
                                    'Customer *',
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize:
                                            MediaQuery.of(context).size.height *
                                                0.017),
                                  ),
                                )
                              : SizedBox(),
                          (requestModelbuildng.executive_valuation_date == '')
                              ? Padding(
                                  padding: const EdgeInsets.only(top: 5),
                                  child: Text(
                                    'Valuation Date *',
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize:
                                            MediaQuery.of(context).size.height *
                                                0.017),
                                  ),
                                )
                              : SizedBox(),
                          (start == '')
                              ? Padding(
                                  padding: const EdgeInsets.only(top: 5),
                                  child: Text(
                                    'From Date *',
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize:
                                            MediaQuery.of(context).size.height *
                                                0.017),
                                  ),
                                )
                              : SizedBox(),
                          (end == '')
                              ? Padding(
                                  padding: const EdgeInsets.only(top: 5),
                                  child: Text(
                                    'To Date *',
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize:
                                            MediaQuery.of(context).size.height *
                                                0.017),
                                  ),
                                )
                              : SizedBox(),
                        ],
                      ),
                      Column(
                        children: [
                          (requestModelbuildng.executive_valuation_issue_date ==
                                  '')
                              ? Padding(
                                  padding: const EdgeInsets.only(top: 5),
                                  child: Text(
                                    'Issue Date*',
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize:
                                            MediaQuery.of(context).size.height *
                                                0.017),
                                  ),
                                )
                              : SizedBox(),
                          (requestModelbuildng.executive_property_type_id == 0)
                              ? Padding(
                                  padding: const EdgeInsets.only(top: 5),
                                  child: Text(
                                    'Property Type*',
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize:
                                            MediaQuery.of(context).size.height *
                                                0.017),
                                  ),
                                )
                              : SizedBox(),
                          (requestModelbuildng.executive_lon == '')
                              ? Padding(
                                  padding: const EdgeInsets.only(top: 5),
                                  child: Text(
                                    'Google Map(Latiture * /Longitude *)',
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize:
                                            MediaQuery.of(context).size.height *
                                                0.017),
                                  ),
                                )
                              : SizedBox(),
                          // (requestModelbuildng.building.toString() == '[]')
                          //     ? Padding(
                          //         padding: const EdgeInsets.only(top: 5),
                          //         child: Text(
                          //           'Building *',
                          //           style: TextStyle(
                          //               fontWeight: FontWeight.bold,
                          //               fontSize:
                          //                   MediaQuery.of(context).size.height *
                          //                       0.017),
                          //         ),
                          //       )
                          //     : SizedBox(),
                          // (requestModelbuildng.appriaser.toString() == '[]')
                          //     ? Padding(
                          //         padding: const EdgeInsets.only(top: 5),
                          //         child: Text(
                          //           'Appraiser *',
                          //           style: TextStyle(
                          //               fontWeight: FontWeight.bold,
                          //               fontSize:
                          //                   MediaQuery.of(context).size.height *
                          //                       0.017),
                          //         ),
                          //       )
                          //     : SizedBox(),
                          (_images.length >= 2)
                              ? Padding(
                                  padding: const EdgeInsets.only(top: 5),
                                  child: Text(
                                    'Mutiple Image *',
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize:
                                            MediaQuery.of(context).size.height *
                                                0.017),
                                  ),
                                )
                              : SizedBox(),
                        ],
                      )
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  List<File> _images = [];
  Widget mutiple_pic() {
    return Padding(
      padding: const EdgeInsets.only(left: 30, right: 30, top: 10),
      child: Container(
        decoration: BoxDecoration(border: Border.all(width: 2)),
        height: MediaQuery.of(context).size.height * 0.43,
        width: double.infinity,
        child: GridView.count(
          crossAxisCount: 2,
          mainAxisSpacing: 10,
          crossAxisSpacing: 10,
          children: List.generate(_images.length, (index) {
            return Image.file(
              _images[index],
              fit: BoxFit.cover,
            );
          }),
        ),
      ),
    );
  }

  Widget mutiple_pic_get() {
    return (_images.length != 0)
        ? Padding(
            padding: const EdgeInsets.only(left: 30, right: 30, top: 10),
            child: Container(
              decoration: BoxDecoration(border: Border.all(width: 2)),
              height: MediaQuery.of(context).size.height * 0.43,
              width: double.infinity,
              child: GridView.count(
                crossAxisCount: 2,
                mainAxisSpacing: 10,
                crossAxisSpacing: 10,
                children: List.generate(_images.length, (index) {
                  return Image.file(
                    _images[index],
                    fit: BoxFit.cover,
                  );
                }),
              ),
            ),
          )
        : (data.length == 0 && _images.length == 0)
            ? SizedBox()
            : Padding(
                padding: const EdgeInsets.only(left: 30, right: 30, top: 10),
                child: Container(
                  height: MediaQuery.of(context).size.height * 0.44,
                  width: double.infinity,
                  child: GridView.count(
                    crossAxisCount: 2, // Number of columns in the grid
                    crossAxisSpacing: 10.0, // Spacing between columns
                    mainAxisSpacing: 10.0, // Spacing between rows
                    children: _imageUrls.map((imageUrl) {
                      return InkWell(
                        onTap: () {
                          showDialog(
                            context: context,
                            builder: (context) {
                              return Padding(
                                padding:
                                    const EdgeInsets.only(left: 30, right: 30),
                                child: Container(
                                  child: FadeInImage.assetNetwork(
                                    placeholderCacheHeight: 120,
                                    placeholderCacheWidth: 120,
                                    placeholderFit: BoxFit.contain,
                                    placeholder: 'assets/earth.gif',
                                    image: imageUrl,
                                  ),
                                ),
                              );
                            },
                          );
                        },
                        child: FadeInImage.assetNetwork(
                          placeholderCacheHeight: 120,
                          placeholderCacheWidth: 120,
                          fit: BoxFit.cover,
                          placeholderFit: BoxFit.contain,
                          placeholder: 'assets/earth.gif',
                          image: imageUrl,
                        ),
                      );
                    }).toList(),
                  ),
                ),
              );
  }

  Widget Mutiple_image_button() {
    var pading_r_l_t = EdgeInsets.only(right: 30, left: 30, top: 10);
    return Padding(
      padding: pading_r_l_t,
      child: InkWell(
        onTap: pickImages,
        child: Container(
          alignment: Alignment.center,
          height: MediaQuery.of(context).size.height * 0.07,
          width: double.infinity,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              color: Color.fromARGB(255, 47, 22, 157)),
          child: Text(
            'Mutiple Image *',
            style: TextStyle(
                fontWeight: FontWeight.bold, fontSize: 16, color: Colors.white),
          ),
        ),
      ),
    );
  }

  Future<void> pickImages() async {
    List<Asset> resultList = [];
    try {
      resultList = await MultiImagePicker.pickImages(
        maxImages: 4,
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

  Widget Remark() {
    var pading_r_l_t = EdgeInsets.only(right: 30, left: 30, top: 10);
    return Padding(
      padding: pading_r_l_t,
      child: Expanded(
        child: TextFormField(
          controller: _remark,
          style: TextStyle(
            fontSize: MediaQuery.of(context).size.height * 0.015,
            fontWeight: FontWeight.bold,
          ),
          onChanged: (value) {
            setState(() {
              requestModelbuildng.executive_remarks = value;
              requestModelbuildng.executive_remarks = _remark!.text;
            });
          },
          decoration: InputDecoration(
            contentPadding: EdgeInsets.symmetric(vertical: 8),
            prefixIcon: Icon(
              Icons.feed_outlined,
              color: kImageColor,
            ),
            hintText: 'Remark',
            fillColor: kwhite,
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
      ),
    );
  }

  List approvals_list = [];
  String? approvals;
  Widget dropdown_approvals() {
    var pading_r_l_t = EdgeInsets.only(right: 30, left: 30, top: 10);
    return Padding(
      padding: pading_r_l_t,
      child: Container(
        child: DropdownButtonFormField<String>(
          isExpanded: true,
          //value: genderValue,
          onChanged: (newValue) {
            setState(() {
              requestModelbuildng.executive_app =
                  int.parse(newValue.toString());
              print(newValue.toString());
            });
          },
          value: approvals,
          items: approvals_list
              .map<DropdownMenuItem<String>>(
                (value) => DropdownMenuItem<String>(
                  value: value["appstatus_id"].toString(),
                  child: Text(
                    value["appstatus_name"].toString(),
                    style: TextStyle(
                        fontSize: MediaQuery.textScaleFactorOf(context) * 13,
                        height: 0.1),
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
            labelText: 'Approvals',
            // hintText: '${requestModelbuildng.executive_road_type_id}',
            prefixIcon: Icon(
              Icons.app_registration_sharp,
              color: kImageColor,
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: kPrimaryColor, width: 2.0),
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
    );
  }

  Widget dropdown_(list) {
    var pading_r_l_t = EdgeInsets.only(right: 30, left: 30, top: 10);
    return Padding(
      padding: pading_r_l_t,
      child: Container(
        child: DropdownButtonFormField<String>(
          isExpanded: true,
          //value: genderValue,
          onChanged: (newValue) {
            setState(() {
              requestModelbuildng.executive_road_type_id =
                  int.parse(newValue.toString());
            });
          },
          value: Raod_id,
          items: list
              .map<DropdownMenuItem<String>>(
                (value) => DropdownMenuItem<String>(
                  value: value["road_id"].toString(),
                  child: Text(
                    value["road_name"].toString(),
                    style: TextStyle(
                        fontSize: MediaQuery.textScaleFactorOf(context) * 13,
                        height: 0.1),
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
            labelText: '${widget.list[index_i]['road_name'].toString()}',
            // hintText: '${requestModelbuildng.executive_road_type_id}',
            prefixIcon: Icon(
              Icons.app_registration_sharp,
              color: kImageColor,
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: kPrimaryColor, width: 2.0),
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
    );
  }

  Widget Appraiser_add() {
    var pading_r_l_t = EdgeInsets.only(right: 30, left: 30, top: 10);
    return Padding(
      padding: pading_r_l_t,
      child: InkWell(
        onTap: () {
          _asyncInputDialog(context, '');
          ++i;
        },
        child: Container(
          width: MediaQuery.of(context).size.width * 0.8,
          height: 40,
          decoration: BoxDecoration(
              border: Border(),
              boxShadow: [
                BoxShadow(
                    blurRadius: 2,
                    color: Color.fromARGB(160, 0, 0, 0),
                    offset: Offset(0, 1.5))
              ],
              color: Color.fromARGB(255, 9, 126, 7),
              borderRadius: BorderRadius.circular(30)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Text("land~Building"),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.3,
                child: DefaultTextStyle(
                  style: const TextStyle(
                    fontSize: 18.0,
                    fontFamily: 'Horizon',
                    fontWeight: FontWeight.bold,
                  ),
                  child: AnimatedTextKit(
                    animatedTexts: [
                      RotateAnimatedText('Appraiser *'),
                    ],
                    pause: const Duration(milliseconds: 100),
                    repeatForever: true,
                  ),
                ),
              ),
              GFAnimation(
                controller: controller,
                slidePosition: offsetAnimation,
                type: GFAnimationType.slideTransition,
                child: Icon(
                  Icons.add_circle_outline,
                  color: Colors.white,
                  size: 30,
                  shadows: [Shadow(blurRadius: 5, color: Colors.black)],
                ),
              ),
            ],
          ),
        ),
        // icon: Icon(
        //   Icons.add_circle_outline,
        //   color: Colors.white,
        // ),
      ),
    );
  }

  Widget build_add() {
    var pading_r_l_t = EdgeInsets.only(right: 30, left: 30, top: 10);
    return Padding(
      padding: pading_r_l_t,
      child: InkWell(
        onTap: () {
          _asyncInputDialog(context, 'building');
          ++i;
        },
        child: Container(
          width: MediaQuery.of(context).size.width * 0.8,
          height: 40,
          decoration: BoxDecoration(
              border: Border(),
              boxShadow: [
                BoxShadow(
                    blurRadius: 2,
                    color: Color.fromARGB(160, 0, 0, 0),
                    offset: Offset(0, 1.5))
              ],
              color: Color.fromARGB(255, 9, 126, 7),
              borderRadius: BorderRadius.circular(30)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Text("land~Building"),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.3,
                child: DefaultTextStyle(
                  style: const TextStyle(
                    fontSize: 18.0,
                    fontFamily: 'Horizon',
                    fontWeight: FontWeight.bold,
                  ),
                  child: AnimatedTextKit(
                    animatedTexts: [
                      RotateAnimatedText('Building*'),
                    ],
                    pause: const Duration(milliseconds: 100),
                    repeatForever: true,
                  ),
                ),
              ),
              GFAnimation(
                controller: controller,
                slidePosition: offsetAnimation,
                type: GFAnimationType.slideTransition,
                child: Icon(
                  Icons.add_circle_outline,
                  color: Colors.white,
                  size: 30,
                  shadows: [Shadow(blurRadius: 5, color: Colors.black)],
                ),
              ),
            ],
          ),
        ),
        // icon: Icon(
        //   Icons.add_circle_outline,
        //   color: Colors.white,
        // ),
      ),
    );
  }

  void add_id() async {
    try {
      Map<String, dynamic> payload = {
        'executive_id': int.parse(id_only.toString()),
      };

      final url = Uri.parse(
          'https://www.oneclickonedollar.com/laravel_kfa_2023/public/api/ex_last_id');
      final response = await http.post(
        url,
        headers: {'Content-Type': 'application/json'},
        body: json.encode(payload),
      );

      if (response.statusCode == 200) {
      } else {}
    } catch (error) {}
  }

  Widget list_view(List list, lable) {
    var _Sizebox_h = SizedBox(
      height: 10,
    );
    var pading_r_l_t = EdgeInsets.only(right: 30, left: 30, top: 10);
    var _font = TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: MediaQuery.of(context).size.height * 0.02);
    return Padding(
      padding: pading_r_l_t,
      child: Container(
        decoration: BoxDecoration(border: Border.all(width: 0.7)),
        height: MediaQuery.of(context).size.height * 0.35,
        width: double.infinity,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: list.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                  height: MediaQuery.of(context).size.height * 0.31,
                  width: MediaQuery.of(context).size.width * 0.7,
                  decoration: BoxDecoration(
                      // color: Color.fromARGB(255, 255, 254, 252),
                      border: Border.all(width: 1),
                      borderRadius: BorderRadius.circular(10)),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Spacer(),
                          IconButton(
                              onPressed: () {
                                setState(() {
                                  // requestModelbuildng.building.removeAt(index);
                                  (lable == '1')
                                      ? requestModelbuildng.building
                                          .removeAt(index)
                                      : requestModelbuildng.appriaser
                                          .removeAt(index);
                                });
                              },
                              icon: Icon(
                                Icons.delete,
                                color: Color.fromARGB(255, 166, 37, 28),
                              )),
                        ],
                      ),
                      Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: (lable == '1')
                              ? Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text('Discription'),
                                        _Sizebox_h,
                                        Text('Building Size'),
                                        _Sizebox_h,
                                        Text('Building Price'),
                                        _Sizebox_h,
                                        Text('Price Per Sqm'),
                                      ],
                                    ),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          ': ${(list[index]['building_des'].toString() != 'null') ? list[index]['building_des'].toString() : ''}',
                                          style: _font,
                                        ),
                                        _Sizebox_h,
                                        Text(
                                          ': ${(list[index]['building_size'].toString() != 'null') ? list[index]['building_size'].toString() : ''} sqm',
                                          style: _font,
                                        ),
                                        _Sizebox_h,
                                        Text(
                                          ': ${(list[index]['building_price'].toString() != 'null') ? list[index]['building_price'].toString() : ''} \$',
                                          style: _font,
                                        ),
                                        _Sizebox_h,
                                        Text(
                                          ': ${(list[index]['building_price_per'].toString() != 'null') ? list[index]['building_price_per'].toString() : ''} \$/sqm',
                                          style: _font,
                                        ),
                                      ],
                                    ),
                                  ],
                                )
                              : Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text('Price'),
                                        _Sizebox_h,
                                        Text('Agent Name'),
                                        _Sizebox_h,
                                        Text('Remark'),
                                      ],
                                    ),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          ': ${(list[index]['appraiser_price'].toString() != 'null') ? list[index]['appraiser_price'].toString() : ''} \$',
                                          style: _font,
                                        ),
                                        _Sizebox_h,
                                        Text(
                                          ': ${(list[index]['agenttype_name'].toString() != 'null') ? list[index]['agenttype_name'].toString() : ''}',
                                          style: _font,
                                        ),
                                        _Sizebox_h,
                                        Text(
                                          ': ${(list[index]['appraiser_remark'].toString() != 'null') ? list[index]['appraiser_remark'].toString() : ''}',
                                          style: _font,
                                        ),
                                      ],
                                    ),
                                  ],
                                )),
                    ],
                  )),
            );
          },
        ),
      ),
    );
  }

  List onchage_list = [];
  List onchage_list_ = [];
  int i = 0;
  Future _asyncInputDialog(BuildContext context, name) async {
    return showDialog(
      context: context,
      useSafeArea: false,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          scrollable: true,
          insetPadding: EdgeInsets.only(top: 5, left: 5, right: 5, bottom: 10),
          content: SizedBox(
            height: MediaQuery.of(context).size.height * 0.55,
            width: MediaQuery.of(context).size.height * 0.8,
            child: ((name == 'building'))
                ? LandBuilding_valuaction(
                    // edit_Executive: 'Edit_Executive',

                    id: widget.list[index_i]['executive_id'].toString(),
                    list: requestModelbuildng.building,
                    // list: [],
                    listback: (value) {
                      setState(() {
                        // onchage_list = value;
                        requestModelbuildng.building = value;
                      });
                    },
                  )
                : LandBuilding_Appraiser(
                    id: widget.list[index_i]['executive_id'].toString(),
                    list: requestModelbuildng.appriaser,
                    // list: [],
                    listback: (value) {
                      setState(() {
                        requestModelbuildng.appriaser = value;
                      });
                    },
                  ),
            // child: (name == 'building')
            //     ? Building(context)
            //     : Appraisering(context),
          ),
        );
      },
    );
  }

  List list_building = [];
  void _building() async {
    var rs = await http.get(Uri.parse(
        'https://www.oneclickonedollar.com/laravel_kfa_2023/public/api/list_building/${widget.list[index_i]['executive_id'].toString()}'));
    if (rs.statusCode == 200) {
      var jsonData = jsonDecode(rs.body);
      setState(() {
        list_building = jsonData;
        requestModelbuildng.building = list_building;

        // print(list_building.toString());
      });
    }
  }

  List _agency_list = [];

  Widget container(text, color) {
    return Padding(
      padding: const EdgeInsets.only(left: 10, right: 10),
      child: Container(
        alignment: Alignment.center,
        height: MediaQuery.of(context).size.height * 0.05,
        width: MediaQuery.of(context).size.height * 0.12,
        decoration: (color == 'no_color')
            ? null
            : BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Color.fromARGB(255, 31, 6, 158),
              ),
        child: Text(
          '$text',
          style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: MediaQuery.of(context).size.height * 0.016,
              color: Colors.white),
        ),
      ),
    );
  }

  String? delete_first = 'delect_first';
  List<bool> switchValues = [];
  String? f = 'one';
  String? delete = 'delect';
  Widget _switch(index) {
    f == 'one'
        ? switchValues = List<bool>.generate(
            requestModelbuildng.conparable_map.length, (index) => true)
        : null;
    // (requestModelbuildng.conparable_map.toString() == '[]')
    //     ? requestModelbuildng.conparable_map.removeAt(0)
    //     : null;
    // (list_map_T[index]['comparable_id'].toString() == 'null')
    //     ? requestModelbuildng.conparable_map.removeAt(index)
    //     : null;
    return Switch(
      value: switchValues[index],
      onChanged: (value) {
        setState(() {
          switchValues[index] = value;
          f = 'two';
        });
      },
    );

    // return (requestModelbuildng.conparable_map.toString() == '[]')
    //     ? Text('')
    //     : Switch(
    //         value: switchValues[index],
    //         onChanged: (value) {
    //           setState(() {
    //             switchValues[index] = value;
    //             f = 'two';
    //           });
    //         },
    //       );
  }

  Future<void> post_table(
      propertycomparable_executive_id,
      propertycomparable_com_id,
      propertycomparable_status,
      propertycomparable_created_by,
      propertycomparable_modify_date,
      remember_token) async {
    Map<String, dynamic> payload = await {
      'propertycomparable_executive_id':
          int.parse(propertycomparable_executive_id.toString()),
      'propertycomparable_com_id':
          int.parse(propertycomparable_executive_id.toString()),
      'propertycomparable_status':
          int.parse(propertycomparable_executive_id.toString()),
      'propertycomparable_created_by':
          int.parse(propertycomparable_executive_id.toString()),
      'propertycomparable_modify_date':
          propertycomparable_modify_date.toString(),
      'remember_token': remember_token.toString(),
    };
    final url = await Uri.parse(
        'https://www.oneclickonedollar.com/laravel_kfa_2023/public/api/new_add/table');
    final response = await http.post(
      url,
      headers: {'Content-Type': 'application/json'},
      body: json.encode(payload),
    );

    if (response.statusCode == 200) {
      print('Success new');
      AwesomeDialog(
          context: context,
          animType: AnimType.leftSlide,
          headerAnimationLoop: false,
          dialogType: DialogType.success,
          showCloseIcon: false,
          title: 'Save Successfully',
          autoHide: Duration(seconds: 3),
          onDismissCallback: (type) {
            setState(() {});
            Navigator.pop(context);
          }).show();
    } else {
      print('Error bank new: ${response.reasonPhrase}');
    }
  }
  // void agency() async {
  //   setState(() {});
  //   var rs = await http.get(Uri.parse(
  //       'https://www.oneclickonedollar.com/laravel_kfa_2023/public/api/get_agency'));
  //   if (rs.statusCode == 200) {
  //     var jsonData = jsonDecode(rs.body);
  //     // print(jsonData);
  //     // print(jsonData);

  //     setState(() {
  //       _agency_list = jsonData;

  //       print(_agency_list.toString());
  //     });
  //   }
  // }
  List list_appraiser = [];
  void _appraiser() async {
    var rs = await http.get(Uri.parse(
        'https://www.oneclickonedollar.com/laravel_kfa_2023/public/api/list_Appraiser/${widget.list[index_i]['executive_id'].toString()}'));
    if (rs.statusCode == 200) {
      var jsonData = jsonDecode(rs.body);
      setState(() {
        list_appraiser = jsonData;
        requestModelbuildng.appriaser = list_appraiser;
      });
    }
  }

  void _road() async {
    var rs = await http.get(Uri.parse(
        'https://www.oneclickonedollar.com/laravel_kfa_2023/public/api/raod/name'));
    if (rs.statusCode == 200) {
      var jsonData = jsonDecode(rs.body);
      setState(() {
        raod_name = jsonData;
      });
    }
  }

  // List list_table = [];
  void _table_map() async {
    var rs = await http.get(Uri.parse(
        'https://www.oneclickonedollar.com/laravel_kfa_2023/public/api/excutive/list_map/${widget.list[index_i]['executive_id'].toString()}'));
    if (rs.statusCode == 200) {
      var jsonData = jsonDecode(rs.body);
      setState(() {
        list_map_T = jsonData;
        if (list_map_T.toString() == '[]' ||
            requestModelbuildng.conparable_map.toString() == '[]') {
          list_map_T.removeAt(0);
          requestModelbuildng.conparable_map.removeAt(0);
        } else {
          print('No []');
        }
      });
    }
  }

  void _Customer_name() async {
    var rs = await http.get(Uri.parse(
        'https://www.oneclickonedollar.com/laravel_kfa_2023/public/api/Name_customer'));
    if (rs.statusCode == 200) {
      var jsonData = jsonDecode(rs.body);
      setState(() {
        customer_name = jsonData;
      });
    }
  }

  bool table_bool = false;
  Future<void> _comparable_search_Table() async {
    table_bool = true;
    await Future.wait([
      _list_map_table(),
    ]);
    setState(() {
      table_bool = false;
    });
  }

  List list_map_T = [];
  Future<void> _list_map_table() async {
    var rs = await http.get(Uri.parse(
        'https://www.oneclickonedollar.com/laravel_kfa_2023/public/api/excutive/list_Table/${widget.list[index_i]['executive_id'].toString()}'));
    if (rs.statusCode == 200) {
      var jsonData = jsonDecode(rs.body);
      setState(() {
        requestModelbuildng.conparable_map = jsonData;
        for (int i = 0; i < requestModelbuildng.conparable_map.length; i++) {
          if (requestModelbuildng.conparable_map[i]['propertycomparable_com_id']
                  .toString() ==
              'null') {
            print(list_map_T[i]['propertycomparable_com_id'].toString());
            requestModelbuildng.conparable_map.removeAt(i);
          }
        }
        // requestModelbuildng.conparable_map = customer_name;
      });
    }
  }

  Widget _Text(text, pad) {
    return Padding(
      padding: pad,
      child: Text(
        text,
        style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.black,
            fontSize: MediaQuery.of(context).size.height * 0.025),
      ),
    );
  }

  Widget skc(text1, text2, text3, text4) {
    var _Sizebox_h = SizedBox(
      height: 10,
    );
    var pading_r_l_t = EdgeInsets.only(right: 30, left: 30, top: 10);
    return Padding(
      padding: pading_r_l_t,
      child: Column(
        children: [
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Color.fromARGB(255, 238, 233, 233),
            ),
            height: MediaQuery.of(context).size.height * 0.1,
            width: double.infinity,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(text1),
            ),
          ),
          _Sizebox_h,
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Color.fromARGB(255, 238, 233, 233),
            ),
            height: MediaQuery.of(context).size.height * 0.06,
            width: double.infinity,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(text2),
            ),
          ),
          _Sizebox_h,
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Color.fromARGB(255, 238, 233, 233),
            ),
            height: MediaQuery.of(context).size.height * 0.06,
            width: double.infinity,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(text3),
            ),
          ),
          _Sizebox_h,
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Color.fromARGB(255, 238, 233, 233),
            ),
            height: MediaQuery.of(context).size.height * 0.06,
            width: double.infinity,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(text4),
            ),
          ),
        ],
      ),
    );
  }

  Widget Appraisering(BuildContext) {
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
                  'Appraiser *',
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
                _TextFiled_Input('number', 'Price', ds),
              ],
            ),
          ),
          Padding(
            padding: Size_h,
            child: Row(
              children: [
                _TextFiled_Input('no_number', 'Agent Name', build_size),
              ],
            ),
          ),
          Padding(
            padding: Size_h,
            child: Row(
              children: [
                _TextFiled_Input('no_number', '	Remark', build_price),
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
                    onPressed: () {},
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
        ],
      ),
    );
  }

  Widget _date(contrller, labletext, date) {
    return Expanded(
      child: TextField(
        style: TextStyle(
          fontSize: MediaQuery.of(context).size.height * 0.015,
        ),
        controller: contrller, //editing controller of this TextField
        decoration: InputDecoration(
          prefixIcon: Icon(
            Icons.calendar_today,
            color: kImageColor,
            size: MediaQuery.of(context).size.height * 0.025,
          ), //icon of text field
          labelText: "${labletext}",
          labelStyle: TextStyle(
              fontSize: MediaQuery.of(context).size.height * 0.013,
              fontWeight: FontWeight.bold),
          fillColor: kwhite,
          filled: true,
          focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: kPrimaryColor, width: 2.0),
            borderRadius: BorderRadius.circular(10.0),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
              width: 1,
              color: kPrimaryColor,
            ),
            borderRadius: BorderRadius.circular(10.0),
          ), //label text of field
        ),
        readOnly: true, //set it true, so that user will not able to edit text
        onTap: () async {
          DateTime? pickedDate = await showDatePicker(
              context: context,
              initialDate: DateTime.now(),
              firstDate: DateTime(2000),
              lastDate: DateTime(2101));

          if (pickedDate != null) {
            (date == 'Valuation Date*')
                ? requestModelbuildng.executive_valuation_date =
                    DateFormat('yyyy-MM-dd').format(pickedDate)
                : requestModelbuildng.executive_valuation_issue_date =
                    DateFormat('yyyy-MM-dd').format(pickedDate);

            setState(() {
              (date == 'Valuation Date*')
                  ? contrller.text =
                      requestModelbuildng.executive_valuation_date
                  : contrller.text =
                      requestModelbuildng.executive_valuation_issue_date;
            });
          } else {
            print("Date is not selected");
          }
        },
      ),
    );
  }

  String? _purpose = '';

  Widget _TextFiled_Input(type, lable, _value) {
    return Expanded(
      child: TextFormField(
        controller: (lable == 'Latitude *')
            ? _lat
            : (lable == 'Longitude *')
                ? _log
                : (lable == requestModelbuildng.executive_purpose)
                    ? _executive_purpose
                    : (lable ==
                            widget.list[index_i]['executive_land_price']
                                .toString())
                        ? _executive_land_price
                        : (lable ==
                                widget.list[index_i]['executive_land_price_per']
                                    .toString())
                            ? _executive_land_price_per
                            : (lable == 'Min Price'.toString())
                                ? _executive_market_min
                                : (lable == 'Max Price')
                                    ? _executive_market_max
                                    : (lable == 'Property Name')
                                        ? _executive_property_name
                                        : (lable == 'Obligation')
                                            ? _executive_obligation
                                            : (lable ==
                                                    'Gross Floor Area (GFA)')
                                                ? _executive_building
                                                : (lable == 'Fair Market Value')
                                                    ? _executive_fire
                                                    : (lable ==
                                                            'Forced Sale Value')
                                                        ? _executive_fair
                                                        : (lable ==
                                                                'Fire Insurance Value')
                                                            ? _executive_forced
                                                            : (lable ==
                                                                    widget.list[
                                                                            index_i]
                                                                            [
                                                                            'executive_lon']
                                                                        .toString())
                                                                ? _lat
                                                                : (lable ==
                                                                        widget
                                                                            .list[index_i]['executive_lng']
                                                                            .toString())
                                                                    ? _log
                                                                    : null,
        readOnly: (lable == 'Latitude *')
            ? true
            : (lable == 'Longitude *')
                ? true
                : false,
        keyboardType: (type == 'number') ? TextInputType.number : null,
        style: TextStyle(
          fontSize: MediaQuery.of(context).size.height * 0.015,
          fontWeight: FontWeight.bold,
        ),
        onChanged: (value) {
          setState(() {
            if (lable == requestModelbuildng.executive_purpose) {
              requestModelbuildng.executive_purpose = value;
              requestModelbuildng.executive_purpose = _executive_purpose!.text;
            } else if (lable ==
                widget.list[index_i]['executive_land_price'].toString()) {
              requestModelbuildng.executive_land_price = value;
              requestModelbuildng.executive_land_price =
                  _executive_land_price!.text;
            } else if (lable ==
                widget.list[index_i]['executive_land_price_per'].toString()) {
              requestModelbuildng.executive_land_price_per = value;
              requestModelbuildng.executive_land_price_per =
                  _executive_land_price_per!.text;
            } else if (lable ==
                widget.list[index_i]['executive_market_min'].toString()) {
              requestModelbuildng.executive_market_min = value;
              requestModelbuildng.executive_market_min =
                  _executive_market_min!.text;
            } else if (lable ==
                widget.list[index_i]['executive_market_max'].toString()) {
              requestModelbuildng.executive_market_max = value;
              requestModelbuildng.executive_market_max =
                  _executive_market_max!.text;
            } else if (lable == requestModelbuildng.executive_property_name) {
              requestModelbuildng.executive_property_name = value;
              requestModelbuildng.executive_property_name =
                  _executive_property_name!.text;
            } else if (lable ==
                widget.list[index_i]['executive_obligation'].toString()) {
              requestModelbuildng.executive_obligation = value;
              requestModelbuildng.executive_obligation =
                  _executive_obligation!.text;
            } else if (lable ==
                widget.list[index_i]['executive_building'].toString()) {
              requestModelbuildng.executive_building = value;
              requestModelbuildng.executive_building =
                  _executive_building!.text;
            } else if (lable ==
                widget.list[index_i]['executive_fire'].toString()) {
              requestModelbuildng.executive_fire = value;
              requestModelbuildng.executive_fire = _executive_fire!.text;
            } else if (lable ==
                widget.list[index_i]['executive_fair'].toString()) {
              requestModelbuildng.executive_fair = value;
              requestModelbuildng.executive_fair = _executive_fair!.text;
            } else if (lable ==
                widget.list[index_i]['executive_forced'].toString()) {
              requestModelbuildng.executive_forced = value;
              requestModelbuildng.executive_forced = _executive_forced!.text;
            } else if (lable == 'Latitude *') {
              requestModelbuildng.executive_lon = value;
              requestModelbuildng.executive_lon = _lat!.text;
            } else if (lable == 'Longitude *') {
              requestModelbuildng.executive_lng = value;
              requestModelbuildng.executive_lng = _log!.text;
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
          fillColor: kwhite,
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

  String? customer_id;
  String? property_id;
  String? province_name = '';
  String? province_id;
  String? district_name = '';
  String? district_id;
  String? cummune_name = '';
  String? cummune_id;
  String? address = '';

  String? Zoning;
  Widget _dropdown(_value, _list, lable, text_id, text_name, value_get) {
    return Expanded(
      child: DropdownButtonFormField<String>(
        isExpanded: true,
        //value: genderValue,
        onChanged: (newValue) {
          if (lable == widget.list[index_i]['property_type_name'].toString()) {
            // property_id = newValue;
            requestModelbuildng.executive_property_type_id =
                int.parse(newValue.toString());
          } else if (lable == widget.list[index_i]['zoning_name'].toString()) {
            requestModelbuildng.executive_zone_id =
                int.parse(newValue.toString());
          } else if (lable == '$name_customer') {
            setState(() {
              requestModelbuildng.executive_customer_id =
                  int.parse(newValue.toString());
              // executive_customer_id = newValue;
            });
            // print(requestModelbuildng.executive_customer_id.toString());
            for (int i = 0; i < customer_name.length; i++) {
              if (newValue == customer_name[i]['customer_id'].toString()) {
                province_name = customer_name[i]['provinces_name'].toString();
                district_name = customer_name[i]['district_name'].toString();
                cummune_name = customer_name[i]['commune_name'].toString();
                requestModelbuildng.executive_address =
                    customer_name[i]['customerpropertyaddress'].toString();
                requestModelbuildng.executive_province_id = int.parse(
                    customer_name[i]['customerpropertyprovince'].toString());
                requestModelbuildng.executive_district_id = int.parse(
                    customer_name[i]['customerpropertydistrict'].toString());
                requestModelbuildng.executive_commune_id = int.parse(
                    customer_name[i]['customerpropertycommune'].toString());
              } else {}
            }
          }
        },
        value: value_get,
        items: _list
            .map<DropdownMenuItem<String>>(
              (value) => DropdownMenuItem<String>(
                value: value["$text_id"].toString(),
                child: Form(
                    child: Text(
                  // value["customer_name"].toString(),
                  value['$text_name'].toString(),
                  style: TextStyle(
                      fontSize: MediaQuery.textScaleFactorOf(context) * 8,
                      height: 0.1),
                )),
              ),
            )
            .toList(),
        // add extra sugar..
        icon: Icon(
          Icons.arrow_drop_down,
          color: kImageColor,
        ),

        decoration: InputDecoration(
          labelStyle: (lable == 'Property Type *')
              ? TextStyle(
                  fontSize: MediaQuery.of(context).size.height * 0.012,
                  fontWeight: FontWeight.bold)
              : null,
          fillColor: kwhite,
          filled: true,
          contentPadding: EdgeInsets.symmetric(vertical: 8),
          labelText: lable,
          hintText: lable,
          helperStyle: (lable == 'Property Type *')
              ? TextStyle(
                  fontSize: MediaQuery.of(context).size.height * 0.012,
                  fontWeight: FontWeight.bold)
              : null,
          prefixIcon: Icon(
            Icons.app_registration_sharp,
            color: kImageColor,
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: kPrimaryColor, width: 2.0),
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

  var isSelected;
  Widget data_table(context) {
    return Container(
      // height: MediaQuery.of(context).size.height * 1,
      width: MediaQuery.of(context).size.width * 1,
      padding: EdgeInsets.all(5),
      child: PaginatedDataTable(
        horizontalMargin: 5.0,
        arrowHeadColor: Colors.blueAccent[300],
        columns: [
          DataColumn(
              label: Text(
            'No',
            style: TextStyle(color: Colors.green),
          )),
          DataColumn(
              label: Text(
            'ID',
            style: TextStyle(color: Colors.green),
          )),
          DataColumn(
              label: Text(
            'Action',
            style: TextStyle(color: Colors.green),
          )),
        ],
        dataRowHeight: 50,
        rowsPerPage: on_row,
        onRowsPerPageChanged: (value) {
          setState(() {
            on_row = value!;
          });
        },
        source: new _DataSource([], 1, context, list_comparble),
        // source: new _DataSource(requestModelbuildng.conparable_map,
        //     requestModelbuildng.conparable_map.length, context, list_comparble),
      ),
    );
  }

  int on_row = 10;
  //For List
  String? building_executive_id;
  String? building_size;
  String? building_price;
  String? building_price_per;
  String? building_des;
  List list = [];
  void addItemToList() {
    setState(() {
      list.add({
        "building_executive_id": id_only,
        "building_size": '',
        "building_price": '',
        "building_price_per": '',
        "building_des": '',
      });
      lb.add(
        building_execuactive(int.parse(id_only.toString()), building_size,
            building_price, building_price_per, '', 1, ''),
      );
    });
    //  print(id);
  }
}

// https://www.oneclickonedollar.com/laravel_kfa_2023/public/api/search_comparable/$lat_verbal/$log_verbal?start=${widget.start}&end=${widget.end}
class _DataSource extends DataTableSource {
  final List data;
  final List data1;
  final int count_row;
  final BuildContext context;

  _DataSource(this.data, this.count_row, this.context, this.data1);

  @override
  DataRow? getRow(int index) {
    if (index >= data.length) {
      return null;
    }
    final list_com = data1[index];
    final item = data[index];
    bool isSelected = false;
    return DataRow(
        selected: true,
        color: MaterialStateProperty.resolveWith<Color?>(
          (Set<MaterialState> states) {
            if (states.contains(MaterialState.selected)) {
              return index % 2 == 0
                  ? Color.fromARGB(168, 73, 83, 224)
                  : Colors.white;
            }
            return index % 2 == 0
                ? Color.fromARGB(255, 255, 162, 162)
                : Colors.white;
          },
        ),
        cells: [
          DataCell(
            placeholder: true,
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(
                  '$index',
                  style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
                ),
              ],
            ),
            onTap: () {},
          ),
          // DataCell(
          //   placeholder: true,
          //   Column(
          //     mainAxisAlignment: MainAxisAlignment.spaceAround,
          //     children: [
          //       Text(
          //         '${item['propertycomparable_com_id'].toString()}',
          //         style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
          //       ),
          //     ],
          //   ),
          //   onTap: () {},
          // ),
          DataCell(
            placeholder: true,
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(
                  '${list_com['property_type_name'].toString()}',
                  style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
                ),
              ],
            ),
            onTap: () {},
          ),
          DataCell(
            placeholder: true,
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(
                  '${list_com['comparable_land_total'].toString()}',
                  style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
                ),
              ],
            ),
            onTap: () {},
          ),
          DataCell(
            placeholder: true,
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(
                  '${list_com['comparable_sold_total'].toString()}',
                  style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
                ),
              ],
            ),
            onTap: () {},
          ),
          DataCell(
            placeholder: true,
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(
                  '${list_com['comparable_adding_price'].toString()}',
                  style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
                ),
              ],
            ),
            onTap: () {},
          ),
          DataCell(
            placeholder: true,
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(
                  '${(list_com['comparableaddprice'].toString() == 'null' ? '' : list_com['comparableaddprice'].toString())}',
                  style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
                ),
              ],
            ),
            onTap: () {},
          ),
          DataCell(
            placeholder: true,
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(
                  '${(list_com['comparableboughtprice'].toString() == 'null' ? '' : list_com['comparableboughtprice'].toString())}',
                  style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
                ),
              ],
            ),
            onTap: () {},
          ),
          DataCell(
            placeholder: true,
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(
                  '${list_com['comparable_sold_price'].toString()}',
                  style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
                ),
              ],
            ),
            onTap: () {},
          ),
          DataCell(
            placeholder: true,
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(
                  '${(list_com['provinces_name'].toString() == 'null' ? '' : list_com['provinces_name'].toString())} ${(list_com['district_name'].toString() == 'null' ? '' : list_com['district_name'].toString())} ${(list_com['commune_name'].toString() == 'null' ? '' : list_com['commune_name'].toString())}',
                  style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
                ),
              ],
            ),
            onTap: () {},
          ),
          DataCell(
            placeholder: true,
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(
                  '${list_com['comparable_survey_date'].toString()}',
                  style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
                ),
              ],
            ),
            onTap: () {},
          ),
        ]);
  }

  @override
  int get rowCount => count_row;

  @override
  bool get isRowCountApproximate => false;

  @override
  int get selectedRowCount => 0;
}
