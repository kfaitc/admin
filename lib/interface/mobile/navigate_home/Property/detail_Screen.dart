import 'package:flutter/material.dart';


class Detail_screen extends StatefulWidget {
   Detail_screen({super.key,required this.list_get});
  String? list_get;

  @override
  State<Detail_screen> createState() => _Detail_screenState();
}

class _Detail_screenState extends State<Detail_screen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('detail'),
        
      ),
      body: Column(
        children: [
              Container(
                height: 200,
                width: double.infinity,
                child:  Image.network(widget.list_get.toString(),fit: BoxFit.cover,),
              ),
        ],
      ),
    );
  }
}