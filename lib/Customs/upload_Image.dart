import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:kfa_admin/Profile/contants.dart';

class AddItem extends StatefulWidget {
  const AddItem({Key? key, required this.com_id}) : super(key: key);
  final String com_id;
  @override
  State<AddItem> createState() => _AddItemState();
}

class _AddItemState extends State<AddItem> {
  // ignore: prefer_final_fields

  String imageUrl = '';

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 55,
          margin: const EdgeInsets.only(left: 30, right: 30),
          decoration: BoxDecoration(
            border: Border.all(
              width: 1,
              color: kPrimaryColor,
            ),
            borderRadius: BorderRadius.all(
              Radius.circular(10),
            ),
          ),
          child: TextButton(
            onPressed: () async {
              ImagePicker imagePicker = ImagePicker();
              XFile? file =
                  await imagePicker.pickImage(source: ImageSource.gallery);
              print('${file?.path}');

              if (file == null) return;
              //Import dart:core
            },
            child: Row(
              children: const [
                Icon(
                  Icons.file_present_sharp,
                  color: kImageColor,
                ),
                SizedBox(
                  width: 10,
                ),
                Text(
                  'Choose Image',
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
