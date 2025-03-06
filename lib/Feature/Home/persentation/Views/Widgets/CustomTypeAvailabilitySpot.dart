import 'package:flutter/material.dart';
import 'package:parkify/Core/utlis/assets.dart';

class CustomTypeAvailabilitySpot extends StatelessWidget {
  const CustomTypeAvailabilitySpot({
    super.key,
    required this.text,
    required this.color,
  });
  final String text;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 20,
          height: 20,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            color: color,
          ),
        ),
        SizedBox(
          width: 5,
        ),
        Text(
          text,
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w600,
            fontFamily: Assets.textfamily,
          ),
        )
      ],
    );
  }
}
