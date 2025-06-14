import 'package:flutter/material.dart';
import 'package:parkify/Core/utlis/assets.dart';

void CustomScaffoldMessenger(context, String text, IconData icon, Color color) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      backgroundColor: Colors.black,
      content: Row(
        children: [
          Icon(
            icon,
            color: color,
          ),
          const SizedBox(
            width: 5,
          ),
          Expanded(
            child: Text(
              text,
              maxLines: 5,
              style: TextStyle(
                fontFamily: Assets.textfamily,
                fontSize: 16,
                fontWeight: FontWeight.w500,
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
      behavior: SnackBarBehavior.floating,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(24),
      ),
    ),
  );
}
