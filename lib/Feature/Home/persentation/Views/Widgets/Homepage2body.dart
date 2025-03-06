import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/svg.dart';
import 'package:parkify/Core/utlis/assets.dart';
import 'package:parkify/Feature/Gift/Home/persentation/Views/Gift_view.dart';
import 'package:parkify/Feature/Home/persentation/Views/Widgets/DisplayMoneyWidget.dart';
import 'package:parkify/Feature/Payment/Home/persentation/Views/Payment_View.dart';
import 'package:parkify/Feature/Profile/Home/persentation/Views/Profile_view.dart';
import 'package:parkify/constant.dart';

class Homepage2body extends StatefulWidget {
  const Homepage2body({super.key});

  @override
  State<Homepage2body> createState() => _Homepage2bodyState();
}

class _Homepage2bodyState extends State<Homepage2body> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    var heaight = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: kprimaryColor,
        title: Image.asset(
          Assets.logopark,
          width: width * 0.2,
        ),
        actions: [DisplaymoneyWidget(width: width)],
      ),
      body: Center(
        child: Text('Homepage2body'),
      ),
    );
  }
}
