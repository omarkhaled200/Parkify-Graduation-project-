import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:parkify/Core/utlis/App_Router.dart';
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
              onPressed: () {
                GoRouter.of(context).push(AppRouter.Editprofile);
              },
              icon: const Icon(
                FontAwesomeIcons.pencil,
                color: Colors.black,
                size: 20,
              ))
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12.0),
        child: ListView(
          children: [
            SizedBox(
              height: heaight * 0.02,
            ),
            Row(
              children: [
                CusotmCircleAvater(width: width),
                SizedBox(
                  width: width * 0.03,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Omar khaled',
                      style: TextStyle(
                          fontFamily: Assets.textfamily,
                          fontSize: 22,
                          fontWeight: FontWeight.bold),
                    ),
                    Text(
                      'Omar@gmail.com',
                      style: TextStyle(
                          fontFamily: Assets.textfamily,
                          fontSize: 18,
                          fontWeight: FontWeight.w500),
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(
              height: heaight * 0.03,
            ),
            CustomUserInformationSection(width: width, heaight: heaight)
          ],
        ),
      ),
    );
  }
}
