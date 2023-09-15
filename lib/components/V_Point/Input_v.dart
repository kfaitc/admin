// import 'package:flutter/material.dart';

// import '../../contants copy.dart';

// typedef OnChangeCallback = void Function(dynamic value);

// class Input_V extends StatefulWidget {
//   Input_V({super.key});
//   OnChangeCallback? v_point_back;
//   String? v_point;

//   // OnChangeCallback? v_point;
//   @override
//   State<Input_V> createState() => _Input_VState();
// }

// class _Input_VState extends State<Input_V> {
//   @override
//   void initState() {
//     super.initState();
//     _v_point = TextEditingController(text: '$v_point');
//   }

//   String? v_point;
//   TextEditingController? _v_point;
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       height: MediaQuery.of(context).size.height * 0.04,
//       width: MediaQuery.of(context).size.width * 0.4,
//       child: Row(
//         children: [
//           Container(
//             height: MediaQuery.of(context).size.height * 0.035,
//             width: MediaQuery.of(context).size.height * 0.035,
//             child: Image.network(
//                 'https://www.oneclickonedollar.com/laravel_kfa_2023/public/data_imgs_kfa/Form_Image/v.png'),
//           ),
//           SizedBox(width: 10),
//           SizedBox(
//             height: MediaQuery.of(context).size.height * 0.04,
//             width: MediaQuery.of(context).size.width * 0.3,
//             child: Padding(
//               padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
//               child: TextFormField(
//                 controller: _v_point,
//                 style: TextStyle(
//                   fontSize: MediaQuery.of(context).size.height * 0.015,
//                   fontWeight: FontWeight.bold,
//                 ),
//                 keyboardType: TextInputType.number,
//                 onChanged: (value) {
//                   setState(() {
//                     v_point = value;
//                   });
//                 },
//                 decoration: InputDecoration(
//                   contentPadding:
//                       EdgeInsets.symmetric(vertical: 8, horizontal: 8),

//                   // hintText: '$text',
//                   fillColor: kwhite,
//                   filled: true,
//                   focusedBorder: OutlineInputBorder(
//                     borderSide: const BorderSide(
//                       color: Colors.grey,
//                       width: 2.0,
//                     ),
//                     borderRadius: BorderRadius.circular(10.0),
//                   ),
//                   enabledBorder: OutlineInputBorder(
//                     borderSide: BorderSide(
//                       width: 1,
//                       color: Colors.grey,
//                     ),
//                     borderRadius: BorderRadius.circular(10.0),
//                   ),
//                 ),
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
