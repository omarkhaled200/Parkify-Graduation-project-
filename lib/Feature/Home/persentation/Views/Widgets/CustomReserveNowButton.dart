import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:parkify/Core/utlis/App_Router.dart';
import 'package:parkify/Core/utlis/assets.dart';

class CustomReserveNowButton extends StatelessWidget {
  const CustomReserveNowButton({
    super.key,
    required this.width,
    required this.heaight,
  });

  final double width;
  final double heaight;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            elevation: 20,
            side: const BorderSide(
              color: Color(0xff2C7DA0),
              width: 2,
              style: BorderStyle.solid,
            ),
            fixedSize: Size(width * 0.65, heaight * 0.3),
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
          ),
          onPressed: () {
            GoRouter.of(context).push(AppRouter.reservationpage);
          },
          child: Text(
            'Reserve Now?',
            textAlign: TextAlign.center,
            style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w600,
                fontFamily: Assets.textfamily,
                color: const Color(0xff1D5CD1)),
          )),
    );
  }
}
