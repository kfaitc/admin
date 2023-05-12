// ignore_for_file: prefer_const_constructors
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter/services.dart';
import 'package:kfa_admin/search/Search-Verbal-ID%20copy.dart';
import 'Auth/login.dart';
import 'components/code.dart';
import 'components/code_copy.dart';
import 'interface/mobile/navigate_home/AutoVerbal/AutoVerbal.dart';
import 'interface/mobile/navigate_home/AutoVerbal/Setdata.dart';
import 'interface/mobile/navigate_home/AutoVerbal/setdatatest.dart';
import 'interface/mobile/navigate_home/Property/Admin_Post/Screen_post.dart';
import 'interface/mobile/navigate_home/Property/Admin_Post/Search_property.dart';
import 'interface/mobile/navigate_home/Property/search/searchdelegate.dart';
import 'interface/mobile/navigate_setting/auto/auto_list.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
       //home: Show_autoVerbals(),
      home: CodeTest(check_property: 1, code: (value) {  },)
      //home: AddTest(id: '',),
      //home: Add(id: '',),

      //home: image_test(),
    );
  }
}
