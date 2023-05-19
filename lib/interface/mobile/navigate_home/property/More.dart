// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, sort_child_properties_last

import 'package:flutter/material.dart';

class More extends StatefulWidget {
  const More({super.key});

  @override
  State<More> createState() => _MoreState();
}

class _MoreState extends State<More> {
  // String dropdownValue = list.first;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("More",style: TextStyle(color: Colors.white,fontSize: 18),),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(left: 10, right: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 10,
              ),
              Text(
                'Bathrooms',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 0, right: 0),
                child: SizedBox(
                  child: Row(
                    children: [
                      Expanded(
                        flex: 2,
                        child: InkWell(
                          onTap: () {
                            print('OnTap');
                          },
                          child: Container(
                            padding: const EdgeInsets.all(2),
                            alignment: Alignment.centerLeft,
                            decoration: BoxDecoration(border: Border.all()),
                            child: Text("Any",
                                style: const TextStyle(fontSize: 12)),
                            height: 25,
                            //color: Colors.blue,
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 2,
                        child: InkWell(
                          onTap: () {
                            print('OnTap');
                          },
                          child: Container(
                            padding: const EdgeInsets.all(2),
                            alignment: Alignment.centerLeft,
                            decoration: BoxDecoration(border: Border.all()),
                            child: Text("1+",
                                style: const TextStyle(fontSize: 12)),
                            height: 25,
                            //color: Colors.blue,
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 2,
                        child: InkWell(
                          onTap: () {
                            print('OnTap');
                          },
                          child: Container(
                            padding: const EdgeInsets.all(2),
                            alignment: Alignment.centerLeft,
                            decoration: BoxDecoration(border: Border.all()),
                            child: Text("2+",
                                style: const TextStyle(fontSize: 12)),
                            height: 25,
                            //color: Colors.blue,
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 2,
                        child: InkWell(
                          onTap: () {
                            print('OnTap');
                          },
                          child: Container(
                            padding: const EdgeInsets.all(2),
                            alignment: Alignment.centerLeft,
                            decoration: BoxDecoration(border: Border.all()),
                            child: Text("3+",
                                style: const TextStyle(fontSize: 12)),
                            height: 25,
                            //color: Colors.blue,
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 2,
                        child: InkWell(
                          onTap: () {
                            print('OnTap');
                          },
                          child: Container(
                            padding: const EdgeInsets.all(2),
                            alignment: Alignment.centerLeft,
                            decoration: BoxDecoration(border: Border.all()),
                            child: Text("4+",
                                style: const TextStyle(fontSize: 12)),
                            height: 25,
                            //color: Colors.blue,
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 2,
                        child: InkWell(
                          onTap: () {
                            print('OnTap');
                          },
                          child: Container(
                            padding: const EdgeInsets.all(2),
                            alignment: Alignment.centerLeft,
                            decoration: BoxDecoration(border: Border.all()),
                            child: Text("5+",
                                style: const TextStyle(fontSize: 12)),
                            height: 25,
                            //color: Colors.blue,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                'Lot Size',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 0, right: 0),
                child: SizedBox(
                  child: Row(
                    children: [
                      Expanded(
                        flex: 2,
                        child: TextFormField(
                          decoration: InputDecoration(
                            labelText: 'Min',
                            hintText: 'Min',
                            border: OutlineInputBorder(),
                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter Min';
                            }
                            return null;
                          },
                          onSaved: (value) {
                            // Do something with the value
                          },
                        ),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Expanded(
                        flex: 2,
                        child: TextFormField(
                          decoration: InputDecoration(
                            labelText: 'Max',
                            hintText: 'Max',
                            border: OutlineInputBorder(),
                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter Max';
                            }
                            return null;
                          },
                          onSaved: (value) {
                            // Do something with the value
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                'Year Built',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 0, right: 0),
                child: SizedBox(
                  child: Row(
                    children: [
                      Expanded(
                        flex: 2,
                        child: TextFormField(
                          decoration: InputDecoration(
                            labelText: 'Min',
                            hintText: 'Min',
                            border: OutlineInputBorder(),
                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter Min';
                            }
                            return null;
                          },
                          onSaved: (value) {
                            // Do something with the value
                          },
                        ),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Expanded(
                        flex: 2,
                        child: TextFormField(
                          decoration: InputDecoration(
                            labelText: 'Max',
                            hintText: 'Max',
                            border: OutlineInputBorder(),
                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter Max';
                            }
                            return null;
                          },
                          onSaved: (value) {
                            // Do something with the value
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                'Location',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 10,
              ),
              Expanded(
                flex: 3,
                child: Container(
                  height: MediaQuery.of(context).size.height * 0.14,
                  width: MediaQuery.of(context).size.width * 0.26,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: DropdownButton<String>(
                      // value: dropdownValue,
                      icon: const Icon(Icons.arrow_circle_down_outlined),
                      elevation: 16,
                      style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 15,
                          color: Colors.black),
                      underline: SizedBox(),
                      // underline: null,
                      onChanged: (String? value) {
                        // This is called when the user selects an item.
                        setState(() {
                          // dropdownValue = value!;
                        });
                      },
                      items: list.map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  List<String> list = <String>[
    'Banteay Meanchey',
    'Siem reap',
    'Phnom penh',
    'Takae'
  ];
}
