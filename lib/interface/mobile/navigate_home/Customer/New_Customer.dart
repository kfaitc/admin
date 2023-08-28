// ignore_for_file: unused_element, unused_local_variable, unused_field, equal_keys_in_map, unnecessary_null_comparison, unused_catch_clause

import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter_image_compress/flutter_image_compress.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:liquid_progress_indicator/liquid_progress_indicator.dart';
import 'package:multi_image_picker/multi_image_picker.dart';
import 'package:path_provider/path_provider.dart';
import '../../../../../Profile/contants.dart';
import '../../../../../components/bank.dart';
import '../../../../../components/date_customer.dart';
import '../../../../../components/first_pay.dart';
import '../../../../../components/property_type.dart';
import '../../../../../components/province.dart';

class new_customer extends StatefulWidget {
  const new_customer({super.key});

  @override
  State<new_customer> createState() => _new_customerState();
}

class _new_customerState extends State<new_customer> {
  TextEditingController start_date = TextEditingController();
  TextEditingController end_date = TextEditingController();
  TextEditingController assigndate = TextEditingController();
  TextEditingController todate = TextEditingController();
  TextEditingController Inspecting_date = TextEditingController();
  TextEditingController _controllerA = TextEditingController();
  TextEditingController _controllerB = TextEditingController();
  TextEditingController _controllerC = TextEditingController();
  TextEditingController _controllerD = TextEditingController();
  @override
  void initState() {
    Gender_dropdown();
    todate.text = "";
    _controllerA.dispose();
    _controllerB.dispose();
    _controllerC.dispose();
    ARF_last_ID();
    Registered_By();
    today_formart();
    _name();

    super.initState();
  }

  void _updateTotal() {
    int a = int.tryParse(_controllerA.text) ?? 0;
    int b = int.tryParse(_controllerB.text) ?? 0;
    int c = int.tryParse(_controllerC.text) ?? 0;
    setState(() {
      customerservicecharge = a.toString();
      var total = a - b - c;
      Total_Fee_dok = total.toString();
      first_payment = b.toString();
      second_payment = c.toString();
      customerservicechargeunpaid = Total_Fee_dok;
      _controllerD = TextEditingController(text: '$total');
    });
  }

  String? ARF_code;
  DateTime? selectedStartDate;
  DateTime? selectedEndDate;
  TextEditingController? _Account_Receivable;
  List mr = [
    {
      'numer_id': 1,
      'type': 'Dr.',
    },
    {
      'numer_id': 2,
      'type': 'Miss.',
    },
    {
      'numer_id': 3,
      'type': 'Mr.',
    },
    {
      'numer_id': 4,
      'type': 'Mrs.',
    }
  ];

  List cases = [
    {
      'numer_id': '1',
      'type': '',
    },
    {
      'numer_id': '2',
      'type': 'private',
    },
    {
      'numer_id': '3',
      'type': 'Bank',
    },
  ];
  List option = const [
    "Contact By",
    "Property Guide Name",
  ];
  List bank = const [
    "Bank Officer Name",
    "Bank Officer Tell",
  ];
  List Instructor = const [
    "Instructor Name",
    "Instructor",
  ];
  String? formattedDate;
  void today_formart() {
    DateTime now = DateTime.now();
    formattedDate = DateFormat('yyyy-MM-dd').format(now);
  }

  void yyy_formart() {
    DateTime now = DateTime.now();
    yyy = DateFormat('yy').format(now);

    ARF_code = 'ARF$yyy';
    ARF_num = ARF_ID_GET;
  }

  String? ARF_num;
  String? yyy;

  String? name_customer;
  String? property_type;
  List<Icon> optionIconList = const [
    Icon(
      Icons.contact_emergency,
      color: kImageColor,
    ),
    Icon(
      Icons.near_me,
      color: kImageColor,
    ),
  ];

  List<Icon> bank_branch = const [
    Icon(
      Icons.account_balance,
      color: kImageColor,
    ),
    Icon(
      Icons.near_me,
      color: kImageColor,
    ),
  ];
  //SELECT * FROM `customer_models` WHERE `customercode`='ARF20-0167';
  String? customergender;
  String? customercode;
  String? customerengname;
  String? customerphones;
  String? customersizeother;
  String? customerBuildSize;
  String? customerprovince_id;
  String? customerdistrict_id;
  String? customercommune_id;
  String? customercontactbys;
  String? customerproperty;
  String? customerpropertyaddress;
  String? customerpropertybankname;
  String? customerpropertybankbranch;
  String? officer_name;
  String? office_tell;
  String? customerservicecharge;
  String? customerservicechargeunpaid;
  String? first_payment;
  String? second_payment;
  String? customerorn;
  String? customerorns;
  String? CustomerInvoice;
  String? CustomerInvoices;
  String? paid_by;
  String? paid_bys;
  String? customerstartdate;
  String? customerenddate;
  String? customerinspectingdate;
  String? customerremark;
  String? customercasefrom;
  String? customerdatetotal;
  String? customervat;
  String? customerassigneddate;
  String? second_date_payment;
  String? date_dayment;
  String? customerregistered;
  String? customerinspectors;
  String? customerinspector;
  String? customerassigned;
  String? customerappraisalname;
  String? accompany;
  String? Instructor_Name;
  String? Instructor_Tel;
  String? customerphoness;
  String? customercontactname;
  void New_Customer() async {
    Map<String, dynamic> payload = await {
      'lat': 0.0,
      'log': 0.0,
      'image_map': 'null',
      'province_map': 'null',
      'district_map': 'null',
      'cummune_map': 'null',
      'customergender': customergender.toString(),
      'customercode': ARF_code.toString(),
      /////?????????????????????????????????????????/////
      'customer_code_num': ARF_ID_GET.toString(),
      /////?????????????????????????????????????????/////
      'customerengname': customerengname.toString(),
      /////?????????????????????????????????????????/////
      'customerkhmname': '',
      //Date
      'customerbirthdate': formattedDate.toString(),
      'customermarital_id': null,

      ///Date
      'customermarital': formattedDate.toString(),
      'customernationally_id': null,
      'customeroccupation_id': null,
      'customerinformationsource_id': null,
      'customerinformationsources': null,
      'customercontactby_id': null,
      'customerphones': customerphoness.toString(),

      /////?????????????????????????????????????????/////
      //***************************** */
      'customervat': (customervat == null) ? null : customervat.toString(),
      /////?????????????????????????????????????????/////
      'customerbankname_id': null,
      'customerbankbranch_id': null,
      'customerbankaccount': null,
      'customerphone': null,
      /////?????????????????????????????????????????/////
      'customercontactbys':
          (customerphones == null) ? null : customerphones.toString(),
      /////?????????????????????????????????????????/////
      'customeremail': null,
      'customeremails': null,
      'customeraddress': null,
      /////?????????????????????????????????????????/////
      'customerpropertyprovince': int.parse(customerprovince_id.toString()),
      'customerpropertydistrict': int.parse(customerdistrict_id.toString()),
      'customerpropertycommune': (customercommune_id != null)
          ? int.parse(customercommune_id.toString())
          : null,
      'customerproperty': int.parse(customerproperty.toString()),

      /////?????????????????????????????????????????/////
      'customercontactname': customercontactname.toString(),
      'customersize': customersizeother.toString(),
      /////?????????????????????????????????????????/////
      'customersizeother': null,
      'customerpropertyaddress': (customerpropertyaddress == null)
          ? null
          : customerpropertyaddress.toString(),
      /////?????????????????????????????????????????/////
      'customerprovince_id': null,
      'customerdistrict_id': null,
      'customercommune_id': null,
      /////?????????????????????????????????????????/////
      'customerregistered': int.parse(customerregistered.toString()),
      /////?????????????????????????????????????????/////
      ///Date
      'customerdate': formattedDate.toString(),
      /////?????????????????????????????????????????/////
      ///// Dok date
      'customerservicecharge': customerservicecharge.toString(),
      /////?????????????????????????????????????????///// /////?????????????????????????????????????????///// /////?????????????????????????????????????????/////
      ///Date*********
      'date_dayment': (date_dayment != null) ? date_dayment.toString() : null,
      'first_payment': null,
      // 'first_payment':
      //     (first_payment != null) ? first_payment.toString() : null,
      'paid_by': (paid_by != null) ? paid_by.toString() : null,
      /////?????????????????????????????????????????/////
      'customerservicechargePaid':
          (first_payment != null) ? first_payment.toString() : null,
      /////?????????????????????????????????????????/////

      ///Date
      'second_date_payment':
          (second_date_payment != null) ? second_date_payment.toString() : null,
      //////**************************************************** */
      'second_payment':
          (second_payment != null) ? second_payment.toString() : null,
      'paid_bys': (paid_bys != null) ? paid_bys.toString() : 0,
      'customerservicechargeunpaid': customerservicechargeunpaid.toString(),
      /////?????????????????????????????????????????/////
      'customerchargeFrom': null,
      'customerappraisalfor': null,
      'customerappraisalfrom': null,
      /////?????????????????????????????????????????/////
      'customerappraisalname': (customerappraisalname != null)
          ? customerappraisalname.toString()
          : null,
      /////?????????????????????????????????????????/////
      'customerappraisaltel': null,
      'customerappraisallandguardname': null,
      'customerappraisallandguardtel': null,
      /////?????????????????????????????????????????/////
      //Date
      'customerstartdate': customerstartdate.toString(),
      'customerenddate': customerenddate.toString(),
      //////
      'customerdatetotal': int.parse(customerdatetotal.toString()),
      /////?????????????????????????????????????????/////
      'customersendto': null,
      'customerpropertyowner': null,
      /////?????????????????????????????????????????/////
      'customerpropertybankname':
          int.parse(customerpropertybankname.toString()),
      'customerpropertybankbranch': (customerpropertybankbranch != null)
          ? int.parse(customerpropertybankbranch.toString())
          : null,
      'customerinspector': (customerinspector != null)
          ? int.parse(customerinspector.toString())
          : null,
      'customerinspectors': (customerinspectors != null)
          ? int.parse(customerinspectors.toString())
          : null,

      ///Date
      'customerinspectingdate': (customerinspectingdate != null)
          ? customerinspectingdate.toString()
          : null,
      ////
      'customerassigned': int.parse(customerassigned.toString()),
      'customerassigneddate': (customerassigneddate != null)
          ? customerassigneddate.toString()
          : null,
      /////?????????????????????????????????????????/////
      'customer_status': 1,
      'customerreference': null,
      'customerreferencename': null,
      'customerreferencephone': null,
      'customerreferred': null,
      /////?????????????????????????????????????????/////
      'customerremark':
          (customerremark != null) ? customerremark.toString() : null,
      'customerorn': (customerorn != null) ? customerorn.toString() : null,
      'customerorns': (customerorns != null) ? customerorns.toString() : null,
      'customerBuildSize': customerBuildSize.toString(),
      'CustomerInvoice':
          (CustomerInvoice != null) ? CustomerInvoice.toString() : null,
      'CustomerInvoices':
          (CustomerInvoices != null) ? CustomerInvoices.toString() : null,
      /////?????????????????????????????????????????/////
      'customerinstructorname': Instructor_Name.toString(),
      'customerinstructortel': Instructor_Tel.toString(),
      /////?????????????????????????????????????????/////
      'customercasefrom': (customercasefrom != null)
          ? int.parse(customercasefrom.toString())
          : null,
      /////?????????????????????????????????????????/////
      'customervaluationbankmame': null,
      'customervaluationbranchname': null,
      'customerreferredtel': null,
      /////?????????????????????????????????????????/////
      'officer_name': (officer_name != null) ? officer_name.toString() : null,
      'office_tell': (office_tell != null) ? office_tell.toString() : null,
      /////?????????????????????????????????????????/////
      'appraiser': null,
      'Unpaid': null,
      'PaidBy': null,
      'accompany': (accompany != null) ? int.parse(accompany.toString()) : null,
      'customer_published': 0,
      'customer_created_by': null,
      'customer_modify_by': null,

      ///Date
      'customer_modify_date': formattedDate.toString(),
    };

    final url = await Uri.parse(
        'https://www.oneclickonedollar.com/laravel_kfa_2023/public/api/new/customer');
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
              ARF_ID();
              Navigator.pop(context);
            });
          }).show();
    } else {
      print('Error New customer:');
    }
  }

  Future<void> _uploadImage_Multiple() async {
    final url = Uri.parse(
        'https://www.oneclickonedollar.com/laravel_kfa_2023/public/api/customer_image');

    final request = http.MultipartRequest('POST', url);
    request.fields['customer_code_num'] = ARF_ID_GET.toString();

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

  String? start_end;
  String? _case;
  String? Property_Guide_Name;
  String? Contact_By;
  String? Total_Fee_;
  String? Total_Fee_dok;
  String? payfirst;

  List _list_Appraiser = [];
  List<File> _images = [];
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

  String? _waiting;
  @override
  Widget build(BuildContext context) {
    var sizefont = TextStyle(
        fontSize: MediaQuery.of(context).size.height * 0.015,
        fontWeight: FontWeight.bold);
    var sizehintext = TextStyle(
        fontSize: MediaQuery.of(context).size.height * 0.013,
        fontWeight: FontWeight.bold);
    var pading = EdgeInsets.only(
      left: 30,
      right: 30,
      bottom: 10,
    );
    var pading_t = EdgeInsets.only(left: 30, right: 30, bottom: 10, top: 10);
    var pading_bt = EdgeInsets.only(left: 30, right: 30);
    var pading_b = EdgeInsets.only(left: 30, right: 30, top: 10);
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.deepPurple[900],
          title: Text('New Comparable'),
          centerTitle: true,
          actions: [
            InkWell(
              onTap: () async {
                // New_Customer();
                if (customergender != null &&
                    customerengname != null &&
                    customersizeother != null &&
                    customerBuildSize != null &&
                    customerpropertybankname != null &&
                    customerstartdate != null &&
                    customerinspector != null &&
                    customerassigned != null &&
                    customerproperty != null &&
                    customerpropertyaddress != null &&
                    customerprovince_id != null &&
                    customerdistrict_id != null &&
                    customerregistered != null &&
                    customerenddate != null &&
                    customerinspectors != null &&
                    _images.length >= 2) {
                  _waiting = 'await';
                  await _uploadImage_Multiple();
                  New_Customer();
                } else {
                  showConfirmationBottomSheet();
                }

                // update_new();
              },
              child: Container(
                alignment: Alignment.center,
                height: MediaQuery.of(context).size.height * 0.05,
                width: MediaQuery.of(context).size.width * 0.2,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Color.fromARGB(255, 32, 167, 8)),
                child: Text(
                  'Save',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ],
        ),
        // Name(customerengname + customergender = )
        body: (_waiting != 'await')
            ? SingleChildScrollView(
                child: Column(
                  children: [
                    Padding(
                      padding: pading_b,
                      child: Row(
                        children: [
                          Expanded(
                            child: DropdownButtonFormField<String>(
                              //value: genderValue,
                              isExpanded: true,
                              onChanged: (newValue) {
                                setState(() {
                                  customergender = newValue.toString();
                                });
                              },
                              items: _list_getnder
                                  .map<DropdownMenuItem<String>>(
                                    (value) => DropdownMenuItem<String>(
                                      value: value["gender_id"].toString(),
                                      child: Text(value["gendername"]),
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
                                labelStyle: sizefont,
                                contentPadding:
                                    EdgeInsets.symmetric(vertical: 8),
                                fillColor: kwhite,
                                filled: true,
                                labelText: 'Gender*',
                                hintText: 'Gender*',
                                prefixIcon: Icon(
                                  Icons.discount_outlined,
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
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Expanded(
                            child: TextFormField(
                              style: TextStyle(
                                  fontSize: MediaQuery.of(context).size.height *
                                      0.015,
                                  fontWeight: FontWeight.bold),
                              onChanged: (value) {
                                setState(() {
                                  customerengname = value.toString();
                                });
                              },
                              decoration: InputDecoration(
                                contentPadding:
                                    EdgeInsets.symmetric(vertical: 8),
                                prefixIcon: Icon(
                                  Icons.person,
                                  color: kImageColor,
                                ),
                                hintText: 'Customer Name*',
                                fillColor: kwhite,
                                filled: true,
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
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    payment_first(
                      controller1: null,
                      controller2: null,
                      OR_N: '$ARF_code-$ARF_ID_GET',
                      hintTexts: 'In Khmer',
                      First_Pay: (value) {},
                      hintText: (value) {},
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    ////////////tver dol ng tel
                    payment_first(
                      controller1: null,
                      controller2: null,
                      OR_N: 'VAT TIN',
                      hintTexts: 'Tel',
                      First_Pay: (value) {
                        setState(() {
                          customerphones = value.toString();
                        });
                      },
                      hintText: (value) {
                        setState(() {
                          customervat = value.toString();
                        });
                      },
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    payment_first(
                      controller1: null,
                      controller2: null,
                      OR_N: 'Building Size *',
                      hintTexts: 'Size *',
                      First_Pay: (value) {
                        setState(() {
                          customersizeother = value.toString();
                        });
                      },
                      hintText: (value) {
                        setState(() {
                          customerBuildSize = value.toString();
                        });
                      },
                    ),

                    (_images.length != 0)
                        ? Padding(
                            padding: const EdgeInsets.only(
                                left: 30, right: 30, top: 10),
                            child: Container(
                              decoration:
                                  BoxDecoration(border: Border.all(width: 2)),
                              height: MediaQuery.of(context).size.height * 0.43,
                              width: double.infinity,
                              child: GridView.count(
                                crossAxisCount: 2,
                                mainAxisSpacing: 10,
                                crossAxisSpacing: 10,
                                children:
                                    List.generate(_images.length, (index) {
                                  return Image.file(
                                    _images[index],
                                    fit: BoxFit.cover,
                                  );
                                }),
                              ),
                            ),
                          )
                        : SizedBox(),
                    SizedBox(
                      height: 10,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 30, left: 30),
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
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                                color: Colors.white),
                          ),
                        ),
                      ),
                    ),

                    for (int i = 0; i < option.length; i++)
                      Padding(
                        padding: pading_b,
                        child: Container(
                          child: TextFormField(
                            style: TextStyle(
                                fontSize:
                                    MediaQuery.of(context).size.height * 0.015,
                                fontWeight: FontWeight.bold),
                            onChanged: (value) {
                              setState(() {
                                if (i == 0) {
                                  customerphoness = value.toString();
                                } else if (i == 1) {
                                  customercontactname = value;
                                }
                              });
                            },
                            decoration: InputDecoration(
                              contentPadding: EdgeInsets.symmetric(vertical: 8),
                              prefixIcon: optionIconList.elementAt(i),
                              hintText: option.elementAt(i).toString(),
                              fillColor: kwhite,
                              filled: true,
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
                            ),
                          ),
                        ),
                      ),

                    SizedBox(
                      height: 10,
                    ),
                    property_hoemtype(
                      hometype: (value) {
                        setState(() {
                          customerproperty = value.toString();
                        });
                      },
                      hometype_lable: property_type,
                    ),
                    Padding(
                      padding: pading,
                      child: Container(
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
                          onChanged: (value) {
                            setState(() {
                              customerpropertyaddress = value.toString();
                            });
                          },
                          maxLines: 3,
                          decoration: InputDecoration.collapsed(
                            hintText: 'Property Location *',
                          ),
                        ),
                      ),
                    ),
                    Province_dropdown(
                      cummone_id0: null,
                      district_id0: null,
                      province_id0: null,
                      provicne_id: (value) {
                        setState(() {
                          customerprovince_id = value.toString();
                        });
                      },
                      cummone_id: (value) {
                        setState(() {
                          customercommune_id = value.toString();
                        });
                      },
                      district_id: (value) {
                        setState(() {
                          customerdistrict_id = value.toString();
                        });
                      },
                    ),
                    Padding(
                      padding: pading_bt,
                      child: Container(
                        child: DropdownButtonFormField<String>(
                          isExpanded: true,
                          //value: genderValue,
                          onChanged: (newValue) {
                            setState(() {
                              customerregistered = newValue.toString();
                            });
                          },
                          value: name_customer,
                          items: _list_Registered_By
                              .map<DropdownMenuItem<String>>(
                                (value) => DropdownMenuItem<String>(
                                  value: value["person_id"].toString(),
                                  child: Text(
                                    value["assiigned_name"],
                                    style: TextStyle(
                                        fontSize: MediaQuery.textScaleFactorOf(
                                                context) *
                                            13,
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
                            labelText: 'Registered By *',
                            hintText: 'Registered By ',
                            prefixIcon: Icon(
                              Icons.app_registration_sharp,
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
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: pading_b,
                      child: Row(
                        children: [
                          Expanded(
                            child: DropdownButtonFormField<String>(
                              isExpanded: true,
                              //value: genderValue,
                              onChanged: (newValue) {
                                setState(() {
                                  customercasefrom = newValue.toString();
                                });
                              },
                              value: _case,
                              items: cases
                                  .map<DropdownMenuItem<String>>(
                                    (value) => DropdownMenuItem<String>(
                                      value: value["numer_id"].toString(),
                                      child: Text(
                                        value["type"].toString(),
                                        style: TextStyle(
                                            fontSize:
                                                MediaQuery.textScaleFactorOf(
                                                        context) *
                                                    13,
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
                                contentPadding:
                                    EdgeInsets.symmetric(vertical: 8),
                                labelText: 'case',
                                hintText: 'case',
                                prefixIcon: Icon(
                                  Icons.app_registration_sharp,
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
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Expanded(
                            child: TextField(
                              style: TextStyle(
                                fontSize:
                                    MediaQuery.of(context).size.height * 0.015,
                              ),
                              controller:
                                  todate, //editing controller of this TextField
                              decoration: InputDecoration(
                                prefixIcon: Icon(
                                  Icons.calendar_today,
                                  color: kImageColor,
                                  size: MediaQuery.of(context).size.height *
                                      0.025,
                                ), //icon of text field
                                labelText: "${formattedDate}",
                                fillColor: kwhite,
                                filled: true,
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
                                ), //label text of field
                              ),
                              readOnly:
                                  true, //set it true, so that user will not able to edit text
                              onTap: () async {
                                DateTime? pickedDate = await showDatePicker(
                                    context: context,
                                    initialDate: DateTime.now(),
                                    firstDate: DateTime(2000),
                                    lastDate: DateTime(2101));

                                if (pickedDate != null) {
                                  formattedDate = DateFormat('yyyy-MM-dd')
                                      .format(pickedDate);

                                  setState(() {
                                    todate.text = formattedDate!;
                                  });
                                } else {
                                  print("Date is not selected");
                                }
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    // Bank
                    BankDropdown(
                      bank: (value) {
                        setState(() {
                          customerpropertybankname = value.toString();
                        });
                      },
                      bankbranch: (value) {
                        setState(() {
                          customerpropertybankbranch = value.toString();
                        });
                      },
                    ),
                    for (int j = 0; j < bank.length; j++)
                      Padding(
                        padding: pading,
                        child: Container(
                          child: TextFormField(
                            style: TextStyle(
                                fontSize:
                                    MediaQuery.of(context).size.height * 0.015,
                                fontWeight: FontWeight.bold),
                            onChanged: (value) {
                              setState(() {
                                if (j == 0) {
                                  officer_name = value.toString();
                                } else if (j == 1) {
                                  office_tell = value.toString();
                                }
                              });
                            },
                            decoration: InputDecoration(
                              contentPadding: EdgeInsets.symmetric(vertical: 8),
                              prefixIcon: bank_branch.elementAt(j),
                              hintText: bank.elementAt(j).toString(),
                              fillColor: kwhite,
                              filled: true,
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
                            ),
                          ),
                        ),
                      ),
                    Padding(
                      padding: pading_bt,
                      child: Row(
                        children: [
                          Expanded(
                            child: TextFormField(
                              keyboardType: TextInputType.number,
                              // controller: _Account_Receivable,
                              style: TextStyle(
                                fontSize:
                                    MediaQuery.of(context).size.height * 0.015,
                                fontWeight: FontWeight.bold,
                              ),
                              onChanged: (value) {
                                setState(() {
                                  _controllerA =
                                      TextEditingController(text: '$value');
                                  _updateTotal();
                                });
                              },
                              decoration: InputDecoration(
                                contentPadding:
                                    EdgeInsets.symmetric(vertical: 8),
                                prefixIcon: Icon(
                                  Icons.feed_outlined,
                                  color: kImageColor,
                                ),
                                hintText: "Total Fee Charge *",
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
                          SizedBox(
                            width: 10,
                          ),
                          Expanded(
                            child: TextFormField(
                              readOnly: true,
                              // controller: _controllerD,
                              style: TextStyle(
                                fontSize:
                                    MediaQuery.of(context).size.height * 0.015,
                                fontWeight: FontWeight.bold,
                              ),
                              decoration: InputDecoration(
                                contentPadding:
                                    EdgeInsets.symmetric(vertical: 8),
                                hintText: (Total_Fee_dok != null)
                                    ? "   $Total_Fee_dok"
                                    : "   Account Receivable (A/R)",
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
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    payment_first(
                      controller1: null,
                      controller2: null,
                      OR_N: 'OR N',
                      hintTexts: 'First pay',
                      First_Pay: (value) {
                        setState(() {
                          payfirst = value;
                          _controllerB = TextEditingController(text: '$value');

                          // Total_Fee_dok = _controllerC.text;
                          _updateTotal();
                        });
                      },
                      hintText: (value) {
                        setState(() {
                          customerorn = value.toString();
                        });
                      },
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    payment_first(
                      controller1: null,
                      controller2: null,
                      OR_N: 'Pain_by',
                      hintTexts: 'Invoice',
                      First_Pay: (value) {
                        setState(() {
                          CustomerInvoice = value.toString();
                        });
                      },
                      hintText: (value) {
                        setState(() {
                          paid_by = value.toString();
                        });
                      },
                    ),
                    //Final Date
                    Date_click(
                      date: (value) {
                        setState(() {
                          date_dayment = value.toString();
                        });
                      },
                    ),
                    payment_first(
                      controller1: null,
                      controller2: null,
                      OR_N: 'OR N',
                      hintTexts: 'Final pay',
                      First_Pay: (value) {
                        setState(() {
                          _controllerC = TextEditingController(text: '$value');
                          _updateTotal();
                        });
                      },
                      hintText: (value) {
                        setState(() {
                          customerorns = value.toString();
                        });
                      },
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    payment_first(
                      controller1: null,
                      controller2: null,
                      OR_N: 'Paid bys',
                      hintTexts: 'Invoice',
                      First_Pay: (value) {
                        setState(() {
                          CustomerInvoices = value.toString();
                        });
                      },
                      hintText: (value) {
                        setState(() {
                          paid_bys = value.toString();
                        });
                      },
                    ),
                    Date_click(
                      date: (value) {
                        setState(() {
                          second_date_payment = value.toString();
                        });
                      },
                    ),
                    payment_first(
                      controller1: null,
                      controller2: null,
                      OR_N: 'Instructor Tell',
                      hintTexts: 'Instructor Name',
                      First_Pay: (value) {
                        setState(() {
                          Instructor_Name = value;
                        });
                      },
                      hintText: (value) {
                        setState(() {
                          Instructor_Tel = value;
                        });
                      },
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: Container(
                            height: MediaQuery.of(context).size.height * 0.08,
                            padding: const EdgeInsets.fromLTRB(30, 0, 5, 0),
                            child: DropdownButtonFormField<String>(
                              isExpanded: true,
                              onChanged: (newValue) {
                                setState(() {
                                  customerappraisalname = newValue.toString();
                                });
                              },
                              validator: (String? value) {
                                if (value?.isEmpty ?? true) {
                                  return 'Please select bank';
                                }
                                return null;
                              },
                              items: _list_appraiser
                                  .map<DropdownMenuItem<String>>(
                                    (value) => DropdownMenuItem<String>(
                                      value: value["person_id"].toString(),
                                      child: Text(
                                        value["Appraiser_name"],
                                        overflow: TextOverflow.ellipsis,
                                        style: TextStyle(
                                            fontSize: MediaQuery.of(context)
                                                    .size
                                                    .height *
                                                0.012,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                  )
                                  .toList(),
                              icon: Icon(
                                Icons.arrow_drop_down,
                                color: kImageColor,
                              ),
                              decoration: InputDecoration(
                                labelStyle: sizefont,
                                fillColor: kwhite,
                                filled: true,
                                contentPadding:
                                    EdgeInsets.symmetric(vertical: 8),
                                labelText: 'Appraiser',
                                hintText: 'Appraiser',
                                prefixIcon: Icon(
                                  Icons.real_estate_agent_outlined,
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
                        ),
                        Expanded(
                          child: Container(
                            height: MediaQuery.of(context).size.height * 0.08,
                            padding: const EdgeInsets.fromLTRB(5, 0, 30, 0),
                            child: DropdownButtonFormField<String>(
                              isExpanded: true,
                              onChanged: (newValue) {
                                setState(() {
                                  accompany = newValue.toString();
                                });
                              },
                              validator: (String? value) {
                                if (value?.isEmpty ?? true) {
                                  return 'Please select bank';
                                }
                                return null;
                              },
                              items: _list_Accompany_by
                                  .map<DropdownMenuItem<String>>(
                                    (value) => DropdownMenuItem<String>(
                                      value: value["person_id"].toString(),
                                      child: Text(
                                        value["Accompany_by_name"],
                                        overflow: TextOverflow.ellipsis,
                                        style: TextStyle(
                                            fontSize: MediaQuery.of(context)
                                                    .size
                                                    .height *
                                                0.012,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                  )
                                  .toList(),
                              icon: Icon(
                                Icons.arrow_drop_down,
                                color: kImageColor,
                              ),
                              decoration: InputDecoration(
                                labelStyle: sizefont,
                                fillColor: kwhite,
                                filled: true,
                                contentPadding:
                                    EdgeInsets.symmetric(vertical: 8),
                                labelText: 'Accompany by',
                                hintText: 'Accompany by',
                                prefixIcon: Icon(
                                  Icons.real_estate_agent_outlined,
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
                        ),
                      ],
                    ),

                    /// Start day and End day
                    Padding(
                      padding: pading,
                      child: Container(
                        height: MediaQuery.of(context).size.height * 0.06,
                        decoration: BoxDecoration(
                            border: Border.all(width: 1),
                            borderRadius: BorderRadius.circular(10)),
                        width: double.infinity,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            children: [
                              Text('End Date*  -  Start Date*  = ',
                                  style: sizefont),
                              Text(
                                  selectedStartDate != null &&
                                          selectedEndDate != null &&
                                          selectedEndDate!
                                                  .difference(
                                                      selectedStartDate!)
                                                  .inDays >=
                                              0
                                      ? ' (${selectedEndDate!.difference(selectedStartDate!).inDays} days)'
                                      : '( ? )',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize:
                                          MediaQuery.of(context).size.height *
                                              0.015,
                                      color: Colors.red)),
                            ],
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: pading,
                      child: Row(
                        children: [
                          Expanded(
                            child: TextField(
                              style: TextStyle(
                                fontSize:
                                    MediaQuery.of(context).size.height * 0.015,
                              ),
                              controller:
                                  start_date, //editing controller of this TextField
                              decoration: InputDecoration(
                                prefixIcon: Icon(
                                  Icons.calendar_today,
                                  color: kImageColor,
                                  size: MediaQuery.of(context).size.height *
                                      0.025,
                                ), //icon of text field
                                labelText: 'Start Date *',
                                // labelText: "${formattedDate}",
                                fillColor: kwhite,
                                filled: true,
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
                                ), //label text of field
                              ),
                              readOnly:
                                  true, //set it true, so that user will not able to edit text
                              onTap: () async {
                                selectedStartDate = await showDatePicker(
                                    context: context,
                                    initialDate: DateTime.now(),
                                    firstDate: DateTime(2000),
                                    lastDate: DateTime(2101));

                                if (selectedStartDate != null) {
                                  customerstartdate = DateFormat('yyyy-MM-dd')
                                      .format(selectedStartDate!);

                                  setState(() {
                                    start_date.text = customerstartdate!;
                                    customerdatetotal = selectedEndDate!
                                        .difference(selectedStartDate!)
                                        .inDays
                                        .toString();
                                  });
                                } else {
                                  print("Date is not selected");
                                }
                                if (selectedEndDate!
                                        .difference(selectedStartDate!)
                                        .inDays <
                                    0) {
                                  AwesomeDialog(
                                    context: context,
                                    dialogType: DialogType.error,
                                    animType: AnimType.rightSlide,
                                    headerAnimationLoop: false,
                                    title: 'Error',
                                    desc: "Please check ",
                                    btnOkOnPress: () {},
                                    btnOkIcon: Icons.cancel,
                                    btnOkColor: Colors.red,
                                  ).show();
                                } else {}
                              },
                            ),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Expanded(
                            child: TextField(
                              style: TextStyle(
                                fontSize:
                                    MediaQuery.of(context).size.height * 0.015,
                              ),
                              controller:
                                  end_date, //editing controller of this TextField
                              decoration: InputDecoration(
                                prefixIcon: Icon(
                                  Icons.calendar_today,
                                  color: kImageColor,
                                  size: MediaQuery.of(context).size.height *
                                      0.025,
                                ), //icon of text field
                                // labelText: "${formattedDate}",
                                labelText: 'End Date *',
                                fillColor: kwhite,
                                filled: true,
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
                                ), //label text of field
                              ),
                              readOnly:
                                  true, //set it true, so that user will not able to edit text
                              onTap: () async {
                                selectedEndDate = await showDatePicker(
                                    context: context,
                                    initialDate: DateTime.now(),
                                    firstDate: DateTime(2000),
                                    lastDate: DateTime(2101));

                                if (selectedEndDate != null) {
                                  customerenddate = DateFormat('yyyy-MM-dd')
                                      .format(selectedEndDate!);

                                  setState(() {
                                    end_date.text = customerenddate!;
                                    customerdatetotal = selectedEndDate!
                                        .difference(selectedStartDate!)
                                        .inDays
                                        .toString();
                                  });
                                } else {
                                  print("Date is not selected");
                                }
                                if (selectedEndDate!
                                        .difference(selectedStartDate!)
                                        .inDays <
                                    0) {
                                  setState(() {
                                    AwesomeDialog(
                                      context: context,
                                      dialogType: DialogType.error,
                                      animType: AnimType.rightSlide,
                                      headerAnimationLoop: false,
                                      title: 'Please Check',
                                      desc:
                                          "You should Input (Start date < End Date)",
                                      btnOkOnPress: () {},
                                      btnOkIcon: Icons.cancel,
                                      btnOkColor: Colors.red,
                                    ).show();
                                  });
                                } else {}
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: Container(
                            padding: const EdgeInsets.fromLTRB(30, 0, 5, 0),
                            child: DropdownButtonFormField<String>(
                              isExpanded: true,
                              onChanged: (newValue) {
                                setState(() {
                                  customerinspector = newValue.toString();
                                });
                              },
                              validator: (String? value) {
                                if (value?.isEmpty ?? true) {
                                  return 'Please select bank';
                                }
                                return null;
                              },
                              items: _list_Inspector
                                  .map<DropdownMenuItem<String>>(
                                    (value) => DropdownMenuItem<String>(
                                      value: value["person_id"].toString(),
                                      child: Text(
                                        value["Inspector_name"],
                                        overflow: TextOverflow.ellipsis,
                                        style: TextStyle(
                                            fontSize: MediaQuery.of(context)
                                                    .size
                                                    .height *
                                                0.012,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                  )
                                  .toList(),
                              icon: Icon(
                                Icons.arrow_drop_down,
                                color: kImageColor,
                              ),
                              decoration: InputDecoration(
                                labelStyle: sizehintext,
                                fillColor: kwhite,
                                filled: true,
                                contentPadding:
                                    EdgeInsets.symmetric(vertical: 8),
                                labelText: 'Inspector Name *',
                                hintText: 'Inspector Name *',
                                prefixIcon: Icon(
                                  Icons.real_estate_agent_outlined,
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
                        ),
                        Expanded(
                          child: Container(
                            padding: const EdgeInsets.fromLTRB(5, 0, 30, 0),
                            child: DropdownButtonFormField<String>(
                              isExpanded: true,
                              onChanged: (newValue) {
                                setState(() {
                                  customerinspectors = newValue.toString();
                                });
                              },
                              validator: (String? value) {
                                if (value?.isEmpty ?? true) {
                                  return 'Please select bank';
                                }
                                return null;
                              },
                              items: _list_Inspectors
                                  .map<DropdownMenuItem<String>>(
                                    (value) => DropdownMenuItem<String>(
                                      value: value["person_id"].toString(),
                                      child: Text(
                                        value["Inspectors_name"],
                                        overflow: TextOverflow.ellipsis,
                                        style: TextStyle(
                                            fontSize: MediaQuery.of(context)
                                                    .size
                                                    .height *
                                                0.012,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                  )
                                  .toList(),
                              icon: Icon(
                                Icons.arrow_drop_down,
                                color: kImageColor,
                              ),
                              decoration: InputDecoration(
                                labelStyle: sizehintext,
                                fillColor: kwhite,
                                filled: true,
                                contentPadding:
                                    EdgeInsets.symmetric(vertical: 8),
                                labelText: 'Inspectors Name *',
                                hintText: 'Inspectors Name *',
                                prefixIcon: Icon(
                                  Icons.real_estate_agent_outlined,
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
                        ),
                      ],
                    ),
                    Padding(
                      padding: pading_t,
                      child: Container(
                        child: TextField(
                          style: TextStyle(
                            fontSize:
                                MediaQuery.of(context).size.height * 0.015,
                          ),
                          controller:
                              Inspecting_date, //editing controller of this TextField
                          decoration: InputDecoration(
                            prefixIcon: Icon(
                              Icons.calendar_today,
                              color: kImageColor,
                              size: MediaQuery.of(context).size.height * 0.025,
                            ), //icon of text field
                            labelText: 'Inspecting Date',
                            // labelText: "${formattedDate}",
                            fillColor: kwhite,
                            filled: true,
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
                            ), //label text of field
                          ),
                          readOnly:
                              true, //set it true, so that user will not able to edit text
                          onTap: () async {
                            DateTime? pickedDate = await showDatePicker(
                                context: context,
                                initialDate: DateTime.now(),
                                firstDate: DateTime(2000),
                                lastDate: DateTime(2101));

                            if (pickedDate != null) {
                              customerinspectingdate =
                                  DateFormat('yyyy-MM-dd').format(pickedDate);

                              setState(() {
                                Inspecting_date.text = customerinspectingdate!;
                              });
                            } else {
                              print("Date is not selected");
                            }
                          },
                        ),
                      ),
                    ),
                    Padding(
                      padding: pading_bt,
                      child: Row(
                        children: [
                          Expanded(
                            child: Container(
                              padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                              child: DropdownButtonFormField<String>(
                                isExpanded: true,
                                onChanged: (newValue) {
                                  setState(() {
                                    customerassigned = newValue.toString();
                                  });
                                },
                                validator: (String? value) {
                                  if (value?.isEmpty ?? true) {
                                    return 'Please select bank';
                                  }
                                  return null;
                                },
                                items: _list_assigned_By
                                    .map<DropdownMenuItem<String>>(
                                      (value) => DropdownMenuItem<String>(
                                        value: value["person_id"].toString(),
                                        child: Text(
                                          value["assiigned_name"],
                                          overflow: TextOverflow.ellipsis,
                                          style: TextStyle(
                                              fontSize: MediaQuery.of(context)
                                                      .size
                                                      .height *
                                                  0.012,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                    )
                                    .toList(),
                                icon: Icon(
                                  Icons.arrow_drop_down,
                                  color: kImageColor,
                                ),
                                decoration: InputDecoration(
                                  labelStyle: sizehintext,
                                  fillColor: kwhite,
                                  filled: true,
                                  contentPadding:
                                      EdgeInsets.symmetric(vertical: 8),
                                  labelText: 'Assigned By*',
                                  hintText: 'Assigned By*',
                                  prefixIcon: Icon(
                                    Icons.real_estate_agent_outlined,
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
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Expanded(
                            child: TextField(
                              style: TextStyle(
                                fontSize:
                                    MediaQuery.of(context).size.height * 0.015,
                              ),
                              controller:
                                  assigndate, //editing controller of this TextField
                              decoration: InputDecoration(
                                prefixIcon: Icon(
                                  Icons.calendar_today,
                                  color: kImageColor,
                                  size: MediaQuery.of(context).size.height *
                                      0.025,
                                ), //icon of text field
                                // labelText: "${formattedDate}",
                                labelText: 'Assigned Date',
                                fillColor: kwhite,
                                filled: true,
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
                                ), //label text of field
                              ),
                              readOnly:
                                  true, //set it true, so that user will not able to edit text
                              onTap: () async {
                                DateTime? pickedDate = await showDatePicker(
                                    context: context,
                                    initialDate: DateTime.now(),
                                    firstDate: DateTime(2000),
                                    lastDate: DateTime(2101));

                                if (pickedDate != null) {
                                  customerassigneddate =
                                      DateFormat('yyyy-MM-dd')
                                          .format(pickedDate);

                                  setState(() {
                                    assigndate.text = customerassigneddate!;
                                  });
                                } else {
                                  print("Date is not selected");
                                }
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: pading_t,
                      child: Container(
                        height: MediaQuery.of(context).size.height * 0.15,
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
                          onChanged: (value) {
                            setState(() {
                              customerremark = value.toString();
                            });
                          },
                          maxLines: 3,
                          decoration: InputDecoration.collapsed(
                            hintText: 'Remark',
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              )
            : LiquidLinearProgressIndicator(
                value: 0.25,
                valueColor:
                    AlwaysStoppedAnimation(Color.fromARGB(255, 53, 33, 207)),
                backgroundColor: Colors.white,
                borderColor: Colors.white,
                borderWidth: 5.0,
                borderRadius: 12.0,
                direction: Axis.vertical,
                center: Text(
                  "Please waiting...!",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: MediaQuery.of(context).size.height * 0.025),
                ),
              ));
  }

  // Image select file
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

  String ARF_ID_GET = '';
  List _ARF_List = [];

  void ARF_last_ID() async {
    var rs = await http.get(Uri.parse(
        'https://www.oneclickonedollar.com/laravel_kfa_2023/public/api/AFR_ID_Get'));
    if (rs.statusCode == 200) {
      var jsonData = jsonDecode(rs.body);
      setState(() {
        _ARF_List = jsonData;
        var _ARF_ID_GET = int.parse(_ARF_List[0]['arf_id'].toString()) + 1;
        ARF_ID_GET = _ARF_ID_GET.toString();
        yyy_formart();
      });
    }
  }

  List _list_getnder = [];
  void Gender_dropdown() async {
    var rs = await http.get(Uri.parse(
        'https://www.oneclickonedollar.com/laravel_kfa_2023/public/api/Gender_model'));
    if (rs.statusCode == 200) {
      var jsonData = jsonDecode(rs.body)['data'];
      setState(() {
        _list_getnder = jsonData;
      });
    }
  }

  void ARF_ID() async {
    Map<String, dynamic> payload = await {
      'arf_id': ARF_ID_GET,
      'customer_status': 1,
    };

    final url = await Uri.parse(
        'https://www.oneclickonedollar.com/laravel_kfa_2023/public/api/AFR_ID');
    final response = await http.post(
      url,
      headers: {'Content-Type': 'application/json'},
      body: json.encode(payload),
    );

    if (response.statusCode == 200) {
      print('Success ARF ID POST');
    } else {
      print('Error Latlog: ${response.reasonPhrase}');
    }
  }

  XFile? _file;
  Uint8List? imagebytes;
  final ImagePicker imgpicker = ImagePicker();
  String imagepath = "";
  dynamic openImage(ImageSource source) async {
    try {
      XFile? pickedFile = await ImagePicker().pickImage(source: source);
      //you can use ImageCourse.camera for Camera capture
      if (pickedFile != null) {
        imagepath = pickedFile.path;
        CroppedFile? cropFile = await ImageCropper()
            .cropImage(sourcePath: pickedFile.path, aspectRatioPresets: [
          CropAspectRatioPreset.original,
          CropAspectRatioPreset.ratio16x9,
          CropAspectRatioPreset.ratio3x2,
          CropAspectRatioPreset.ratio4x3,
          CropAspectRatioPreset.ratio5x3,
          CropAspectRatioPreset.ratio5x4,
          CropAspectRatioPreset.ratio7x5,
          CropAspectRatioPreset.square,
        ], uiSettings: [
          AndroidUiSettings(
              lockAspectRatio: false,
              backgroundColor: Colors.black,
              initAspectRatio: CropAspectRatioPreset.original)
        ]);
        _file = XFile(cropFile!.path);
        imagepath = pickedFile.path;
        File? imagefile = File(imagepath);
        Uint8List imagebytes = await imagefile.readAsBytes();
        String base64string =
            base64.encode(imagebytes); //convert bytes to base64 string
        Uint8List decodedbytes = base64.decode(base64string);
        setState(() {
          _file = imagefile as XFile;
        });
      } else {
        print("No image is selected.");
      }
    } catch (e) {
      print("error while picking file.");
    }
  }

  Future<void> _name() async {
    await Future.wait([
      Registered_By(),
      appraiser(),
      Inspector(),
      Inspectors(),
      assigned_By(),
      Accompany_by()
    ]);
  }

  List _list_Registered_By = [];
  Future<void> Registered_By() async {
    try {
      final response = await http.get(Uri.parse(
          'https://www.oneclickonedollar.com/laravel_kfa_2023/public/api/Registered_By/name'));
      if (response.statusCode == 200) {
        var jsonBody = jsonDecode(response.body)['data'];
        _list_Registered_By = jsonBody;
        setState(() {
          _list_Registered_By;
        });
      } else {
        print('Error bank_dristrict');
      }
    } catch (e) {
      print('Error bank_dristrict $e');
    }
  }

  List _list_appraiser = [];
  Future<void> appraiser() async {
    try {
      final response = await http.get(Uri.parse(
          'https://www.oneclickonedollar.com/laravel_kfa_2023/public/api/appraiser/name'));
      if (response.statusCode == 200) {
        var jsonBody = jsonDecode(response.body)['data'];
        _list_appraiser = jsonBody;
        setState(() {
          _list_appraiser;
        });
      } else {
        print('Error appraiser');
      }
    } catch (e) {
      print('Error bank_dristrict $e');
    }
  }

  List _list_Inspector = [];
  Future<void> Inspector() async {
    try {
      final response = await http.get(Uri.parse(
          'https://www.oneclickonedollar.com/laravel_kfa_2023/public/api/Inspector/name'));
      if (response.statusCode == 200) {
        var jsonBody = jsonDecode(response.body)['data'];
        _list_Inspector = jsonBody;
        setState(() {
          _list_Inspector;
        });
      } else {
        print('Error bank_dristrict');
      }
    } catch (e) {
      print('Error bank_dristrict $e');
    }
  }

  List _list_Inspectors = [];
  Future<void> Inspectors() async {
    try {
      final response = await http.get(Uri.parse(
          'https://www.oneclickonedollar.com/laravel_kfa_2023/public/api/Inspectors/name'));
      if (response.statusCode == 200) {
        var jsonBody = jsonDecode(response.body)['data'];
        _list_Inspectors = jsonBody;
        setState(() {
          _list_Inspectors;
        });
      } else {
        print('Error bank_dristrict');
      }
    } catch (e) {
      print('Error bank_dristrict $e');
    }
  }

  List _list_assigned_By = [];
  Future<void> assigned_By() async {
    try {
      final response = await http.get(Uri.parse(
          'https://www.oneclickonedollar.com/laravel_kfa_2023/public/api/assigned_By/name'));
      if (response.statusCode == 200) {
        var jsonBody = jsonDecode(response.body)['data'];
        _list_assigned_By = jsonBody;
        setState(() {
          _list_assigned_By;
        });
      } else {
        print('Error bank_dristrict');
      }
    } catch (e) {
      print('Error bank_dristrict $e');
    }
  }

  List _list_Accompany_by = [];
  Future<void> Accompany_by() async {
    try {
      final response = await http.get(Uri.parse(
          'https://www.oneclickonedollar.com/laravel_kfa_2023/public/api/Accompany_by/name'));
      if (response.statusCode == 200) {
        var jsonBody = jsonDecode(response.body)['data'];
        _list_Accompany_by = jsonBody;
        setState(() {
          _list_Accompany_by;
        });
      } else {
        print('Error bank_dristrict');
      }
    } catch (e) {
      print('Error bank_dristrict $e');
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
                          (customergender == null)
                              ? Padding(
                                  padding: const EdgeInsets.only(top: 5),
                                  child: Text(
                                    '- Gender*',
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize:
                                            MediaQuery.of(context).size.height *
                                                0.017),
                                  ),
                                )
                              : SizedBox(),
                          (customerengname == null)
                              ? Padding(
                                  padding: const EdgeInsets.only(top: 5),
                                  child: Text(
                                    '- Customer Name*',
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize:
                                            MediaQuery.of(context).size.height *
                                                0.017),
                                  ),
                                )
                              : SizedBox(),
                          (customersizeother == null)
                              ? Padding(
                                  padding: const EdgeInsets.only(top: 5),
                                  child: Text(
                                    '- Size*',
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize:
                                            MediaQuery.of(context).size.height *
                                                0.017),
                                  ),
                                )
                              : SizedBox(),
                          (customerBuildSize == null)
                              ? Padding(
                                  padding: const EdgeInsets.only(top: 5),
                                  child: Text(
                                    '- Building Size*',
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize:
                                            MediaQuery.of(context).size.height *
                                                0.017),
                                  ),
                                )
                              : SizedBox(),
                          (customerpropertybankname == null)
                              ? Padding(
                                  padding: const EdgeInsets.only(top: 5),
                                  child: Text(
                                    '- Bank*',
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize:
                                            MediaQuery.of(context).size.height *
                                                0.017),
                                  ),
                                )
                              : SizedBox(),
                          (customerstartdate == null)
                              ? Padding(
                                  padding: const EdgeInsets.only(top: 5),
                                  child: Text(
                                    '- Start Date*',
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize:
                                            MediaQuery.of(context).size.height *
                                                0.017),
                                  ),
                                )
                              : SizedBox(),
                          (customerinspector == null)
                              ? Padding(
                                  padding: const EdgeInsets.only(top: 5),
                                  child: Text(
                                    '- Inspector Name*',
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize:
                                            MediaQuery.of(context).size.height *
                                                0.017),
                                  ),
                                )
                              : SizedBox(),
                          (customerassigned == null)
                              ? Padding(
                                  padding: const EdgeInsets.only(top: 5),
                                  child: Text(
                                    '- Assigned By*',
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
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          (customerproperty == null)
                              ? Padding(
                                  padding: const EdgeInsets.only(top: 5),
                                  child: Text(
                                    '- Property*',
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize:
                                            MediaQuery.of(context).size.height *
                                                0.017),
                                  ),
                                )
                              : SizedBox(),
                          (customerpropertyaddress == null)
                              ? Padding(
                                  padding: const EdgeInsets.only(top: 5),
                                  child: Text(
                                    '- Property Location*',
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize:
                                            MediaQuery.of(context).size.height *
                                                0.017),
                                  ),
                                )
                              : SizedBox(),
                          (customerprovince_id == null)
                              ? Padding(
                                  padding: const EdgeInsets.only(top: 5),
                                  child: Text(
                                    '- Province*',
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize:
                                            MediaQuery.of(context).size.height *
                                                0.017),
                                  ),
                                )
                              : SizedBox(),
                          (customerdistrict_id == null)
                              ? Text(
                                  '- District*',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize:
                                          MediaQuery.of(context).size.height *
                                              0.017),
                                )
                              : SizedBox(),
                          (customerregistered == null)
                              ? Padding(
                                  padding: const EdgeInsets.only(top: 5),
                                  child: Text(
                                    '- Registered By*',
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize:
                                            MediaQuery.of(context).size.height *
                                                0.017),
                                  ),
                                )
                              : SizedBox(),
                          (customerenddate == null)
                              ? Padding(
                                  padding: const EdgeInsets.only(top: 5),
                                  child: Text(
                                    '- End Date*',
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize:
                                            MediaQuery.of(context).size.height *
                                                0.017),
                                  ),
                                )
                              : SizedBox(),
                          (customerinspectors == null)
                              ? Padding(
                                  padding: const EdgeInsets.only(top: 5),
                                  child: Text(
                                    '- Inspectors Name*',
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize:
                                            MediaQuery.of(context).size.height *
                                                0.017),
                                  ),
                                )
                              : SizedBox(),
                          (_images.length != 0)
                              ? Padding(
                                  padding: const EdgeInsets.only(top: 5),
                                  child: Text(
                                    'image *',
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize:
                                            MediaQuery.of(context).size.height *
                                                0.017),
                                  ),
                                )
                              : SizedBox()
                        ],
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    'Note * : Image should >=2',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: MediaQuery.of(context).size.height * 0.019),
                  )
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
