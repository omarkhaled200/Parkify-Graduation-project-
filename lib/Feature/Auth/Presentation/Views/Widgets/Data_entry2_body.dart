import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:parkify/Core/utlis/App_Router.dart';
import 'package:parkify/Core/utlis/CustomButton.dart';
import 'package:parkify/Core/utlis/CustomRowAccount(have%20Account).dart';
import 'package:parkify/Core/utlis/CustomTextField.dart';
import 'package:parkify/Core/utlis/assets.dart';
import 'package:parkify/Feature/Auth/Presentation/Views/Widgets/LogoinenteryImage.dart';
import 'package:parkify/constant.dart';

class Dataentry2body extends StatelessWidget {
  const Dataentry2body({super.key});

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
              height: heaight * 0.08,
            ),
            LogoinenteryImage(width: width, heaight: heaight),
            SizedBox(
              height: heaight * 0.08,
            ),
            Container(
              width: width,
              height: heaight * 0.7,
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(50),
                  topLeft: Radius.circular(50),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.only(top: 22, left: 16.0, right: 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Visa",
                      style: TextStyle(
                        fontFamily: Assets.textfamily,
                        fontSize: 28,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    SizedBox(height: heaight * 0.03),
                    const CustomTextField(
                      hintText: 'Credit Number',
                      prefixIcon: FontAwesomeIcons.creditCard,
                    ),
                    SizedBox(height: heaight * 0.02),
                    const CustomTextField(
                      hintText: 'CVC',
                      prefixIcon: Icons.pin,
                      obscureText: true,
                    ),
                    SizedBox(height: heaight * 0.02),
                    const CustomTextField(
                      hintText: 'Expiration Date',
                      prefixIcon: Icons.date_range_rounded,
                      obscureText: true,
                    ),
                    SizedBox(height: heaight * 0.1),
                    Center(
                        child: CustomButton(
                      width: width,
                      heaight: heaight,
                      text: 'Next',
                      onPressed: () {
                        GoRouter.of(context)
                            .push(AppRouter.bottomNaviagationBar);
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
