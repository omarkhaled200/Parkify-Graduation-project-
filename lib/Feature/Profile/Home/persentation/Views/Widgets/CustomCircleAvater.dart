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
      radius: width * 0.15,
      backgroundColor: Colors.white,
      child: Image.asset(
        Assets.logo,
        fit: BoxFit.fill,
      ),
    );
  }
}
