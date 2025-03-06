import 'package:flutter/material.dart';
import 'package:parkify/Core/utlis/Icon_All_app.dart';
import 'package:parkify/Core/utlis/assets.dart';
import 'package:parkify/Feature/Home/persentation/Views/Widgets/DisplayMoneyWidget.dart';
import 'package:parkify/Feature/Home/persentation/Views/Widgets/ShowtheFreeandOccupiedSpot.dart';
import 'package:parkify/Feature/Home/persentation/Views/Widgets/TheDisplayScreen.dart';
import 'package:parkify/constant.dart';

class ReservationViewbody extends StatelessWidget {
  const ReservationViewbody({super.key});

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
          padding: const EdgeInsets.only(left: 16.0, right: 16),
          child: Column(
            children: [
              SizedBox(
                height: heaight * 0.03,
              ),
              ShowtheFreeandOccupiedSpot(width: width, heaight: heaight),
              SizedBox(
                height: heaight * 0.03,
              ),
              TheDisplayScreen(heaight: heaight, width: width, text: 'Screen'),
            ],
          ),
        ));
  }
}
