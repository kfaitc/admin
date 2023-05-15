// ignore_for_file: prefer_const_constructors_in_immutables

import 'package:flutter/material.dart';
import 'package:kfa_admin/interface/mobile/navigate_home/Verbal/map_in_list_search.dart';

import 'New_Verbal.dart';
import 'Verbal_list.dart';

class MenuVerbal extends StatefulWidget {
  MenuVerbal({Key? key, required this.id}) : super(key: key);
  final String id;

  @override
  State<MenuVerbal> createState() => _MenuVerbalState();
}

class _MenuVerbalState extends State<MenuVerbal> {
  List<Text> option = const [
    Text("New Verbal",
        style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 20,
            color: Color.fromARGB(255, 36, 0, 156))),
    Text("Verbal List",
        style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 20,
            color: Color.fromARGB(255, 36, 0, 156))),
    Text("Map Search Verbal",
        style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 20,
            color: Color.fromARGB(255, 36, 0, 156))),
    // Text("Verbal Search",
    //     style: TextStyle(
    //         fontWeight: FontWeight.bold, fontSize: 20, color: Colors.white)),
  ];
  List<Image> optionIconList = const [
    Image(image: AssetImage('assets/New_verbal.png')),
    Image(image: AssetImage('assets/List_verbal.png')),
    Image(image: AssetImage('assets/List_verbal.png')),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurple[600],
        centerTitle: true,
        title: const Text(
          "Verbal",
          style: TextStyle(
              fontWeight: FontWeight.bold, fontSize: 25, color: Colors.white),
        ),
      ),
      body: Container(
        decoration: BoxDecoration(
          color: Colors.blue[50],
          image: const DecorationImage(
            alignment: Alignment.topCenter,
            image: ExactAssetImage('assets/images/New_KFA_Logo.png'),
            fit: BoxFit.fitWidth,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            for (int i = 0; i < option.length; i++)
              InkWell(
                onTap: () {
                  if (i == 0) {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => New_Veba(
                              id: widget.id,
                            )));
                  }
                  if (i == 1) {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => Verbals_list()));
                  }
                  if (i == 2) {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => Map_List_search(
                              get_commune: (value) {},
                              get_district: (value) {},
                              get_lat: (value) {},
                              get_log: (value) {},
                              get_max1: (value) {},
                              get_max2: (value) {},
                              get_min1: (value) {},
                              get_min2: (value) {},
                              get_province: (value) {},
                            )));
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
                          Color.fromARGB(255, 255, 218, 72),
                          Color.fromARGB(255, 50, 151, 60),
                        ],
                        begin: Alignment.bottomLeft,
                        end: Alignment.topRight,
                      ),
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: const [
                        BoxShadow(
                            spreadRadius: 1.5,
                            blurRadius: 2,
                            color: Color.fromARGB(157, 103, 94, 91),
                            blurStyle: BlurStyle.outer)
                      ]),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(0.0),
                        child: optionIconList.elementAt(i),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(0.0),
                        child: option.elementAt(i),
                      ),
                      SizedBox(
                        width: 20,
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
