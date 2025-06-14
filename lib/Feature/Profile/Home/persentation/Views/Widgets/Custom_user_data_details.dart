import 'package:flutter/material.dart';
import 'package:parkify/Core/utlis/assets.dart';
import 'package:parkify/constant.dart';

class Custom_user_data_details extends StatelessWidget {
  Custom_user_data_details({
    super.key,
    required this.titledata,
    required this.descdata,
  });

  final String titledata;
  final String descdata;

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return Container(
      padding: const EdgeInsets.only(left: 8),
      alignment: Alignment.centerLeft,
      width: width,
      decoration: BoxDecoration(
        color: kprimaryColor,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Padding(
        padding: const EdgeInsets.all(4.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              titledata,
              style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  fontFamily: Assets.textfamily),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 12.0),
              child: Text(
                descdata,
                style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    fontFamily: Assets.textfamily),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
