import 'package:flutter/material.dart';
import 'package:parkify/Core/utlis/assets.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    required this.width,
    required this.heaight,
    this.onPressed,
    required this.text,
    this.backcolor = Colors.black,
  });

  final double width;
  final double heaight;
  final void Function()? onPressed;
  final String text;
  final Color? backcolor;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: backcolor,
        fixedSize: Size(width * 0.7, heaight * 0.09),
        splashFactory: InkRipple.splashFactory,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      ),
      onPressed: onPressed,
      child: Text(
        text,
        style: TextStyle(
          color: Colors.white,
          fontSize: 20,
          fontWeight: FontWeight.w600,
          fontFamily: Assets.textfamily,
        ),
      ),
    );
  }
}
