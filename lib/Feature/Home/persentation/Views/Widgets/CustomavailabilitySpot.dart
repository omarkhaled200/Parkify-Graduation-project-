import 'package:flutter/material.dart';
import 'package:parkify/Feature/Home/persentation/Views/Widgets/CusotmNumberAvailabilitySpot.dart';
import 'package:parkify/Feature/Home/persentation/Views/Widgets/CustomTypeAvailabilitySpot.dart';

class CustomavailabilitySpot extends StatelessWidget {
  const CustomavailabilitySpot({
    super.key,
    required this.width,
    required this.heaight,
    required this.text,
    required this.color,
    required this.NumberSpot,
  });

  final double width;
  final double heaight;
  final String text;
  final Color color;
  final int NumberSpot;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomTypeAvailabilitySpot(
          color: color,
          text: text,
        ),
        SizedBox(
          height: 5,
        ),
        CusotmNumberAvailabilitySpot(
          width: width,
          heaight: heaight,
          NumberSpot: NumberSpot,
        ),
      ],
    );
  }
}
