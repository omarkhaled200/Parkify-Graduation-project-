import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:parkify/Core/utlis/App_Router.dart';
import 'package:parkify/Core/utlis/assets.dart';
import 'package:parkify/Feature/Splash/peresentation/Views/Widgets/CustomPostionCarStack.dart';

class onboardingviewbody3 extends StatelessWidget {
  const onboardingviewbody3({super.key});

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Column(
      children: [
        CustomPostionCarStack(width: width, height: height),
        SizedBox(
          height: 10,
        ),
        Column(
          children: [
            Center(
              child: Text(
                'Welcome',
                style: TextStyle(
                    color: Color(0xff007AFF),
                    fontFamily: Assets.textfamily,
                    fontSize: 22,
                    fontWeight: FontWeight.w500),
              ),
            ),
            const SizedBox(
              height: 8,
            ),
            Text(
              'Parkify  Parking 🅿',
              style: TextStyle(
                  fontFamily: Assets.textfamily,
                  fontSize: 28,
                  fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: height * 0.05,
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                fixedSize: Size(width * 0.5, height * 0.07),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16)),
                backgroundColor: Color(0xff1D5CD1),
                splashFactory: InkRipple.splashFactory,
              ),
              onPressed: () {
                GoRouter.of(context).push(AppRouter.bottomNaviagationBar);
              },
              child: Text(
                'Get Start',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 22,
                  fontFamily: Assets.textfamily,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
