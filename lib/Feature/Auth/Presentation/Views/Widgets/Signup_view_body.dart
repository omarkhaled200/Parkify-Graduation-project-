import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:parkify/Core/utlis/App_Router.dart';
import 'package:parkify/Core/utlis/CustomButton.dart';
import 'package:parkify/Core/utlis/CustomRowAccount(have%20Account).dart';
import 'package:parkify/Core/utlis/CustomTextField.dart';
import 'package:parkify/Core/utlis/assets.dart';
import 'package:parkify/Feature/Auth/Presentation/Views/Widgets/LogoinenteryImage.dart';
import 'package:parkify/constant.dart';

class Signupviewbody extends StatelessWidget {
  const Signupviewbody({super.key});

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
              height: heaight * 0.05,
            ),
            LogoinenteryImage(width: width, heaight: heaight),
            SizedBox(
              height: heaight * 0.05,
            ),
            Container(
              width: width,
              height: heaight * 0.8,
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
                    Text(
                      "Signup",
                      style: TextStyle(
                        fontFamily: Assets.textfamily,
                        fontSize: 28,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    SizedBox(height: heaight * 0.02),
                    const CustomTextField(
                      hintText: 'Full Name',
                      prefixIcon: Icons.person,
                    ),
                    SizedBox(height: heaight * 0.01),
                    const CustomTextField(
                      hintText: 'User Name',
                      prefixIcon: Icons.person,
                    ),
                    SizedBox(height: heaight * 0.01),
                    const CustomTextField(
                      hintText: 'PassWord',
                      prefixIcon: Icons.lock_rounded,
                      obscureText: true,
                      suffixIcon: Icons.remove_red_eye_rounded,
                    ),
                    SizedBox(height: heaight * 0.01),
                    const CustomTextField(
                      hintText: 'Confirm Password',
                      prefixIcon: Icons.lock_rounded,
                      obscureText: true,
                      suffixIcon: Icons.remove_red_eye_rounded,
                    ),
                    SizedBox(height: heaight * 0.01),
                    CustomRowAccount(
                      text: 'Sign in',
                      onPressed: () {
                        GoRouter.of(context).push(AppRouter.loginview);
                      },
                    ),
                    SizedBox(height: heaight * 0.01),
                    Center(
                        child: CustomButton(
                      width: width,
                      heaight: heaight,
                      text: 'Register',
                      onPressed: () {},
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
