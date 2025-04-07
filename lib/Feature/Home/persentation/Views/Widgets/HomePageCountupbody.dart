import 'package:flutter/material.dart';

import 'package:parkify/Core/utlis/CustomButton.dart';
import 'package:parkify/Core/utlis/Icon_All_app.dart';
import 'package:parkify/Core/utlis/assets.dart';
import 'package:parkify/Feature/Home/persentation/Views/Widgets/DisplayMoneyWidget.dart';
import 'package:parkify/Feature/Home/persentation/Views/Widgets/ProgressiveTimer(Countup).dart';
import 'package:parkify/Feature/Home/persentation/Views/Widgets/ShowtheFreeandOccupiedSpot.dart';
import 'package:parkify/constant.dart';

class HomePageCountupbody extends StatelessWidget {
  const HomePageCountupbody({super.key});

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
            SizedBox(
              height: heaight * 0.01,
            ),
            ShowtheFreeandOccupiedSpot(width: width, heaight: heaight),
            SizedBox(
              height: heaight * 0.015,
            ),
            Text(
              'You Have a Reservation At 2:00 PM At Spot 1',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w400,
                fontFamily: Assets.textfamily,
              ),
            ),
            SizedBox(
              height: heaight * 0.01,
            ),
            ProgressiveTimer(),
            SizedBox(
              height: heaight * 0.025,
            ),
            Row(
              children: [
                Expanded(
                    flex: 1,
                    child: CustomButton(
                      width: width,
                      heaight: heaight,
                      text: 'Blocker ⬇',
                      onPressed: () {},
                    )),
                const SizedBox(
                  width: 5,
                ),
                Expanded(
                    flex: 1,
                    child: CustomButton(
                      width: width,
                      heaight: heaight,
                      text: 'Cancel',
                      onPressed: () {},
                    )),
              ],
            )
          ],
        ),
      ),
    );
  }
}
