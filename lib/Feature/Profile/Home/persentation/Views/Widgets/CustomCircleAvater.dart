import 'package:flutter/material.dart';
import 'package:parkify/Core/utlis/assets.dart';

class CusotmCircleAvater extends StatelessWidget {
  const CusotmCircleAvater({
    super.key,
    required this.width,
  });

  final double width;

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: width * 0.2,
      backgroundColor: Colors.black,
      child: CircleAvatar(
        radius: width * 0.19,
        backgroundColor: Colors.white,
        child: Image.asset(
          Assets.logo,
          fit: BoxFit.fill,
        ),
      ),
    );
  }
}
