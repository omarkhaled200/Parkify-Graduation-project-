import 'package:flutter/material.dart';
import 'package:parkify/Core/utlis/assets.dart';

class CustomAmountRickText extends StatelessWidget {
  const CustomAmountRickText({
    super.key,
    required this.item,
  });

  final Map<String, String> item;

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        text: "AMOUNT: ", // First part (bold)
        style: TextStyle(
          fontWeight: FontWeight.w600,
          color: Colors.black, // Default text color
          fontFamily: Assets.textfamily,
          fontSize: 16,
        ),
        children: [
          TextSpan(
            text: item["amount"]!, // Second part (green color)
            style: TextStyle(
              color: Colors.green,
              fontWeight: FontWeight.bold,
              fontFamily: Assets.textfamily,
              fontSize: 16,
            ),
          ),
        ],
      ),
    );
  }
}
