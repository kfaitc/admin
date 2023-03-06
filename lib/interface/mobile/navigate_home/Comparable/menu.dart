// ignore_for_file: unnecessary_import, implementation_imports, prefer_const_constructors

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

import 'Comparable_list_view.dart';

class MenuComparable extends StatefulWidget {
  const MenuComparable({super.key});

  @override
  State<MenuComparable> createState() => _MenuComparableState();
}

class _MenuComparableState extends State<MenuComparable> {
  List<Text> option = const [
    Text("New Comparable",
        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
    Text("Comparable List",
        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
    Text("Comparable Search",
        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
  ];
  List<Icon> optionIconList = const [
    Icon(Icons.data_saver_on),
    Icon(Icons.list_alt_outlined),
    Icon(Icons.search),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurple[900],
        title: const Text(
          "Comparable",
          style: TextStyle(
              fontWeight: FontWeight.bold, fontSize: 25, color: Colors.white),
        ),
      ),
      body: Container(
        height: MediaQuery.of(context).size.height * 1,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          image: DecorationImage(
              image: ExactAssetImage('assets/images/New_KFA_Logo.png'),
              fit: BoxFit.contain,
              alignment: Alignment.topCenter),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            for (int i = 0; i < option.length; i++)
              InkWell(
                onTap: () {
                  if (i == 1) {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => ComparableList()));
                  }
                },
                child: Container(
                  alignment: Alignment.center,
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height * 0.07,
                  margin: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [
                          Colors.cyan,
                          Colors.indigo,
                        ],
                      ),
                      borderRadius: BorderRadius.circular(20),
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
      ),
    );
  }
}
