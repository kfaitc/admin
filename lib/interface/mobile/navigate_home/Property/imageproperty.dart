import 'dart:convert';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:kfa_admin/interface/mobile/navigate_home/Property/detail_Screen.dart';
class ImageProperty extends StatefulWidget {
  const ImageProperty({super.key});

  @override
  State<ImageProperty> createState() => _ImagePropertyState();
}

class _ImagePropertyState extends State<ImageProperty> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Property_Sale2();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [       
            Container(
                    height: MediaQuery.of(context).size.height,
                    width: double.infinity,
                    child: GridView.builder(
                          itemCount: list.length,
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            crossAxisSpacing: 2,
                            mainAxisSpacing: 2,
                            //childAspectRatio: 1,
                          ),
                          itemBuilder: (BuildContext context, int index) {         
                              return InkWell(
                                onTap: () {
                                detail(list[index]['url'].toString(), index);
                                },
                                child: Container(
                                  height: 100,
                                  width: double.infinity,                         
                                 child: SizedBox(
                                 height: MediaQuery.of(context).size.height,
                                 width: MediaQuery.of(context).size.width,
                                  child: Stack(
                                    children:[
                                      Positioned(
                                        right: 10,
                                        bottom: 10,
                                        child: Container(
                                          height: MediaQuery.of(context).size.height*0.32,     
                                          width: MediaQuery.of(context).size.height*0.24,
                                          child: Image.network(list[index]['url'].toString(),fit: BoxFit.cover,))
                                        ),
                                      Positioned(
                                        right: 10,
                                        bottom: 10,
                                        child: Text("sale:",style: TextStyle(color: Colors.white,fontSize: 14,fontWeight: FontWeight.bold),),
                                        ),
                                        Positioned(
                                        left: 5,
                                        bottom: 10,
                                        child: Text("size:",style: TextStyle(color: Colors.white,fontSize: 14,fontWeight: FontWeight.bold),),
                                        ),
                                      Positioned(
                                        left: 0,
                                        top: 3,
                                        child: Container(
                                          color: Colors.amber,
                                          height: 28,
                                          width: 90,
                                          child: Center(child: Text("FOR SALE",style: TextStyle(color: Colors.white,fontSize: 14,fontWeight: FontWeight.bold),))),
                                        ),
                                    ] 
                                  ),   
                                ),
                              )
                              );     
                          },
                        ),
                  ),
            // if(list.length%2==0)
            // for(int index=0;index<list.length;index++)
            // Row(
            //   children: [
            //     Padding(
            //       padding: const EdgeInsets.all(2.0),
            //       child: SizedBox(
            //         height: MediaQuery.of(context).size.height*0.3,
            //         width: MediaQuery.of(context).size.width*0.46,
            //         child: Image.network(list[index]['url'].toString(),fit: BoxFit.cover,),
            //       ),
            //     ),
            //     //  if(list.length%2!=0)
            //     //  for(int index=0;index<list.length+1;index++)
            //     Padding(
            //       padding: const EdgeInsets.all(2.0),
            //       child: SizedBox(
            //          height: MediaQuery.of(context).size.height*0.3,
            //         width: MediaQuery.of(context).size.width*0.46,
            //          child: Image.network(list[index]['url'].toString(),fit: BoxFit.cover,),
            //       ),
            //     ),
            //   ],
            // ),
            //  if(list.length%2!=0)
            //  for(int index=0;index<list.length+1;index++)
            // Row(
            //   children: [
            //     Padding(
            //       padding: const EdgeInsets.all(2.0),
            //       child: SizedBox(
            //         height: MediaQuery.of(context).size.height*0.3,
            //         width: MediaQuery.of(context).size.width*0.46,
            //         child: Image.network(list[index]['url'].toString(),fit: BoxFit.cover,),
            //       ),
            //     ),
            //     if(list.length+1==index+1)
            //     SizedBox(
            //        height: 100,
            //        width: 100,
            //        child: Image.network(list[index]['url'].toString()),
            //     )else  Container(
            //        height: 250,
                  
            //     )
            //   ],
            // )
          ],
        ),
      ),
      
      // SizedBox(
      //   height: MediaQuery.of(context).size.height*0.48,
      //   child: SingleChildScrollView(
      //     child: Column(
      //       children: [
      //         if(list.length%2==0)
      //         for(int index=0;index<list.length;index++)
      //         Row(
      //           children: [
      //             SizedBox(
      //               height: 250,
      //               child: Image.network(
      //                 list[index]['url'].toString(),
      //                ),
      //             ),
      //             SizedBox(
      //                height: 250,
      //                child: Image.network(
      //                 list[index]['url'].toString(),
      //                ),
      //             ),
      //           ],
      //         ),
      //          if(list.length%2!=0)
      //          for(int index=0;index<list.length+1;index++)
      //         Row(
      //           children: [
      //             SizedBox(
      //               height: 250,
      //               child: Image.network(
      //                 list[index]['url'].toString(),
      //                ),
      //             ),
      //             if(list.length+1==index+1)
      //             SizedBox(
      //                height: 250,
      //                child: Image.network(
      //                 list[index]['url'].toString(),
      //                ),
      //             )else  Container(
      //                height: 250,             
      //             )
      //           ],
      //         )
      //       ],
      //     ),
      //   ),
      // ),
      // ListView.builder(
      //   itemCount: list.length,
      //   itemBuilder: (context,index){
      //     // return ListTile(
      //     //   //leading: Text("leh==  ${list2_Sale.length}"),
      //     //   title: SizedBox(
      //     //     width: MediaQuery.of(context).size.width,
      //     //     height: MediaQuery.of(context).size.height*0.2,
      //     //     child: Image.network(
      //     //       list[index]['url'].toString(),
      //     //       fit: BoxFit.cover,
      //     //     ),
      //     //   ) ,
      //     // );
      //     return SingleChildScrollView(
      //       child: GridView.count(
      //         crossAxisCount: 2,
      //         mainAxisSpacing: 2,
      //         crossAxisSpacing: 2,
      //         shrinkWrap: true,
      //         children: [
      //           SizedBox(
      //             //color: Colors.amber,
      //             height: 50,
      //             width: 50,
      //             child: Image.network(list[index]['url'].toString()))
      //         ],
      //         ),
      //     );
      // }
      // ),
    );
  }
  Future<void> detail(String image,int index) async{
Get.to(Detail_screen(list_get: list[index]['url'].toString()));
  }
   List list2_Sale = [];
   List Data_image=[];
  void Property_Sale() async {
    var jsonData;
    final response = await http.get(Uri.parse(
        'https://newsapi.org/v2/everything?q=tesla&from=2023-03-26&sortBy=publishedAt&apiKey=8fe394b995e545b285fafc162562b039'));

    if (response.statusCode == 200) {
      jsonData = jsonDecode(response.body);
      list2_Sale = jsonData['articles'];
      setState(() {
        list2_Sale;
        for(int i=0;i<list2_Sale.length;i++){
          Data_image.add(list2_Sale[i]['urlToImage'].toString());
        }
      });
    }
  }
  List list = [];
  void Property_Sale2() async {
    var jsonData;
    final response = await http.get(Uri.parse(
        'https://www.oneclickonedollar.com/laravel_kfa_2023/public/api/image_get'));

    if (response.statusCode == 200) {
      jsonData = jsonDecode(response.body);
      list = jsonData;
      setState(() {
        list;
        // for(int i=0;i<list2_Sale.length;i++){
        //   Data_image.add(list2_Sale[i]['urlToImage'].toString());
        // }
      });
    }
  }
}
