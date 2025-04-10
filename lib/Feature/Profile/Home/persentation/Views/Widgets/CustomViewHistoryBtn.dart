import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:parkify/Core/utlis/App_Router.dart';
import 'package:parkify/Core/utlis/assets.dart';
import 'package:parkify/constant.dart';

class CustomViewHistoryBtn extends StatelessWidget {
  const CustomViewHistoryBtn({
    super.key,
    required this.width,
    required this.heaight,
  });

  final double width;
  final double heaight;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        style: ElevatedButton.styleFrom(
            alignment: Alignment.centerLeft,
            minimumSize: Size(width * 0.9, heaight * 0.1),
            backgroundColor: kprimaryColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            )),
        onPressed: () {
          GoRouter.of(context).push(AppRouter.Historypage);
        },
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'View History',
              style: TextStyle(
                  fontSize: 20,
                  color: Colors.black,
                  fontFamily: Assets.textfamily,
                  fontWeight: FontWeight.bold),
            ),
            const Icon(
              Icons.arrow_forward_ios_rounded,
              size: 24,
              color: Colors.black,
            )
          ],
        ));
  }
}
