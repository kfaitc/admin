// import 'package:flutter/material.dart';

// class SingleChildScrollViewExample extends StatelessWidget {
//   const SingleChildScrollViewExample({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Nested ScrollView Example'),
//       ),
//       body: NestedScrollView(
//         headerSliverBuilder: (context, innerBoxIsScrolled) {
//           return [
//             SliverToBoxAdapter(
//                 child: Column(
//               children: [
//                 Text('sdfsdfasdfsadf'),
//                 Text('sdfsdfasdfsadf'),
//                 Text('sdfsdfasdfsadf'),
//                 Text('sdfsdfasdfsadf'),
//                 Text('sdfsdfasdfsadf'),
//                 Text('sdfsdfasdfsadf'),
//               ],
//             )),
//           ];
//         },
//         body: ScrollerViewContainer(),
//       ),
//     );
//   }
// }

// class ScrollerViewContainer extends StatelessWidget {
//   const ScrollerViewContainer({Key? key});

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       height: 200,
//       width: 400,
//       child: SingleChildScrollView(
//         scrollDirection: Axis.horizontal,
//         child: SingleChildScrollView(
//           scrollDirection: Axis.vertical,
//           child: Container(
//             decoration: BoxDecoration(border: Border.all(width: 2)),
//             width: 30 *
//                 50.0, // Set the width of the container to accommodate all the List items
//             child: ListView.builder(
//               scrollDirection: Axis.vertical,
//               shrinkWrap: true,
//               physics: NeverScrollableScrollPhysics(),
//               itemCount: 30,
//               itemBuilder: (context, index) {
//                 return Padding(
//                   padding: const EdgeInsets.all(8.0),
//                   child: Container(
//                     height: 50,
//                     width: 50,
//                     color: Color.fromARGB(255, 176, 73, 17),
//                   ),
//                 );
//               },
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
