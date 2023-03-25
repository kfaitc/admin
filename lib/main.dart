// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter/services.dart';
import 'Auth/login.dart';
<<<<<<< Updated upstream
import 'interface/mobile/navigate_home/AutoVerbal/AutoVerbal.dart';
=======
import 'interface/mobile/navigate_setting/auto/auto_list.dart';
>>>>>>> Stashed changes

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
<<<<<<< Updated upstream
      // home: Show_autoVerbals(),
      home: Login(),
      // home: Show_autoVerbals(),
=======
      home: LoginPage(),
      
>>>>>>> Stashed changes
    );
  }
}
