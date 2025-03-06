import 'package:flutter/material.dart';
import 'package:parkify/Core/utlis/assets.dart';

class CustomCarimageStack extends StatelessWidget {
  const CustomCarimageStack({
    super.key,
    required this.width,
    required this.height,
  });

  final double width;
  final double height;

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      Center(
          child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Container(
          width: width,
          height: height * 0.5,
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.2),
                spreadRadius: 5,
                blurRadius: 7,
                offset: Offset(0, 3),
              ),
            ],
            borderRadius: BorderRadius.circular(width * 0.5),
            color: Colors.white,
          ),
        ),
      )),
      Positioned(
        left: -width * 0.2,
        child: Image.asset(
          Assets.car,
          height: height * 0.6,
          width: width,
          fit: BoxFit.contain,
        ),
      )
    ]);
  }
}
