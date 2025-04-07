import 'package:flutter/material.dart';
import 'package:parkify/Core/utlis/assets.dart';
import 'package:parkify/constant.dart';

class CustomContainerGiftPoint extends StatelessWidget {
  const CustomContainerGiftPoint({
    super.key,
    required this.heaight,
    required this.width,
  });

  final double heaight;
  final double width;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        height: heaight * 0.17,
        width: width * 0.9,
        decoration: BoxDecoration(
          color: kprimaryColor,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Padding(
          padding: const EdgeInsets.only(left: 8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset(
                Assets.pointgift,
                height: heaight * 0.1,
                width: width * 0.15,
              ),
              SizedBox(
                width: width * 0.01,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '500Pts',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      fontFamily: Assets.textfamily,
                    ),
                  ),
                  SizedBox(
                    height: heaight * 0.01,
                  ),
                  Text(
                    'Total Points earned',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w500,
                      fontFamily: Assets.textfamily,
                      color: const Color(0xff716E6E),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
