import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:parkify/Core/utlis/assets.dart';
import 'package:parkify/Feature/Payment/Home/data/Model/transaction_history/transaction_history.dart';

class CustomTransactionHistory extends StatelessWidget {
  const CustomTransactionHistory({
    super.key,
    required this.heaight,
    required this.width,
    required this.history,
  });

  final double heaight;
  final double width;
  final TransactionHistory history;

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
                    '${history.completedAt}',
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      fontFamily: Assets.textfamily,
                    ),
                  ),
                  SizedBox(
                    width: width * 0.04,
                  ),
                  Icon(
                    FontAwesomeIcons.solidCircleCheck,
                    color: Colors.green,
                  ),
                  SizedBox(
                    width: width * 0.04,
                  ),
                  Expanded(
                    child: Text(
                      '${history.message}',
                      maxLines: 4,
                      // overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        fontFamily: Assets.textfamily,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
