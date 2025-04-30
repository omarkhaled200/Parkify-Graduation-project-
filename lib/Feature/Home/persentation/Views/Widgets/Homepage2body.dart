import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:parkify/Core/utlis/Icon_All_app.dart';
import 'package:parkify/Core/utlis/assets.dart';
import 'package:parkify/Feature/Auth/data/Models/user_model/user_model.dart';
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
    var userdata = GoRouterState.of(context).extra as UserModel;

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: kprimaryColor,
        title: IconApp(width: width),
        actions: [
          DisplaymoneyWidget(
            width: width,
            price: userdata.userData!.balance!,
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 8.0, right: 8),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Welcome ${userdata.user!.name}',
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
              height: heaight * 0.03,
            ),
            Text(
              'Let’s start our journey together my friend! 🚀',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w600,
                fontFamily: Assets.textfamily,
              ),
            ),
            SizedBox(
              height: heaight * 0.09,
            ),
            CustomReserveNowButton(
              width: width,
              heaight: heaight,
              userdata: userdata,
            )
          ],
        ),
      ),
    );
  }
}
