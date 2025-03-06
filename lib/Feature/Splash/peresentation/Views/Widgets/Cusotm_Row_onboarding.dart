import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:parkify/Core/utlis/assets.dart';

class CusotmRowonboarding extends StatelessWidget {
  const CusotmRowonboarding({
    super.key,
    required this.image,
    required this.text,
  });
  final String image;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SvgPicture.asset(image),
        const SizedBox(
          width: 15,
        ),
        Text(
          text,
          style: TextStyle(
            fontFamily: Assets.textfamily,
            fontWeight: FontWeight.w600,
            fontSize: 18,
          ),
        ),
      ],
    );
  }
}
