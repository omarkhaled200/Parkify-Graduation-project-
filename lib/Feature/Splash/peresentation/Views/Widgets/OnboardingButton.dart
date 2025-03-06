import 'package:flutter/material.dart';
import 'package:parkify/Core/utlis/assets.dart';

class onboardingButton extends StatelessWidget {
  const onboardingButton({
    super.key,
    required this.backgroundcolor,
    required this.Textcolor,
    required this.text,
    required this.onPressed,
  });
  final Color backgroundcolor;
  final Color Textcolor;
  final String text;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        fixedSize: Size(width * 0.42, height * 0.09),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        backgroundColor: backgroundcolor,
        splashFactory: InkRipple.splashFactory,
      ),
      onPressed: onPressed,
      child: Text(
        text,
        style: TextStyle(
          color: Textcolor,
          fontSize: 20,
          fontFamily: Assets.textfamily,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}
