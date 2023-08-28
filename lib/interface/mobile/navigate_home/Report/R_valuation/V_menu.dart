// ignore_for_file: prefer_const_constructors_in_immutables

import 'package:flutter/material.dart';
import 'package:getwidget/getwidget.dart';
import 'package:kfa_admin/contants.dart';
import 'package:kfa_admin/interface/mobile/navigate_home/Report/R_valuation/V__year/V_year.dart';

class V_menu extends StatefulWidget {
  V_menu({Key? key}) : super(key: key);

  @override
  State<V_menu> createState() => _V_menuState();
}

class _V_menuState extends State<V_menu> with TickerProviderStateMixin {
  late AnimationController animationController =
      AnimationController(vsync: this, duration: const Duration(seconds: 5));
  List<Text> option = const [
    Text("Valuation Report by Appraiser",
        style: TextStyle(
            fontWeight: FontWeight.bold, fontSize: 14, color: Colors.white)),
    Text("Valuation Report by Year",
        style: TextStyle(
            fontWeight: FontWeight.bold, fontSize: 14, color: Colors.white)),
    Text("Valuation Summary Report by Bank",
        style: TextStyle(
            fontWeight: FontWeight.bold, fontSize: 14, color: Colors.white)),
    Text("Valuation Summary Report by Brand",
        style: TextStyle(
            fontWeight: FontWeight.bold, fontSize: 14, color: Colors.white)),
    Text("Valuation Summary Report by Customer",
        style: TextStyle(
            fontWeight: FontWeight.bold, fontSize: 14, color: Colors.white)),
  ];
  List<Icon> optionIconList = const [
    Icon(Icons.group_rounded, color: Colors.white),
    Icon(Icons.visibility_rounded, color: Colors.white),
    Icon(Icons.compare_rounded, color: Colors.white),
    Icon(Icons.price_change_rounded, color: Colors.white),
    Icon(Icons.view_cozy_rounded, color: Colors.white),
  ];
  @override
  void initState() {
    animationController.forward();
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurple[900],
        centerTitle: true,
        title: const Text(
          "Valuation",
          style: TextStyle(
              fontWeight: FontWeight.bold, fontSize: 25, color: Colors.white),
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          for (int i = 0; i < option.length; i++)
            InkWell(
              onTap: () {
                if (i == 1) {
                  Navigator.of(context)
                      .push(MaterialPageRoute(builder: (context) => v_year()));
                }
              },
              child: Container(
                margin: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: kImageColor,
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: const [
                    BoxShadow(
                      spreadRadius: 3,
                      blurRadius: 2,
                      color: Colors.black,
                      blurStyle: BlurStyle.outer,
                    )
                  ],
                ),
                child: ListTile(
                  horizontalTitleGap: 8,
                  leading: optionIconList[i],
                  style: ListTileStyle.drawer,
                  title: option[i],
                ),
              ),
            ),
        ],
      ),
    );
  }
}
