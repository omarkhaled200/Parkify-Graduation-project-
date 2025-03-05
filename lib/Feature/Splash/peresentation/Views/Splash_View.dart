import 'package:flutter/material.dart';
import 'package:parkify/Feature/Splash/peresentation/Views/Widgets/SplashViewbody.dart';
import 'package:parkify/constant.dart';

class SplashView extends StatelessWidget {
  const SplashView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
        backgroundColor: kprimaryColor, body: SplashViewbody());
  }
}
