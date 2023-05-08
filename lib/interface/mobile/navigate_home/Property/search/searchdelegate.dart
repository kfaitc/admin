import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
class SearchDelegate1 extends StatefulWidget {
  const SearchDelegate1({Key? key}) : super(key: key);

  @override
  State<SearchDelegate1> createState() => _SearchDelegate1State();
  
}

class _SearchDelegate1State extends State<SearchDelegate1> {
  @override
  void initState() {
    Searchtest() ;
    // TODO: implement initState
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        actions: [
          IconButton(
            //color: Colors.amber,
              onPressed: () {
                showSearch(context: context, delegate: TestSearch(name: Name_Commune));
              },
              icon: const Icon(Icons.search,color: Colors.black,)
              )
        ],
      ),
    );
  }
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

