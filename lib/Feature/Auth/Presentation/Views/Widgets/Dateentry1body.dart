import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:image_picker/image_picker.dart';
import 'package:parkify/Core/utlis/App_Router.dart';
import 'package:parkify/Core/utlis/CustomButton.dart';
import 'package:parkify/Core/utlis/CustomRowAccount(have%20Account).dart';
import 'package:parkify/Core/utlis/CustomTextField.dart';
import 'package:parkify/Core/utlis/assets.dart';
import 'package:parkify/Feature/Auth/Presentation/Views/Widgets/CustomCheckbox.dart';
import 'package:parkify/Feature/Auth/Presentation/Views/Widgets/CustomDisplayContent.dart';
import 'package:parkify/Feature/Auth/Presentation/Views/Widgets/LogoinenteryImage.dart';
import 'package:parkify/constant.dart';

class Dateentry1body extends StatefulWidget {
  const Dateentry1body({super.key});

  @override
  State<Dateentry1body> createState() => _Dateentry1bodyState();
}

class _Dateentry1bodyState extends State<Dateentry1body> {
  File? _imageFile;
  bool _isChecked = false;
  final ImagePicker _picker = ImagePicker();

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
    return Scaffold(
      backgroundColor: kprimaryColor,
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: heaight * 0.059,
            ),
            LogoinenteryImage(width: width, heaight: heaight),
            SizedBox(
              height: heaight * 0.059,
            ),
            Container(
              width: width,
              height: heaight * 0.72,
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(50),
                  topLeft: Radius.circular(50),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.only(top: 16, left: 16.0, right: 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: heaight * 0.02),
                    const CustomTextField(
                      hintText: 'National ID',
                      prefixIcon: FontAwesomeIcons.idCard,
                    ),
                    SizedBox(height: heaight * 0.02),
                    const CustomTextField(
                      hintText: 'Phone',
                      prefixIcon: FontAwesomeIcons.phone,
                      obscureText: true,
                    ),
                    SizedBox(height: heaight * 0.02),
                    Row(
                      children: [
                        Image.asset(Assets.licenseplate,
                            width: 45, height: 30, color: Colors.grey),
                        const SizedBox(width: 10),
                        Text(
                          "License Plate",
                          style: TextStyle(
                              fontFamily: Assets.textfamily,
                              fontSize: 22,
                              fontWeight: FontWeight.w600),
                        ),
                      ],
                    ),
                    SizedBox(height: heaight * 0.01),
                    Center(
                      child: IconButton(
                        padding: EdgeInsets.zero,
                        onPressed: _pickImage,
                        icon: const Icon(
                          Icons.camera_alt_rounded,
                          size: 64,
                        ),
                      ),
                    ),
                    SizedBox(height: heaight * 0.01),
                    CustomDisplayContent(width: width, heaight: heaight),
                    SizedBox(height: heaight * 0.01),
                    const CustomCheckbox(),
                    SizedBox(height: heaight * 0.01),
                    Center(
                        child: CustomButton(
                      width: width,
                      heaight: heaight,
                      text: 'Next',
                      onPressed: () {
                        GoRouter.of(context).push(AppRouter.dataentry2view);
                      },
                    ))
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
