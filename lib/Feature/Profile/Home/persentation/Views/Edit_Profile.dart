import 'dart:io';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:image_picker/image_picker.dart';
import 'package:parkify/Core/utlis/App_Router.dart';
import 'package:parkify/Core/utlis/CustomTextField.dart';
import 'package:parkify/Core/utlis/Icon_All_app.dart';
import 'package:parkify/Core/utlis/assets.dart';
import 'package:parkify/Feature/Profile/Home/persentation/Views/Widgets/CustomAddNewimage.dart';
import 'package:parkify/constant.dart';

class EditProfile extends StatefulWidget {
  const EditProfile({super.key});

  @override
  State<EditProfile> createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  @override
  Widget build(BuildContext context) {
    var heaight = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: kprimaryColor,
        title: IconApp(width: width),
        actions: [
          IconButton(
              onPressed: () {
                GoRouter.of(context).push(AppRouter.profilepage);
              },
              icon: Icon(
                FontAwesomeIcons.solidSquareCheck,
                color: Colors.black.withOpacity(0.8),
                size: 22,
              ))
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Column(
            children: [
              SizedBox(
                height: heaight * 0.02,
              ),
              const CustomAddNewimage(),
              SizedBox(
                height: heaight * 0.03,
              ),
              Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('First Name',
                            style: TextStyle(
                                fontFamily: Assets.textfamily,
                                fontSize: 20,
                                fontWeight: FontWeight.w500)),
                        SizedBox(
                          height: heaight * 0.005,
                        ),
                        const CustomTextField(hintText: 'omar'),
                      ],
                    ),
                  ),
                  SizedBox(
                    width: width * 0.02,
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Last Name',
                            style: TextStyle(
                                fontFamily: Assets.textfamily,
                                fontSize: 20,
                                fontWeight: FontWeight.w500)),
                        SizedBox(
                          height: heaight * 0.005,
                        ),
                        const CustomTextField(hintText: 'Khaled'),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: heaight * 0.01,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Email',
                      style: TextStyle(
                          fontFamily: Assets.textfamily,
                          fontSize: 20,
                          fontWeight: FontWeight.w500)),
                  SizedBox(
                    height: heaight * 0.005,
                  ),
                  const CustomTextField(hintText: 'omarkhaled.6403@gmail.com'),
                ],
              ),
              SizedBox(
                height: heaight * 0.01,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('password',
                      style: TextStyle(
                          fontFamily: Assets.textfamily,
                          fontSize: 20,
                          fontWeight: FontWeight.w500)),
                  SizedBox(
                    height: heaight * 0.005,
                  ),
                  const CustomTextField(hintText: '20032003om'),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
