import 'package:flutter/material.dart';
import 'package:parkify/Core/utlis/assets.dart';

class CustomPostionCarStack extends StatelessWidget {
  const CustomPostionCarStack({
    super.key,
    required this.width,
    required this.height,
  });

  final double width;
  final double height;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height * 0.7,
      child: Stack(
        children: [
          Positioned(
              top: -height * 0.25,
              child: Container(
                width: width,
                height: height * 0.55,
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
                  color: Colors.black.withOpacity(0.8),
                ),
              )),
          Positioned(
            top: height * 0.1,
            child: Center(
              child: Image.asset(
                Assets.pcar,
                height: height * 0.6,
                width: width,
                fit: BoxFit.contain,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
