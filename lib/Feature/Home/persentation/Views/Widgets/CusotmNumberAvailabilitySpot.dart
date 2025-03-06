import 'package:flutter/material.dart';
import 'package:parkify/Core/utlis/assets.dart';

class CusotmNumberAvailabilitySpot extends StatelessWidget {
  const CusotmNumberAvailabilitySpot({
    super.key,
    required this.width,
    required this.heaight,
    required this.NumberSpot,
  });

  final double width;
  final double heaight;
  final int NumberSpot;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width * 0.35,
      height: heaight * 0.07,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: Colors.black,
      ),
      child: Center(
        child: Text(
          '${NumberSpot} Spot',
          style: TextStyle(
            color: Colors.white,
            fontSize: 18,
            fontWeight: FontWeight.w600,
            fontFamily: Assets.textfamily,
          ),
        ),
      ),
    );
  }
}
