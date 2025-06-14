import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:parkify/Core/utlis/CustomButton.dart';
import 'package:parkify/Core/utlis/assets.dart';
import 'package:parkify/Feature/Auth/Presentation/Views/Widgets/CustomDisplayContent.dart';

class CustomAddplatepart extends StatefulWidget {
  const CustomAddplatepart({super.key});

  @override
  State<CustomAddplatepart> createState() => _CustomAddplatepartState();
}

class _CustomAddplatepartState extends State<CustomAddplatepart> {
  File? _imageFile;
  bool _isChecked = false;
  final ImagePicker _picker = ImagePicker();
  bool isCarPlateConfirmed = false;

  Future<void> _pickImage() async {
    var pickedFile = await _picker.pickImage(source: ImageSource.camera);

    if (pickedFile != null) {
      setState(() {
        _imageFile = File(pickedFile.path);
      });
    } else {
      print('No image selected.');
    }
  }

  @override
  Widget build(BuildContext context) {
    var heaight = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Column(
      children: [
        SizedBox(
          height: heaight * 0.01,
        ),
        Text(
          'Add Plate',
          style: TextStyle(
            fontFamily: Assets.textfamily,
            fontWeight: FontWeight.w700,
            fontSize: 24,
          ),
        ),
        SizedBox(
          height: heaight * 0.01,
        ),
        IconButton(
          padding: EdgeInsets.zero,
          onPressed: _pickImage,
          icon: const Icon(
            Icons.camera_alt_rounded,
            size: 85,
          ),
        ),
        CustomDisplayContent(width: width, heaight: heaight),
        SizedBox(
          height: heaight * 0.01,
        ),
        CustomButton(
          width: width,
          heaight: heaight,
          text: 'Submit',
          onPressed: () {},
        ),
        SizedBox(
          height: heaight * 0.01,
        ),
        const Divider(
          indent: 20,
          endIndent: 20,
          height: 1,
          color: Colors.black,
        ),
      ],
    );
  }
}
