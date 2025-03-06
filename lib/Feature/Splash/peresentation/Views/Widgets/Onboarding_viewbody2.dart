import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:parkify/Core/utlis/App_Router.dart';
import 'package:parkify/Core/utlis/assets.dart';
import 'package:parkify/Feature/Splash/peresentation/Views/Widgets/Cusotm_Row_onboarding.dart';
import 'package:parkify/Feature/Splash/peresentation/Views/Widgets/OnboardingButton.dart';

class onboardingviewbody2 extends StatelessWidget {
  const onboardingviewbody2({super.key});

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Column(
      children: [
        Center(
          child: Image.asset(
            Assets.onboarding2,
            height: height * 0.55,
            width: width,
            fit: BoxFit.contain,
          ),
        ),
        SizedBox(
          height: 30,
        ),
        Padding(
          padding: const EdgeInsets.only(left: 32.0, right: 32),
          child: Column(
            children: [
              CusotmRowonboarding(
                image: Assets.Flash,
                text: 'BoltPark',
              ),
              const SizedBox(
                height: 15,
              ),
              Text(
                'Park Smarter, Drive Easier!🅿️⚡',
                style: TextStyle(
                  fontFamily: Assets.textfamily,
                  fontSize: 28,
                ),
                maxLines: 3,
              ),
              SizedBox(
                height: height * 0.1,
              ),
              Row(
                children: [
                  Expanded(
                    flex: 1,
                    child: onboardingButton(
                        onPressed: () {
                          GoRouter.of(context).push(
                            AppRouter.onboardinview3,
                          );
                        },
                        text: 'Skip',
                        backgroundcolor: Colors.white,
                        Textcolor: Colors.black),
                  ),
                  SizedBox(
                    width: 15,
                  ),
                  Expanded(
                    flex: 1,
                    child: onboardingButton(
                        onPressed: () {
                          GoRouter.of(context).push(
                            AppRouter.onboardinview3,
                          );
                        },
                        text: 'Next',
                        backgroundcolor: Colors.black,
                        Textcolor: Colors.white),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
