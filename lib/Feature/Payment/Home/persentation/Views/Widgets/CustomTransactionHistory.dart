import 'package:flutter/material.dart';
import 'package:parkify/Core/utlis/assets.dart';

class CustomTransactionHistory extends StatelessWidget {
  const CustomTransactionHistory({
    super.key,
    required this.heaight,
    required this.width,
  });

  final double heaight;
  final double width;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: heaight * 0.13,
          child: Stack(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    'Mar. 17',
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      fontFamily: Assets.textfamily,
                    ),
                  ),
                  SizedBox(
                    width: width * 0.05,
                  ),
                  Container(
                    width: 20,
                    height: 20,
                    decoration: BoxDecoration(
                      color: Color(0xffD9D9D9),
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  SizedBox(
                    width: width * 0.05,
                  ),
                  Text(
                    'The top-up was successful,\n and the amount of  \$1000 \n is now in his account.',
                    maxLines: 3,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      fontFamily: Assets.textfamily,
                    ),
                  ),
                ],
              ),
              Positioned(
                top: heaight * 0.062,
                left: width * 0.203,
                child: const SizedBox(
                  height: 70,
                  child: VerticalDivider(
                    indent: 2,
                    color: Colors.black,
                    thickness: 1.5,
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
