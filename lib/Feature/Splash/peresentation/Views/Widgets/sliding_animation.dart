import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:parkify/Core/utlis/assets.dart';
import 'package:parkify/constant.dart';

class sliding_Animation extends StatelessWidget {
  const sliding_Animation({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
        child: ClipRect(
      child: TextLiquidFill(
        text: 'parkify',
        waveColor: Colors.black,
        boxBackgroundColor: kprimaryColor,
        textStyle: TextStyle(
          fontSize: 30.0,
          fontWeight: FontWeight.bold,
          fontFamily: Assets.textfamily,
        ),
        boxHeight: 50.0,
        boxWidth: 130,
      ),
    ));
  }
}
