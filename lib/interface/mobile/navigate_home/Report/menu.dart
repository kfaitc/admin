// ignore_for_file: prefer_const_constructors_in_immutables

import 'package:flutter/material.dart';
import 'package:kfa_admin/Customs/Contants.dart';
import 'package:kfa_admin/interface/mobile/navigate_home/Report/R_valuation/V_menu.dart';

class MenuReport extends StatefulWidget {
  MenuReport({Key? key, required this.id}) : super(key: key);
  final String id;

  @override
  State<MenuReport> createState() => _MenuReportState();
}

class _MenuReportState extends State<MenuReport> {
  List<Text> option = const [
    Text("Costomer",
        style: TextStyle(
            fontWeight: FontWeight.bold, fontSize: 14, color: Colors.white)),
    Text("Verbal",
        style: TextStyle(
            fontWeight: FontWeight.bold, fontSize: 14, color: Colors.white)),
    Text("Comparable",
        style: TextStyle(
            fontWeight: FontWeight.bold, fontSize: 14, color: Colors.white)),
    Text("Valuation",
        style: TextStyle(
            fontWeight: FontWeight.bold, fontSize: 14, color: Colors.white)),
    Text("Property",
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
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurple[900],
        centerTitle: true,
        title: const Text(
          "Report",
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
                if (i == 3) {
                  Navigator.of(context)
                      .push(MaterialPageRoute(builder: (context) => V_menu()));
                }
              },
              child: Container(
                alignment: Alignment.center,
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height * 0.07,
                margin: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                    color: kImageColor,
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: const [
                      BoxShadow(
                          spreadRadius: 3,
                          blurRadius: 2,
                          color: Colors.black,
                          blurStyle: BlurStyle.outer)
                    ]),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: optionIconList.elementAt(i),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: option.elementAt(i),
                    ),
                  ],
                ),
              ),
            ),
        ],
      ),
    );
  }
}
