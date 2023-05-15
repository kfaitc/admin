// ignore_for_file: prefer_const_constructors
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter/services.dart';
<<<<<<< Updated upstream

import 'Auth/login.dart';
=======
import 'package:kfa_admin/Auth/login.dart';
>>>>>>> Stashed changes

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
<<<<<<< Updated upstream
      //home: Show_autoVerbals(),
      home: Login(),
      // home: CodeTest(check_property: 1, code: (value) {  },)
      //home: AddTest(id: '',),
      //home: Add(id: '',),

      //home: image_test(),
=======
      home: Login(),
>>>>>>> Stashed changes
    );
  }
}
