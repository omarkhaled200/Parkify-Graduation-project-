import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'package:parkify/Core/utlis/Icon_All_app.dart';

import 'package:parkify/Feature/Home/persentation/Views/Widgets/DisplayMoneyWidget.dart';

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
        title: IconApp(width: width),
        actions: [DisplaymoneyWidget(width: width)],
      ),
      body: Center(
        child: Text('Homepage2body'),
      ),
    );
  }
}
