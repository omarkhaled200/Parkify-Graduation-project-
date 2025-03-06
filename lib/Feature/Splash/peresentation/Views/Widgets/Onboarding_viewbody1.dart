import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:parkify/Core/utlis/App_Router.dart';
import 'package:parkify/Core/utlis/assets.dart';
import 'package:parkify/Feature/Splash/peresentation/Views/Widgets/Cusotm_Row_onboarding.dart';
import 'package:parkify/Feature/Splash/peresentation/Views/Widgets/OnboardingButton.dart';

class onboardingviewbody1 extends StatelessWidget {
  const onboardingviewbody1({super.key});

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Column(
      children: [
        Center(
          child: Image.asset(
            Assets.onboarding1,
            height: height * 0.58,
            width: width,
            fit: BoxFit.fill,
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 32.0),
          child: Column(
            children: [
              CusotmRowonboarding(
                image: Assets.smallcar,
                text: 'Car Parking',
              ),
              const SizedBox(
                height: 15,
              ),
              Text(
                'Find, Park, Relax  The Future of Parking!🏙️🚗',
                style: TextStyle(
                  fontFamily: Assets.textfamily,
                  fontSize: 28,
                ),
                maxLines: 3,
              ),
              const SizedBox(
                height: 45,
              ),
              Row(
                children: [
                  onboardingButton(
                      onPressed: () {
                        GoRouter.of(context).push(
                          AppRouter.onboardinview3,
                        );
                      },
                      text: 'Skip',
                      backgroundcolor: Colors.white,
                      Textcolor: Colors.black),
                  SizedBox(
                    width: 5,
                  ),
                  onboardingButton(
                      onPressed: () {
                        GoRouter.of(context).push(
                          AppRouter.onboardinview2,
                        );
                      },
                      text: 'Next',
                      backgroundcolor: Colors.black,
                      Textcolor: Colors.white),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
