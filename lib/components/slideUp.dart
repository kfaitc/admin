// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, library_private_types_in_public_api, non_constant_identifier_names, use_build_context_synchronously, unnecessary_string_interpolations, prefer_interpolation_to_compose_strings, unused_import, unused_field, unnecessary_new, prefer_collection_literals, prefer_final_fields, unused_element, sized_box_for_whitespace, sort_child_properties_last, avoid_print, unnecessary_brace_in_string_interps

/*
Name: Akshath Jain
Date: 3/18/2019 - 4/26/2021
Purpose: Example app that implements the package: sliding_up_panel
Copyright: © 2021, Akshath Jain. All rights reserved.
Licensing: More information can be found here: https://github.com/akshathjain/sliding_up_panel/blob/master/LICENSE
*/

import 'dart:async';
import 'dart:io';
import 'dart:math';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:circular_menu/circular_menu.dart';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_image_compress/flutter_image_compress.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';

import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:image_gallery_saver/image_gallery_saver.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:kfa_admin/model/models/search_model.dart';

import 'package:location_geocoder/location_geocoder.dart';
import 'package:path_provider/path_provider.dart';
import 'package:screenshot/screenshot.dart';
import 'package:search_map_location/utils/google_search/place.dart';
import 'package:search_map_location/widget/search_widget.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

import 'ToFromDate.dart';
import 'contants.dart';
import 'distance.dart';
import 'landsize.dart';
import 'numDisplay.dart';
import 'road.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

typedef OnChangeCallback = void Function(dynamic value);

class HomePage extends StatefulWidget {
  const HomePage(
      {super.key,
      required this.c_id,
      required this.district,
      required this.commune,
      required this.province,
      required this.log,
      required this.lat});
  final String c_id;
  final OnChangeCallback province;
  final OnChangeCallback district;
  final OnChangeCallback commune;
  final OnChangeCallback log;
  final OnChangeCallback lat;
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String sendAddrress = '';

  final Set<Marker> _marker = new Set();
  var _selectedValue;
  List<String> option = [
    'Residencial',
    'Commercial',
    'Agricultural',
  ];
  GoogleMapController? mapController;

  String? _currentAddress;
  Position? _currentPosition;

  Future<bool> _handleLocationPermission() async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text(
              'Location services are disabled. Please enable the services'),
        ),
      );
      return false;
    }
    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Location permissions are denied')));
        return false;
      }
    }
    if (permission == LocationPermission.deniedForever) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text(
              'Location permissions are permanently denied, we cannot request permissions.')));
      return false;
    }
    return true;
  }

  double? lat1;
  double? log1;

  Future<void> _getCurrentLocation() async {
    Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);

    setState(() {
      mapController!.animateCamera(CameraUpdate.newCameraPosition(
        CameraPosition(
          target: LatLng(position.latitude, position.longitude),
          zoom: 16.0,
        ),
      ));
      lat1 = position.latitude;
      log1 = position.longitude;
      latLng = LatLng(lat1!, log1!);
      _addMarker(latLng);
    });
  }

  double? lat;
  double? log;
  @override
  void initState() {
    _handleLocationPermission();
    _getCurrentLocation();
    super.initState();
  }

  Uint8List? _imageFile;
  LatLng latLng = const LatLng(11.519037, 104.915120);
  CameraPosition? cameraPosition;

  Future<void> _addMarker(LatLng latLng) async {
    Marker newMarker = Marker(
      draggable: true,
      markerId: MarkerId(latLng.toString()),
      position: latLng,
      onDragEnd: (value) {
        latLng = value;
        Find_by_piont(value.latitude, value.longitude);
      },
    );

    setState(() {
      _marker.clear();
      Find_by_piont(latLng.latitude, latLng.longitude);
      // add the new marker to the list of markers
      _marker.add(newMarker);
    });
  }

  var maxSqm1, minSqm1;
  var maxSqm2, minSqm2;

  int num = 0;
  double h = 0;
  static const CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(37.42796133580664, -122.085749655962),
    zoom: 14.4746,
  );
  static const CameraPosition initialCameraPosition =
      CameraPosition(target: LatLng(37.42796, -122.08574), zoom: 24.0);
  Set<Marker> markersList = {};
  late GoogleMapController googleMapController;
  int id = 1;
  Set<Polyline> _polylines = Set<Polyline>();
  List<MapType> style_map = [
    MapType.satellite,
    MapType.normal,
  ];
  TextEditingController Tcon = new TextEditingController();
  int index = 0;
  String? name_of_place;

  GlobalKey<FormState> check = GlobalKey<FormState>();
  var input;
  double? wth;
  double? wth2;
  @override
  Widget build(BuildContext context) {
    var w = MediaQuery.of(context).size.width;
    if (w < 600) {
      wth = w * 0.8;
      wth2 = w * 0.5;
    } else {
      wth = w * 0.5;
      wth2 = w * 0.3;
    }
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue[600],
        centerTitle: true,
        title: const Text("Property Location"),
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(Icons.system_update_tv_rounded)),
      ),
      body: Stack(
        children: [
          SizedBox(
              height: 800,
              child: GoogleMap(
                initialCameraPosition: CameraPosition(target: latLng, zoom: 12),

                // markers: Set.from(_marker),
                zoomGesturesEnabled: true,
                zoomControlsEnabled: false,
                markers: _marker.map((e) => e).toSet(),

                onMapCreated: (GoogleMapController controller) {
                  mapController = controller;
                },
                onCameraMove: (CameraPosition cameraPositiona) {
                  cameraPosition = cameraPositiona; //when map is dragging
                },
                mapType: style_map[index],
                onTap: (argument) {
                  widget.lat(argument.latitude.toString());
                  widget.log(argument.longitude.toString());
                  _addMarker(argument);
                },
              )),
          Container(
            width: wth,
            margin: EdgeInsets.only(right: 70, top: 10),
            padding: EdgeInsets.only(left: 10),
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(30)),
            child: Form(
              key: check,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  SizedBox(
                    width: wth2,
                    child: TextFormField(
                      keyboardType: TextInputType.text,
                      controller: Tcon,
                      onFieldSubmitted: (value) {
                        setState(() {
                          h = 0;
                          input = value;
                          if (num == 0) {
                            Find_Lat_log(value);
                          }
                        });
                      },
                      onChanged: (value) {
                        // name_place.clear();
                        setState(() {
                          input = value;
                          name_place.clear();
                          lg.clear();
                          ln.clear();
                          h = 0;
                          num = 0;
                          get_name_search(value);
                        });
                      },
                      textInputAction: TextInputAction.search,
                      style: TextStyle(fontWeight: FontWeight.bold),
                      decoration: InputDecoration(
                        fillColor: Colors.white,
                        hintText: "Search",
                        border: InputBorder.none,
                        contentPadding: EdgeInsets.only(top: 2),
                        hintStyle: TextStyle(
                          color: Colors.grey[850],
                          fontSize:
                              MediaQuery.of(context).textScaleFactor * 0.04,
                        ),
                      ),
                    ),
                  ),
                  IconButton(
                      // splashRadius: 30,
                      hoverColor: Colors.black,
                      onPressed: () {
                        setState(() {
                          name_place.clear();
                          lg.clear();
                          ln.clear();

                          h = 0;
                          num = 0;
                          Find_Lat_log(input);
                        });
                      },
                      icon: const Icon(
                        Icons.search,
                        size: 30,
                      )),
                  IconButton(
                      onPressed: () {
                        setState(() {
                          _getCurrentLocation();
                        });
                      },
                      icon: Icon(Icons.person_pin_circle_outlined))
                ],
              ),
            ),
          ),
          if (name_place.length >= 1)
            Container(
                height: h,
                color: Colors.white,
                margin: EdgeInsets.only(left: 10, right: 55, top: 60),
                child: ListView.builder(
                    itemCount: name_place.length,
                    itemBuilder: (context, index) {
                      return ListTile(
                        title: InkWell(
                          onTap: () {
                            Tcon;
                            print(name_place[index]);
                            h = 0;
                            Tcon;
                            num =
                                1; // use num for when user click on list search
                            name_of_place != name_place[index].toString();
                            poin_map_by_search(
                                ln[index].toString(), lg[index].toString());
                          },
                          child: Text(
                            name_place[index],
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      );
                    })),
          Positioned(
              right: 10,
              top: 15,
              child: CircleAvatar(
                backgroundColor: Colors.white,
                radius: 21,
                child: IconButton(
                  icon: const Icon(
                    Icons.mp_sharp,
                    color: Color.fromRGBO(0, 184, 212, 1),
                    size: 25,
                  ),
                  onPressed: () {
                    setState(() {
                      if (index < 1) {
                        index = index + 1;
                      } else {
                        index = 0;
                      }
                    });
                  },
                ),
              )),
        ],
      ),
    );
  }

  Future<void> Find_by_piont(double la, double lo) async {
    final response = await http.get(Uri.parse(
        'https://maps.googleapis.com/maps/api/geocode/json?latlng=${la},${lo}&key=AIzaSyAJt0Zghbk3qm_ZClIQOYeUT0AaV5TeOsI'));

    if (response.statusCode == 200) {
      // Successful response
      var jsonResponse = json.decode(response.body);
      var location = jsonResponse['results'][0]['geometry']['location'];
      var lati = location['lat'];
      var longi = location['lng'];
      widget.lat(lati.toString());
      widget.log(longi.toString());
      List ls = jsonResponse['results'];
      List ac;
      bool check_sk = false, check_kn = false;
      for (int j = 0; j < ls.length; j++) {
        ac = jsonResponse['results'][j]['address_components'];
        for (int i = 0; i < ac.length; i++) {
          if (check_kn == false || check_sk == false) {
            if (jsonResponse['results'][j]['address_components'][i]['types']
                    [0] ==
                "political") {
              setState(() {
                check_kn = true;
                district = (jsonResponse['results'][j]['address_components'][i]
                    ['short_name']);
                // Load_khan(district);

                widget.district(jsonResponse['results'][j]['address_components']
                    [i]['short_name']);
              });
            }
            if (jsonResponse['results'][j]['address_components'][i]['types']
                    [0] ==
                "administrative_area_level_3") {
              setState(() {
                check_sk = true;
                commune = (jsonResponse['results'][j]['address_components'][i]
                    ['short_name']);
                // Load_sangkat(commune);
                widget.commune(jsonResponse['results'][j]['address_components']
                    [i]['short_name']);
              });
            }
          }
        }
      }
      final response_rc = await http.get(Uri.parse(
          'https://www.oneclickonedollar.com/laravel_kfa_2023/public/api/map/check_price?Khan_Name=${district.toString()}&Sangkat_Name=${commune.toString()}'));
      var jsonResponse_rc = json.decode(response_rc.body);
      setState(() {
        maxSqm1 = jsonResponse_rc['residential'][0]['Min_Value'].toString();
        minSqm1 = jsonResponse_rc['residential'][0]['Max_Value'].toString();
        maxSqm2 = jsonResponse_rc['commercial'][0]['Min_Value'].toString();
        minSqm2 = jsonResponse_rc['commercial'][0]['Max_Value'].toString();
        AwesomeDialog(
          btnOkOnPress: () {},
          context: context,
          animType: AnimType.leftSlide,
          headerAnimationLoop: false,
          dialogType: DialogType.infoReverse,
          showCloseIcon: false,
          title: "Check price by KFA",
          customHeader: Image.asset(
            'assets/images/new_logo.png',
            filterQuality: FilterQuality.high,
            fit: BoxFit.contain,
          ),
          body: Column(
            children: [
              const Text(
                "Price for commercial",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              Container(
                decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 220, 221, 223),
                  boxShadow: const [
                    BoxShadow(blurRadius: 1, color: Colors.grey)
                  ],
                  border: Border.all(
                    width: 0.2,
                  ),
                  borderRadius: BorderRadius.circular(5),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Row(
                      children: [
                        const Text("Max = ",
                            style: TextStyle(fontWeight: FontWeight.bold)),
                        Text("${maxSqm1}0\$",
                            style: const TextStyle(color: Colors.red))
                      ],
                    ),
                    Row(
                      children: [
                        const Text("Min = ",
                            style: TextStyle(fontWeight: FontWeight.bold)),
                        Text("${minSqm1}0\$",
                            style: const TextStyle(color: Colors.red))
                      ],
                    )
                  ],
                ),
              ),
              const Text(
                "Price for residential",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              Container(
                decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 220, 221, 223),
                  border: Border.all(
                    width: 0.2,
                  ),
                  boxShadow: const [
                    BoxShadow(blurRadius: 1, color: Colors.grey)
                  ],
                  borderRadius: BorderRadius.circular(5),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Row(
                      children: [
                        const Text("Max = ",
                            style: TextStyle(fontWeight: FontWeight.bold)),
                        Text("${maxSqm2}0\$",
                            style: const TextStyle(color: Colors.red))
                      ],
                    ),
                    Row(
                      children: [
                        const Text("Min = ",
                            style: TextStyle(fontWeight: FontWeight.bold)),
                        Text("${minSqm2}0\$",
                            style: const TextStyle(color: Colors.red))
                      ],
                    )
                  ],
                ),
              ),
              Text(
                ' $commune /  $district',
                style:
                    const TextStyle(fontStyle: FontStyle.italic, fontSize: 10),
                overflow: TextOverflow.ellipsis,
              ),
            ],
          ),
        ).show();
      });
      // await Check_price_Area_commercial();
      // ScaffoldMessenger.of(context).showSnackBar(
      //   SnackBar(
      //     action: SnackBarAction(
      //         label: "View",
      //         onPressed: () {
      //           showDialog(
      //             context: context,
      //             builder: (BuildContext context) {
      //               return AlertDialog(
      //                 title: const Text('Delial Image'),
      //                 content: Container(
      //                   height: 200,
      //                   decoration: BoxDecoration(
      //                       image: DecorationImage(
      //                           image: NetworkImage(
      //                               'https://maps.googleapis.com/maps/api/staticmap?center=${lati},${longi}&zoom=20&size=500x500&maptype=hybrid&markers=color:red%7Clabel:K%7C${lati},${longi}&key=AIzaSyAJt0Zghbk3qm_ZClIQOYeUT0AaV5TeOsI'))),
      //                 ),
      //               );
      //             },
      //           );
      //         }),
      //     content: Text(' $commune /  $district'),
      //   ),
      // );
    } else {
      // Error or invalid response
      print(response.statusCode);
    }
  }

  List name_place = [];
  Future<void> Find_Lat_log(var place) async {
    var check_charetor = place.split(',');
    if (check_charetor.length == 1) {
      String url =
          'https://maps.googleapis.com/maps/api/geocode/json?address=${check_charetor[0]}&region=kh&key=AIzaSyAJt0Zghbk3qm_ZClIQOYeUT0AaV5TeOsI';
      final response = await http.get(Uri.parse(url));
      final jsonResponse = json.decode(response.body);
      var location = jsonResponse['results'][0]['geometry']['location'];
      var lati = location['lat'];
      var longi = location['lng'];
      // widget.lat(lati.toString());
      // widget.log(longi.toString());
      latLng = LatLng(lati, longi);
      Marker newMarker = Marker(
        draggable: true,
        markerId: MarkerId(latLng.toString()),
        position: latLng,
        onDragEnd: (value) {
          latLng = value;
          Find_by_piont(value.latitude, value.longitude);
        },
        infoWindow: InfoWindow(title: 'KFA\'s Developer'),
      );
      setState(() {
        _marker.clear();
        Find_by_piont(lati, longi);
        _marker.add(newMarker);
      });

      // print('------------------- $latitude');
      // print('------------------- $longitude');

      mapController?.animateCamera(CameraUpdate.newCameraPosition(
          CameraPosition(target: latLng, zoom: 13)));
      List ls = jsonResponse['results'];
      List ac;
      for (int j = 0; j < ls.length; j++) {
        ac = jsonResponse['results'][j]['address_components'];
        for (int i = 0; i < ac.length; i++) {
          if (jsonResponse['results'][j]['address_components'][i]['types'][0] ==
              "administrative_area_level_3") {
            setState(() {
              // widget.commune(jsonResponse['results'][j]['address_components'][i]
              //     ['short_name']);
              print('Value ');
            });
          }
          if (jsonResponse['results'][j]['address_components'][i]['types'][0] ==
              "administrative_area_level_2") {
            setState(() {
              // widget.district(jsonResponse['results'][j]['address_components']
              //     [i]['short_name']);
            });
          }
        }
      }
    } else {
      final response = await http.get(Uri.parse(
          'https://maps.googleapis.com/maps/api/geocode/json?latlng=${check_charetor[0]},${check_charetor[1]}&key=AIzaSyAJt0Zghbk3qm_ZClIQOYeUT0AaV5TeOsI'));

      // Successful response
      var jsonResponse = json.decode(response.body);
      var location = jsonResponse['results'][0]['geometry']['location'];
      var lati = location['lat'];
      var longi = location['lng'];
      // widget.lat(lati.toString());
      // widget.log(longi.toString());
      latLng = LatLng(lati, longi);
      Marker newMarker = Marker(
        draggable: true,
        markerId: MarkerId(latLng.toString()),
        position: latLng,
        onDragEnd: (value) {
          latLng = value;
          Find_by_piont(value.latitude, value.longitude);
        },
        infoWindow: InfoWindow(title: 'KFA\'s Developer'),
      );
      setState(() {
        _marker.clear();
        Find_by_piont(lati, longi);
        _marker.add(newMarker);
      });

      // print('------------------- $latitude');
      // print('------------------- $longitude');

      mapController?.animateCamera(CameraUpdate.newCameraPosition(
          CameraPosition(target: latLng, zoom: 13)));
      List ls = jsonResponse['results'];
      List ac;
      for (int j = 0; j < ls.length; j++) {
        ac = jsonResponse['results'][j]['address_components'];
        for (int i = 0; i < ac.length; i++) {
          if (jsonResponse['results'][j]['address_components'][i]['types'][0] ==
              "administrative_area_level_3") {
            setState(() {
              // widget.commune(jsonResponse['results'][j]['address_components'][i]
              //     ['short_name']);
            });
          }
          if (jsonResponse['results'][j]['address_components'][i]['types'][0] ==
              "administrative_area_level_2") {
            setState(() {
              // widget.district(jsonResponse['results'][j]['address_components']
              //     [i]['short_name']);
            });
          }
        }
      }
    }
  }

  // ignore: prefer_typing_uninitialized_variables
  var commune, district;

  List list = [];

  final Set<Marker> marker = Set(); //163
  List ln = [];
  List lg = [];
  Future<void> get_name_search(var name) async {
    String url =
        'https://maps.googleapis.com/maps/api/place/textsearch/json?query=${name}&radius=1000&language=km&region=KH&key=AIzaSyAJt0Zghbk3qm_ZClIQOYeUT0AaV5TeOsI&libraries=places';
    final response = await http.get(Uri.parse(url));
    final jsonResponse = json.decode(response.body);
    List ls = jsonResponse['results'];
    List ac;
    for (int j = 0; j < ls.length; j++) {
      // ac = ls[j]['formatted_address'];

      var name = ls[j]['name'].toString();
      var data_lnlg = jsonResponse['results'][j]['geometry']['location'];
      if (h == 0 || h < 250) {
        h += 40;
      }
      lg.add(data_lnlg["lat"]);
      ln.add(data_lnlg["lng"]);
      setState(() {
        name_place.add(name);
      });
    }
  }

  Future<void> poin_map_by_search(var ln, var lg) async {
    final response = await http.get(Uri.parse(
        'https://maps.googleapis.com/maps/api/geocode/json?latlng=${lg},${ln}&key=AIzaSyAJt0Zghbk3qm_ZClIQOYeUT0AaV5TeOsI'));
    var jsonResponse = json.decode(response.body);
    latLng = LatLng(double.parse(lg), double.parse(ln));
    Marker newMarker = Marker(
      draggable: true,
      markerId: MarkerId(latLng.toString()),
      position: latLng,
      onDragEnd: (value) {
        latLng = value;
        Find_by_piont(value.latitude, value.longitude);
      },
      infoWindow: InfoWindow(title: 'KFA\'s Developer'),
    );
    setState(() {
      _marker.clear();
      _marker.add(newMarker);
    });
    mapController?.animateCamera(CameraUpdate.newCameraPosition(
        CameraPosition(target: latLng, zoom: 13)));
    List ls = jsonResponse['results'];
    List ac;
    for (int j = 0; j < ls.length; j++) {
      ac = jsonResponse['results'][j]['address_components'];
      for (int i = 0; i < ac.length; i++) {
        if (jsonResponse['results'][j]['address_components'][i]['types'][0] ==
            "administrative_area_level_3") {
          setState(() {});
        }
        if (jsonResponse['results'][j]['address_components'][i]['types'][0] ==
            "administrative_area_level_2") {
          setState(() {});
        }
      }
    }
  }
}
