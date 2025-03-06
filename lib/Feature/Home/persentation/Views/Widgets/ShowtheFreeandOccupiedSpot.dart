import 'package:flutter/material.dart';
import 'package:parkify/Feature/Home/persentation/Views/Widgets/CustomavailabilitySpot.dart';

class ShowtheFreeandOccupiedSpot extends StatelessWidget {
  const ShowtheFreeandOccupiedSpot({
    super.key,
    required this.width,
    required this.heaight,
  });

  final double width;
  final double heaight;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        CustomavailabilitySpot(
          width: width,
          heaight: heaight,
          text: 'Free',
          color: const Color.fromARGB(255, 116, 231, 120),
          NumberSpot: 6,
        ),
        CustomavailabilitySpot(
          width: width,
          heaight: heaight,
          text: 'Occupied',
          color: Colors.red,
          NumberSpot: 2,
        ),
      ],
    );
  }
}
