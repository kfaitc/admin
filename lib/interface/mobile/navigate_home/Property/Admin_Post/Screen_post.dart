// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, non_constant_identifier_names, no_leading_underscores_for_local_identifiers, await_only_futures, camel_case_types, unused_local_variable, avoid_print, unused_field, avoid_unnecessary_containers, sized_box_for_whitespace

import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';

import '../../../../../Profile/contants.dart';
import '../../../../../model/Property_admin.dart';
import '../../../../../model/models/autoVerbal.dart';
import '../../../../../model/models/login_model.dart';
import '../../../../../model/models/property.dart';

class Screen_post extends StatefulWidget {
  const Screen_post({super.key});
  @override
  State<Screen_post> createState() => _Screen_postState();
}

class _Screen_postState extends State<Screen_post> {
  // final TextEditingController land = TextEditingController();
  // final TextEditingController sqm = TextEditingController();
  // final TextEditingController property = TextEditingController();
  int? propertyTypeId;
  late TextEditingController Contect;
  late Model_Image_ptys_post model_Image_ptys_post;
  late AutoVerbalRequestModel requestModelAuto;
  SaleModelRequest? obj;
  @override
  void initState() {
    super.initState();
    obj = new SaleModelRequest(
      ptySaleId: 0,
      ptySaleImage: 0,
      propertyId: 0,
      ptySalePublic: 0,
      lat: 0,
      logs: 0,
      forSaleUser: 0,
      ptySaleKhan: "",
      address: "",
      land: "",
      sqm: "",
      bed: "",
      bath: "",
      price: "",
    );
    // model_Image_ptys_post = Model_Image_ptys_post(
    //   propertyTypeId: 0,
    //   idImage: 0,
    //   imageName: '',
    //   url: '',
    // );
  }

  var code = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Post for Sale'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 20,
            ),
            SingleChildScrollView(
                child: Column(children: [
              _file != null
                  ? Padding(
                      padding: const EdgeInsets.only(left: 10, right: 10),
                      child: Container(
                        height: 200,
                        width: double.infinity,
                        child: Image.file(
                          File(_file!.path),
                          fit: BoxFit.cover,
                        ),
                      ),
                    )
                  : Padding(
                      padding: const EdgeInsets.only(left: 10, right: 10),
                      child: Container(
                        height: 200,
                        width: double.infinity,
                        child: Image.asset('assets/image.png'),
                      ),
                    ),
              TextButton(
                onPressed: () async {
                  await openImage(ImageSource.gallery);
                  setState(() {
                    _file;
                  });
                },
                child: FractionallySizedBox(
                  widthFactor: 1,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 22, right: 22),
                    child: Container(
                      height: 60,
                      decoration: BoxDecoration(
                        border: Border.all(
                          width: 1,
                          color: Color.fromARGB(255, 7, 79, 138),
                        ),
                        borderRadius: BorderRadius.all(
                          Radius.circular(10),
                        ),
                      ),
                      // padding: EdgeInsets.only(left: 30, right: 30),
                      child: Align(
                          alignment: Alignment.centerLeft,
                          child: Row(
                            children: [
                              SizedBox(width: 10),
                              Icon(
                                Icons.image,
                                color: Color.fromARGB(255, 7, 79, 138),
                              ),
                              SizedBox(width: 10),
                              Text('Upload'),
                            ],
                          )),
                    ),
                  ),
                ),
              ),
              TextButton(
                onPressed: () async {
                  // Navigator.push(context, MaterialPageRoute(builder: (context) {
                  //   return
                  // },));
                },
                child: FractionallySizedBox(
                  widthFactor: 1,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 22, right: 22),
                    child: Container(
                      height: 60,
                      decoration: BoxDecoration(
                        border: Border.all(
                          width: 1,
                          color: Color.fromARGB(255, 7, 79, 138),
                        ),
                        borderRadius: BorderRadius.all(
                          Radius.circular(10),
                        ),
                      ),
                      // padding: EdgeInsets.only(left: 30, right: 30),
                      child: Align(
                          alignment: Alignment.centerLeft,
                          child: Row(
                            children: [
                              SizedBox(width: 10),
                              Icon(
                                Icons.add_home_rounded,
                                color: Color.fromARGB(255, 7, 79, 138),
                              ),
                              SizedBox(width: 10),
                              Text('Address'),
                            ],
                          )),
                    ),
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Row(
                    children: [
                      Container(
                        width: MediaQuery.of(context).size.width * 0.4,
                        child: TextFormField(
                          style: TextStyle(
                              fontSize: 12, fontWeight: FontWeight.bold),

                          keyboardType: TextInputType.number,
                          // controller: controller,
                          onSaved: (newValue) {
                            obj!.land = newValue.toString();
                          },
                          decoration: InputDecoration(
                            fillColor: kwhite,
                            filled: true,
                            labelText: 'land',
                            prefixIcon: Icon(Icons.landscape),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: Color.fromARGB(255, 16, 19, 202),
                                  width: 2.0),
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                width: 1,
                                color: Color.fromARGB(255, 23, 90, 8),
                              ),
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width * 0.4,
                        child: TextFormField(
                          style: TextStyle(
                              fontSize: 12, fontWeight: FontWeight.bold),
                          // controller: sqm,
                          keyboardType: TextInputType.number,
                          // controller: controller,
                          onSaved: (newValue) {
                            obj!.sqm = newValue;
                          },
                          decoration: InputDecoration(
                            fillColor: kwhite,
                            filled: true,
                            labelText: 'sqm',
                            prefixIcon: Icon(Icons.square_foot_outlined),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: Color.fromARGB(255, 16, 19, 202),
                                  width: 2.0),
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                width: 1,
                                color: Color.fromARGB(255, 23, 90, 8),
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
              SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Row(
                    children: [
                      Container(
                        width: MediaQuery.of(context).size.width * 0.4,
                        child: TextFormField(
                          style: TextStyle(
                              fontSize: 12, fontWeight: FontWeight.bold),
                          // controller: land,
                          keyboardType: TextInputType.number,
                          // controller: controller,
                          onSaved: (newValue) {
                            obj!.bed = newValue;
                          },
                          decoration: InputDecoration(
                            fillColor: kwhite,
                            filled: true,
                            labelText: 'bed',
                            prefixIcon: Icon(Icons.bed_outlined),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: Color.fromARGB(255, 16, 19, 202),
                                  width: 2.0),
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                width: 1,
                                color: Color.fromARGB(255, 23, 90, 8),
                              ),
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width * 0.4,
                        child: TextFormField(
                          style: TextStyle(
                              fontSize: 12, fontWeight: FontWeight.bold),
                          // controller: sqm,
                          keyboardType: TextInputType.number,
                          // controller: controller,
                          onSaved: (newValue) {
                            obj!.bath = newValue;
                          },
                          decoration: InputDecoration(
                            fillColor: kwhite,
                            filled: true,
                            labelText: 'bath',
                            prefixIcon: Icon(Icons.bathroom),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: Color.fromARGB(255, 16, 19, 202),
                                  width: 2.0),
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                width: 1,
                                color: Color.fromARGB(255, 23, 90, 8),
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
              SizedBox(
                height: 10,
              ),
              Container(
                margin: EdgeInsets.only(left: 30, right: 30),
                child: TextFormField(
                  style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
                  // controller: land,
                  keyboardType: TextInputType.number,
                  // controller: controller,
                  onChanged: (newValue) {
                    obj!.price = newValue;
                  },
                  decoration: InputDecoration(
                    fillColor: kwhite,
                    filled: true,
                    labelText: 'price',
                    prefixIcon: Icon(Icons.price_change),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                          color: Color.fromARGB(255, 16, 19, 202), width: 2.0),
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        width: 1,
                        color: Color.fromARGB(255, 23, 90, 8),
                      ),
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                margin: EdgeInsets.only(left: 30, right: 30),
                child: TextFormField(
                  style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
                  keyboardType: TextInputType.number,
                  // controller: controller,
                  onSaved: (value) {
                    obj!.propertyId = int.parse(value!);
                  },
                  decoration: InputDecoration(
                    fillColor: kwhite,
                    filled: true,
                    labelText: 'Property_ID',
                    prefixIcon: Icon(Icons.pin_drop_outlined),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                          color: Color.fromARGB(255, 16, 19, 202), width: 2.0),
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        width: 1,
                        color: Color.fromARGB(255, 23, 90, 8),
                      ),
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  ),
                ),
              ),
              TextButton(
                  onPressed: () { 
                    postproperty(obj!);
                    setState(() {
                      uploadt_image(_file!);  
                      print("Save...");                 
                    });
                    //model_Image_ptys_post.imageName = propertyTypeId as String?;
                  },
                  child: Text('Save')
                  )
            ])),
          ],
        ),
      ),
    );
  }

  late File _image;
  final picker = ImagePicker();
  late String base64string;
  XFile? _file;
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
        // _file = imagefile;
        // XFile? imagefile;

        //output /data/user/0/com.example.testapp/cache/image_picker7973898508152261600.jpg
        File? imagefile = File(imagepath); //convert Path to File
        // saveAutoVerbal(imagefile);
        Uint8List imagebytes = await imagefile.readAsBytes(); //convert to bytes
        String base64string =
            base64.encode(imagebytes); //convert bytes to base64 string
        Uint8List decodedbytes = base64.decode(base64string);
        //decode base64 stirng to bytes
        setState(() async {
          _file = imagefile as XFile;
        });
      } else {
        print("No image is selected.");
      }
    } catch (e) {
      print("error while picking file.");
    }
  }

  Future<dynamic> uploadt_image(XFile _image) async {
    var request = await http.MultipartRequest(
        "POST",
        Uri.parse(
            "https://www.oneclickonedollar.com/laravel_kfa_2023/public/api/image_post"));
    Map<String, String> headers = {
      "content-type": "application/json",
      "Connection": "keep-alive",
      "Accept-Encoding": " gzip"
    };
    request.headers.addAll(headers);
    // request.files.add(picture);
    request.fields['image_id'] = code.toString();
    request.files.add(
      await http.MultipartFile.fromPath(
        "image",
        _image.path,
      ),
    );
    var response = await request.send();
    var responseData = await response.stream.toBytes();
    var result = String.fromCharCodes(responseData);
  }
  Future<SaleReponseModel> postproperty(SaleModelRequest requestModel) async {
    final response = await http.post(
        Uri.parse(
            'https://www.oneclickonedollar.com/laravel_kfa_2023/public/api/property_Poster'),
        headers: {
          "Accept": "application/json",
          "Content-Type": "application/x-www-form-urlencoded"
        },
        body: requestModel.toJson()
        );

    if (response.statusCode == 200 || response.statusCode == 422) {
      return SaleReponseModel.fromJson(json.decode(response.body));
    } else if (response.statusCode == 201 || response.statusCode == 401) {
      return SaleReponseModel.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to load Data');
    }
  }
}
