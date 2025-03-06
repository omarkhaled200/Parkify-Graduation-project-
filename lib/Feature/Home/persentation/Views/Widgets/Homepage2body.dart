import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:parkify/Core/utlis/Icon_All_app.dart';
import 'package:parkify/Core/utlis/assets.dart';
import 'package:parkify/Feature/Home/persentation/Views/Widgets/CustomReserveNowButton.dart';
import 'package:parkify/Feature/Home/persentation/Views/Widgets/DisplayMoneyWidget.dart';
import 'package:parkify/Feature/Home/persentation/Views/Widgets/ShowtheFreeandOccupiedSpot.dart';
import 'package:parkify/constant.dart';

class Homepage2body extends StatefulWidget {
  const Homepage2body({super.key});

  @override
  State<Homepage2body> createState() => _Homepage2bodyState();
}

class _Homepage2bodyState extends State<Homepage2body> {
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
      body: Padding(
        padding: const EdgeInsets.only(left: 8.0, right: 8),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Welcome Omar Khaled',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w600,
                fontFamily: Assets.textfamily,
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            ShowtheFreeandOccupiedSpot(width: width, heaight: heaight),
            const SizedBox(
              height: 25,
            ),
            CustomReserveNowButton(width: width, heaight: heaight)
          ],
        ),
      ),
    );
  }
}
