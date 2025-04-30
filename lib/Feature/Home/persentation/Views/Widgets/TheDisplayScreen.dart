import 'package:flutter/material.dart';
import 'package:parkify/Core/utlis/assets.dart';
import 'package:parkify/constant.dart';

class TheDisplayScreen extends StatelessWidget {
  const TheDisplayScreen({
    super.key,
    required this.heaight,
    required this.width,
    required this.text,
  });

  final double heaight;
  final double width;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 16, right: 16, top: 16),
      height: heaight * 0.2,
      width: width,
      decoration: BoxDecoration(
        color: kprimaryColor,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Center(
        child: Text(
          text,
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w600,
            fontFamily: Assets.textfamily,
          ),
        ),
      ),
    );
  }
}
