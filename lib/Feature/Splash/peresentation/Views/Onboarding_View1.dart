import 'package:flutter/material.dart';
import 'package:parkify/Feature/Splash/peresentation/Views/Widgets/Onboarding_viewbody1.dart';
import 'package:parkify/constant.dart';

class OnboardingView1 extends StatelessWidget {
  const OnboardingView1({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: kprimaryColor,
      body: onboardingviewbody1(),
    );
  }
}
