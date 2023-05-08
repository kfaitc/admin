import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:http/http.dart' as http;
import '../../../../../model/models/search_model.dart';
import '../../../../../model/models/searchprovincemodel.dart';
import '../More.dart';
import '../imageproperty.dart';
import '../mapproperty/search_map.dart';
import '../marker_point_map/model_Test.dart';
import '../List_Property/List_Sale.dart';
import '../naviga_menu.dart/For_Sale.dart';
import '../naviga_menu.dart/Home_type.dart';
import '../naviga_menu.dart/Price.dart';
import '../search/searchdelegate.dart';
import 'Screen_post.dart';

List<String> list1 = <String>[
  'Banteay Meanchey',
  'Siem reap',
  'Phnom penh',
  'Takae'
];
List<String> list = <String>['Sort', 'Price', 'Beds', 'Baths', 'B-Size'];

class SearchProperty extends StatefulWidget {
  const SearchProperty({super.key});

  @override
  State<SearchProperty> createState() => SearchPropertyState();
}

class SearchPropertyState extends State<SearchProperty> {
  List<MarkerId> listMarkerIds = List<MarkerId>.empty(growable: true);
  Map<MarkerId, Marker> markers = <MarkerId, Marker>{};
  String dropdownValue = list.first;
  String dropdownValue1 = list1.first;

  late SearchRequestModel requestModel;
  DataModel? dataModel;
  double? lat, log;
  final List<Marker> _markers = <Marker>[];
  CameraPosition? cameraPosition;
  int num = 0;
  List<MapType> style_map = [
    MapType.hybrid,
    MapType.normal,
  ];
  final ScrollController _scrollController = new ScrollController();
  String? search;
  int index = 0;
  @override
  void initState() {
    Property_Sale();
    //searchProvince(search!);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "Search",
          style: TextStyle(color: Colors.white, fontSize: 18),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: MediaQuery.of(context).size.height * 0.25,
              width: double.infinity,
              child: Search_Map(
                c_id: '',
                commune: (value) {},
                district: (value) {},
                lat: (value) {},
                log: (value) {},
                province: (value) {},
              ),
            ),
            Row(
              children: [
                Expanded(
                  flex: 2,
                  child: Container(
                    height: MediaQuery.of(context).size.height * 0.1,
                    width: MediaQuery.of(context).size.width * 0.4,
                    child: Container(
                      // decoration: BoxDecoration(
                      //   color: Colors.amber,
                      //   border: Border.all()
                      // ),
                      child: SearchDelegate1()
                      ),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Container(
                    height: MediaQuery.of(context).size.height * 0.1,
                    width: MediaQuery.of(context).size.width * 0.15,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: DropdownButton<String>(
                        value: dropdownValue,
                        icon: const Icon(Icons.arrow_circle_down_outlined),
                        elevation: 16,
                        style: const TextStyle(color: Colors.deepPurple),
                        // underline: Container(
                        //   height: 2,
                        //   color: Colors.deepPurpleAccent,
                        // ),
                        onChanged: (String? value) {
                          // This is called when the user selects an item.
                          setState(() {
                            dropdownValue = value!;
                          });
                        },
                        items:
                            list.map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                      ),
                    ),
                  ),
                )
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(''),
                TextButton(
                    onPressed: () {
                      Navigator.push(context, MaterialPageRoute(
                        builder: (context) {
                          return List_Sale();
                        },
                      ));
                    },
                    child: Text('Show all')),
              ],
            ),
            Flexible(
              flex: 7,
              child: ImageProperty(),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(
            builder: (context) {
              return Screen_post();
            },
          ));
        },
        child: Icon(Icons.post_add),
      ),
    );
  }

  List list2_Sale = [];
  void Property_Sale() async {
    var jsonData;
    final response = await http.get(Uri.parse(
        'https://www.oneclickonedollar.com/laravel_kfa_2023/public/api/image_get'));

    if (response.statusCode == 200) {
      jsonData = jsonDecode(response.body);
      list2_Sale = jsonData;
      setState(() {
        list2_Sale;
        print('111111111111111111111${list2_Sale[0]['image'].toString()}');
      });
    }
  }
  //Search province
  List list2_Search = [];
   List Name_Commune=[];
  void Searchtest() async {
    var jsonData;
    final response = await http.get(Uri.parse(
        'https://www.oneclickonedollar.com/laravel_kfa_2023/public/api/Commune_25_all'));

    if (response.statusCode == 200) {
      jsonData = jsonDecode(response.body)['data'];
      list2_Search = jsonData;
      setState(() {
        list2_Search;
        for(int i=0;i<list2_Search.length;i++){
          Name_Commune.add(list2_Search[i]['Name_cummune'].toString());
        }
        print('111111111111111111111${list2_Search[0]['Name_cummune'].toString()}');
      });
    }
  }
}
List searchpro = [];
Future<List<DataModel>> searchProvince(String query) async {
  final response = await http.get(Uri.parse('https://www.oneclickonedollar.com/laravel_kfa_2023/public/api/Commune_25/khet/search?province=$query'));
  if (response.statusCode == 200) {
    final List<dynamic> data = jsonDecode(response.body)['data'];
    searchpro = data;
    return data.map((e) => DataModel.fromJson(e)).toList();
  } else {
    throw Exception('Failed to load data');
  }
}
class StackReusable extends StatelessWidget {
  final imagere;
  final pricere;
  final sizere;
  const StackReusable({
    required this.imagere,
    required this.pricere,
    required this.sizere,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(2.0),
      child: Stack(
        children: [
          Container(
            height: 10,
            width: 100,
          ),
          Container(
            color: Colors.blue,
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child: Image.asset(
              '$imagere',
              fit: BoxFit.cover,
            ),
          ),
         Positioned(  
                  top: 5,  
                  left: 0,  
                  child: Container(  
      height: 30,  
      width: 85,  
      color: Colors.purple,  
      child: const Center(  
        child: Text(  
          'FOR SALE',  
          style: TextStyle(color: Colors.white, fontSize: 10,fontWeight: FontWeight.bold),  
        ),  
      ),  
                  ),  
                ),  
                 Positioned(  
                  bottom: 20,  
                  right: 0,  
                  child: SizedBox(  
      child:  Center(  
        child: Text(  
          '$pricere dollar',  
          style: const TextStyle(color: Colors.white, fontSize: 10,fontWeight: FontWeight.bold),  
        ),  
      ),  
                  ),  
                ), 
      Positioned(  
      bottom: 0,  
      left: 0,  
      child: SizedBox(   
      child:  Text(  
        'Size: $sizere sqm',  
        style: const TextStyle(color: Colors.white, fontSize: 10,fontWeight: FontWeight.bold),  
      ),  
                  ),  
                ),   
        ],
      ),
    );
  }
}
class TestSearch extends SearchDelegate {
  TestSearch({required this.name});
  List name = [];
  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
          onPressed: () {
            query = "";
          },
          icon: Icon(Icons.close))
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
        onPressed: () {
          Navigator.of(context).pop();
        },
        icon: Icon(Icons.arrow_back));
  }

  @override
  Widget buildResults(BuildContext context) {
    // TODO: implement buildResults
    throw UnimplementedError();
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    List result = name.where((element) {
      return element.contains(query);
    }).toList();
    return ListView.builder(
        itemCount: query == "" ? name.length : result.length,
        itemBuilder: (context, i) {
          return InkWell(
            onTap: () {
              query = query == "" ? name[i] : result[i];
              print(query);
              // showModalBottomSheet(
              //     context: context,
              //     builder: (context) {
              //       return Slider1();
              //     });
            },
            child: Container(
                padding: const EdgeInsets.all(14),
                child: query == "" ? Text("${name[i]}") : Text("${result[i]}")),
          );
        });
  }
}
