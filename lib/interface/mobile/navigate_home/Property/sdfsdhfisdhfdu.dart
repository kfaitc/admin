// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, override_on_non_overriding_member, non_constant_identifier_names, annotate_overrides, unnecessary_string_interpolations

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class PPPPPPPPP extends StatefulWidget {
  const PPPPPPPPP({super.key});

  @override
  State<PPPPPPPPP> createState() => _PPPPPPPPPState();
}

class _PPPPPPPPPState extends State<PPPPPPPPP> {
  @override
  var Fruitlist = ['Banteay_Meanchey', 'bb', 'cc', 'dd'];
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: CarouselSlider(
          options: CarouselOptions(
            height: 100,
            autoPlay: true,
            autoPlayInterval: Duration(seconds: 2),
            viewportFraction: 0.4,
            autoPlayAnimationDuration: const Duration(milliseconds: 800),
            enlargeCenterPage: true,
          ),
          items: [
            'assets/images/25_commune/Battambang.jpg',
            'assets/images/25_commune/Bonteaymeanchey.jpg',
            'assets/images/25_commune/KamponChnang.jpg',
            'assets/images/25_commune/KampongThom.jpg',

            ///
            'assets/images/25_commune/kampot.jpg',
            'assets/images/25_commune/Kandal.jpg',
            'assets/images/25_commune/Kep.jpg',
            'assets/images/25_commune/Kracheh.jpg',

            ///
            'assets/images/25_commune/Oudormeanchey.jpg',
            'assets/images/25_commune/PhnomPenh.jpg',
            'assets/images/25_commune/Preah_Vihea.jpg',
            'assets/images/25_commune/PreyVeng.jpeg',

            ///
            'assets/images/25_commune/Rathanakiri.jpg',
            'assets/images/25_commune/Siehanuk.jpg',
            'assets/images/25_commune/Siemreab.jpg',
            'assets/images/25_commune/Steng_Treng.jpg',

            ///
            'assets/images/25_commune/SvangRieng.jpg',
            'assets/images/25_commune/Siehanuk.jpg',
            'assets/images/25_commune/takao.jpg',
            'assets/images/25_commune/tbongKhmom.jpeg',
          ].map((i) {
            return Builder(
              builder: (BuildContext context) {
                return Container(
                    width: MediaQuery.of(context).size.width,
                    margin: EdgeInsets.symmetric(horizontal: 3.0),
                    decoration: BoxDecoration(
                        color: Color.fromARGB(255, 147, 145, 141)),
                    child: Container(
                      width: double.infinity,
                      margin: EdgeInsets.symmetric(horizontal: 2),
                      child: Column(
                        children: [
                          Image.asset(
                            i,
                            width: 60,
                            height: 50,
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          if (i == 'assets/images/25_commune/Oudormeanchey.jpg')
                            Text('${Fruitlist[0]}'),
                          if (i ==
                              'assets/images/Membership/land-plan-construction-ministry.jpg')
                            Text(
                              '${Fruitlist[1]}',
                              style: TextStyle(fontSize: 3),
                            )
                        ],
                      ),
                    ));
              },
            );
          }).toList(),
        ));
  }

  final imageList = [];
}
