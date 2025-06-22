import 'package:flutter/material.dart';

import 'package:go_router/go_router.dart';
import 'package:parkify/Core/utlis/App_Router.dart';
import 'package:parkify/Core/utlis/assets.dart';
import 'package:parkify/Feature/Auth/data/Models/user_model/user_model.dart';
import 'package:parkify/Feature/Home/data/Model/LocationModel/LocatiomModel.dart';

class CustomReserveNowButton extends StatelessWidget {
  const CustomReserveNowButton({
    super.key,
    required this.width,
    required this.heaight,
    required this.userdata,
    required this.loc,
  });

  final double width;
  final double heaight;
  final UserModel userdata;
  final LocationModel loc;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadiusGeometry.circular(12)),
            elevation: 10,
            side: const BorderSide(
              color: Color(0xff2C7DA0),
              width: 2,
              style: BorderStyle.solid,
            ),
            backgroundColor: Colors.white,
            fixedSize: Size(width, 80),
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
          ),
          onPressed: () {
            GoRouter.of(context).push(AppRouter.reservationpage,
                extra: {'userdata': userdata, 'location': loc});
          },
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Reserve Now',
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                    fontFamily: Assets.textfamily,
                    color: const Color(0xff1D5CD1)),
              ),
              SizedBox(
                width: width * 0.01,
              ),
              const Icon(
                Icons.arrow_forward_rounded,
                size: 28,
                color: Color(0xff1D5CD1),
              )
            ],
          )),
    );
  }
}
