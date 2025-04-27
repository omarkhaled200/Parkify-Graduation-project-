import 'package:flutter/material.dart';
import 'package:parkify/Core/utlis/assets.dart';
import 'package:parkify/constant.dart';

void CustomScaffoldMessenger(context, String text, IconData icon) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      backgroundColor: Colors.black,
      content: Row(
        children: [
          Icon(
            icon,
            color: Colors.red,
          ),
          const SizedBox(
            width: 5,
          ),
          Text(
            text,
            maxLines: 2,
            softWrap: true,
            style: TextStyle(
              fontFamily: Assets.textfamily,
              fontSize: 16,
              fontWeight: FontWeight.w500,
              color: Colors.white,
            ),
            overflow: TextOverflow.ellipsis,
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
