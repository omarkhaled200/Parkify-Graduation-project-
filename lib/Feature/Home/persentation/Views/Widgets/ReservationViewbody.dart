import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:parkify/Core/utlis/App_Router.dart';
import 'package:parkify/Core/utlis/CustomButton.dart';
import 'package:parkify/Core/utlis/Icon_All_app.dart';
import 'package:parkify/Feature/Home/persentation/Views/Widgets/CustomDrowdown.dart';
import 'package:parkify/Feature/Home/persentation/Views/Widgets/CustomTimeOfDay.dart';
import 'package:parkify/Feature/Home/persentation/Views/Widgets/DisplayMoneyWidget.dart';
import 'package:parkify/Feature/Home/persentation/Views/Widgets/ShowtheFreeandOccupiedSpot.dart';
import 'package:parkify/Feature/Home/persentation/Views/Widgets/TheDisplayScreen.dart';
import 'package:parkify/constant.dart';

class ReservationViewbody extends StatefulWidget {
  const ReservationViewbody({super.key});

  @override
  State<ReservationViewbody> createState() => _ReservationViewbodyState();
}

class _ReservationViewbodyState extends State<ReservationViewbody> {
  List<String> _list = ['Plate1', 'Plate2', 'Plate3', 'Plate4', 'Plate5'];
  String? _selectedPlate = 'Plate1';
  List<String> _paymentlist = [
    'payment1',
    'payment2',
    'payment3',
    'payment4',
    'payment5'
  ];
  String? _selectedpayment = 'payment1';
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
            SizedBox(
              height: heaight * 0.02,
            ),
            CustomDrowdown(
              list: _list,
              selectedPlate: _selectedPlate!,
              text: 'Select License Plate',
            ),
            SizedBox(
              height: heaight * 0.02,
            ),
            const CustomTimeOfDay(),
            SizedBox(
              height: heaight * 0.02,
            ),
            CustomDrowdown(
              list: _paymentlist,
              selectedPlate: _selectedpayment!,
              text: 'Choose Payment Method',
            ),
            SizedBox(
              height: heaight * 0.02,
            ),
            CustomButton(
              width: width,
              heaight: heaight,
              text: 'Submit',
              onPressed: () {
                GoRouter.of(context).push(AppRouter.homePageCountdown);
              },
            ),
          ],
        ),
      ),
    );
  }
}
