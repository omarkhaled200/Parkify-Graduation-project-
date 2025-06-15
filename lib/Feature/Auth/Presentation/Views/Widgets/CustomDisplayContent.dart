import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:parkify/Core/utlis/assets.dart';
import 'package:parkify/constant.dart';

class CustomDisplayContent extends StatelessWidget {
  const CustomDisplayContent({
    super.key,
    required this.width,
    required this.heaight,
    required this.text,
  });

  final double width;
  final double heaight;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      shadowColor: Colors.grey,
      child: Container(
        padding: const EdgeInsets.all(12),
        width: width,
        height: heaight * 0.08,
        decoration: BoxDecoration(
          color: kprimaryColor,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Text(
          "The Plate is : $text",
          style: TextStyle(
            fontFamily: Assets.textfamily,
            fontSize: 20,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }
}
