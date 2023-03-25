// ignore_for_file: prefer_const_constructors, avoid_print, camel_case_types, non_constant_identifier_names, no_leading_underscores_for_local_identifiers, await_only_futures, unused_field, prefer_const_literals_to_create_immutables, sized_box_for_whitespace, unused_local_variable, unused_element

import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:multi_image_picker/multi_image_picker.dart';


class mutiple extends StatefulWidget {
  const mutiple({super.key});

  @override
  State<mutiple> createState() => _mutipleState();
}

class _mutipleState extends State<mutiple> {
  XFile? _file;
  var property_type_id = 41;
  Future<dynamic> uploadt_image(XFile _image) async {
    var request = await http.MultipartRequest(
        "POST",
        Uri.parse(
            "https://www.oneclickonedollar.com/laravel_kfa_2023/public/api/Image_ptys_post"));
    Map<String, String> headers = {
      "content-type": "application/json",
      "Connection": "keep-alive",
      "Accept-Encoding": " gzip"
    };
    request.headers.addAll(headers);
    // request.files.add(picture);
    request.fields['property_type_id'] = property_type_id.toString();
    request.files.add(
      await http.MultipartFile.fromPath(
        "image_name",
        _image.path,
      ),
    );
    var response = await request.send();
    var responseData = await response.stream.toBytes();
    var result = String.fromCharCodes(responseData);
  }

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

  Future<dynamic> uploadt_image_mutiple(XFile _image) async {
    var request = await http.MultipartRequest(
        "POST",
        Uri.parse(
            "https://www.oneclickonedollar.com/laravel_kfa_2023/public/api/Image_ptys_post"));
    Map<String, String> headers = {
      "content-type": "application/json",
      "Connection": "keep-alive",
      "Accept-Encoding": " gzip"
    };
    request.headers.addAll(headers);
    // request.files.add(picture);
    request.fields['property_type_id'] = property_type_id.toString();
    request.files.add(
      await http.MultipartFile.fromPath(
        "image_name",
        _image.path,
      ),
    );
    var response = await request.send();
    var responseData = await response.stream.toBytes();
    var result = String.fromCharCodes(responseData);
  }

  Future<void> pickImages() async {
    List<Asset> resultList = [];

    try {
      resultList = await MultiImagePicker.pickImages(
        maxImages: 5,
        enableCamera: true,
        selectedAssets: images_mutiple,
        cupertinoOptions: CupertinoOptions(
          selectionFillColor: "#ff11ab",
          selectionStrokeColor: "#000000",
          selectionShadowColor: "#000000",
        ),
        materialOptions: MaterialOptions(
          actionBarColor: "#abcdef",
          actionBarTitle: "Select images",
          allViewTitle: "All Photos",
          useDetailsView: false,
          selectCircleStrokeColor: "#000000",
        ),
      );
    } on Exception catch (e) {
      print(e.toString());
    }

    if (!mounted) return;

    setState(() {
      images_mutiple = resultList;
    });
  }

  List<Asset> images_mutiple = <Asset>[];
  Future<List<Uint8List>> getByteDataList1(List<Asset> assets) async {
    List<Uint8List> byteDataList = [];

    for (Asset asset in assets) {
      ByteData byteData = await asset.getByteData();
      byteDataList.add(byteData.buffer.asUint8List());
    }

    return byteDataList;
  }

  Future<void> postImagesToServer(XFile image_mutiple) async {
    List<Uint8List> byteDataList = await getByteDataList1(images_mutiple);
    var request = await http.MultipartRequest(
        "POST",
        Uri.parse(
            "https://www.oneclickonedollar.com/laravel_kfa_2023/public/api/Image_ptys_post"));
    Map<String, String> headers = {
      "content-type": "application/json",
      "Connection": "keep-alive",
      "Accept-Encoding": " gzip"
    };
    request.headers.addAll(headers);
    // request.files.add(picture);
    request.fields['property_type_id'] = property_type_id.toString();
    request.files.add(
      await http.MultipartFile.fromPath(
        "image_name",
        image_mutiple.path,
      ),
    );
    var response = await request.send();
    var responseData = await response.stream.toBytes();
    var result = String.fromCharCodes(responseData);
  }

  @override
  void initState() {
    // uploadt_image();
    super.initState();
    // postImagesToServer();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          SingleChildScrollView(
              child: Column(children: [
            _file != null
                ? Container(
                    height: 200,
                    width: 300,
                    child: Image.file(File(_file!.path)),
                  )
                : SizedBox(),
            _file == null
                ? TextButton(
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
                              color: Colors.red,
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
                                    Icons.map_sharp,
                                    color: Colors.red,
                                  ),
                                  SizedBox(width: 10),
                                  Text((imagepath == "")
                                      ? 'Choose Photo'
                                      : 'choosed Photo'),
                                ],
                              )),
                        ),
                      ),
                    ),
                  )
                : SizedBox()
          ])),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              color: Color.fromARGB(255, 30, 67, 155),
              height: 100,
              width: double.infinity,
              child: GridView.count(
                crossAxisCount: 3,
                children: List.generate(images_mutiple.length, (index) {
                  Asset asset = images_mutiple[index];
                  return AssetThumb(
                    asset: asset,
                    width: 300,
                    height: 300,
                  );
                }),
              ),
            ),
          ),

          ElevatedButton(
            onPressed: pickImages,
            child: Text('Select Images'),
          ),
          // Container(
          //   height: 200,
          //   width: double.infinity,
          //   color: Colors.red,
          //   child: GridView.count(
          //     crossAxisCount: 3,
          //     children: List.generate(images.length, (index) {
          //       Asset asset = images[index];
          //       return AssetThumb(
          //         asset: asset,
          //         width: 300,
          //         height: 300,
          //       );
          //     }),
          //   ),
          // ),
          // ElevatedButton(
          //   onPressed: () async {
          //     // pickImages();
          //       openImage(ImageSource.gallery);
          //   },
          //   child: Text('Select Images'),
          // ),
          ElevatedButton(
            onPressed: () {
              // await postImagesToServer();
              uploadt_image(_file!);
            },
            child: Text('Submit'),
          ),
          ElevatedButton(
            onPressed: () async {
              // await postImagesToServer();
            },
            child: Text('mutiple'),
          )
        ],
      ),
    );
  }
}
