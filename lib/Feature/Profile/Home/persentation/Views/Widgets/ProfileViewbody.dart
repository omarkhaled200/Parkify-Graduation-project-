import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:parkify/Core/utlis/Icon_All_app.dart';
import 'package:parkify/Core/utlis/assets.dart';
import 'package:parkify/Feature/Profile/Home/persentation/Views/Widgets/CustomCircleAvater.dart';
import 'package:parkify/Feature/Profile/Home/persentation/Views/Widgets/CustomUserInformationSection.dart';
import 'package:parkify/constant.dart';

class ProfileViewbody extends StatelessWidget {
  const ProfileViewbody({super.key});

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
              onPressed: () {},
              icon: Icon(
                FontAwesomeIcons.pencil,
                color: Colors.black.withOpacity(0.8),
                size: 20,
              ))
        ],
      ),
      body: Center(
          child: Column(
        children: [
          SizedBox(
            height: heaight * 0.02,
          ),
          CusotmCircleAvater(width: width),
          SizedBox(
            height: heaight * 0.01,
          ),
          Text(
            'User Name',
            style: TextStyle(
                fontFamily: Assets.textfamily,
                fontSize: 22,
                fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: heaight * 0.01,
          ),
          CustomUserInformationSection(width: width, heaight: heaight)
        ],
      )),
    );
  }
}
