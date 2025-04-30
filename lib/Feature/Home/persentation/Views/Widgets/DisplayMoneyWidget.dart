import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:parkify/Core/utlis/assets.dart';

class DisplaymoneyWidget extends StatelessWidget {
  const DisplaymoneyWidget({
    super.key,
    required this.width,
    required this.price,
  });

  final double width;
  final double price;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 8.0),
      child: Expanded(
        child: Row(
          children: [
            Container(
              height: 30,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16),
              ),
              child: Row(
                children: [
                  Image.asset(
                    Assets.gold,
                    width: width * 0.1,
                    fit: BoxFit.fill,
                  ),
                  Text(
                    '$price',
                    style: TextStyle(
                        fontFamily: Assets.textfamily,
                        fontSize: 18,
                        fontWeight: FontWeight.w500),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
