import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:parkify/Core/utlis/assets.dart';

class CustomAddNewimage extends StatefulWidget {
  const CustomAddNewimage({super.key});

  @override
  State<CustomAddNewimage> createState() => _CustomAddNewimageState();
}

class _CustomAddNewimageState extends State<CustomAddNewimage> {
  File? _imageFile;

  final ImagePicker _picker = ImagePicker();

  Future<void> _pickImage() async {
    final XFile? pickedFile =
        await _picker.pickImage(source: ImageSource.gallery);
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
    return Center(
      child: Stack(
        alignment: Alignment.bottomRight,
        children: [
          GestureDetector(
            onTap: () => _pickImage(),
            child: CircleAvatar(
              radius: 85,
              backgroundColor: const Color(0xffA9D6E5),
              backgroundImage: _imageFile != null
                  ? FileImage(_imageFile!)
                  : AssetImage(Assets.logo) as ImageProvider,
            ),
          ),
          Positioned(
            bottom: 10,
            right: 10,
            child: CircleAvatar(
              backgroundColor: Colors.black,
              radius: heaight * 0.022,
              child: Center(
                child: IconButton(
                  onPressed: _pickImage,
                  icon: Icon(
                    Icons.add,
                    color: Colors.white,
                    size: heaight * 0.02,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
