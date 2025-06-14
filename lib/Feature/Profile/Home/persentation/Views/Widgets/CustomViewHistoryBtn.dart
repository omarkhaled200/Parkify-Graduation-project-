import 'package:flutter/material.dart';
import 'package:parkify/Core/utlis/assets.dart';
import 'package:parkify/constant.dart';

class CustomViewHistoryBtn extends StatelessWidget {
  const CustomViewHistoryBtn({
    super.key,
    required this.width,
    required this.heaight,
    required this.text,
    this.onpressed,
    this.icon,
  });

  final double width;
  final double heaight;
  final String text;
  final void Function()? onpressed;
  final IconData? icon;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
          alignment: Alignment.centerLeft,
          minimumSize: Size(width * 0.9, heaight * 0.1),
          backgroundColor: kprimaryColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          )),
      onPressed: onpressed,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              icon != null
                  ? Icon(
                      icon,
                      color: Colors.black,
                      size: 26,
                    )
                  : const SizedBox.shrink(),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Text(
                  text,
                  style: TextStyle(
                      fontSize: 20,
                      color: Colors.black,
                      fontFamily: Assets.textfamily,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
          const Icon(
            Icons.arrow_forward_ios_rounded,
            size: 24,
            color: Colors.black,
          )
        ],
      ),
    );
  }
}
