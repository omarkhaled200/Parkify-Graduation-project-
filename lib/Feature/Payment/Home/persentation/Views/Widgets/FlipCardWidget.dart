import 'package:flutter/material.dart';
import 'package:flutter_flip_card/controllers/flip_card_controllers.dart';
import 'package:flutter_flip_card/flipcard/flip_card.dart';
import 'package:flutter_flip_card/modal/flip_side.dart';
import 'package:parkify/Feature/Payment/Home/persentation/Views/Widgets/BackCardPayment.dart';
import 'package:parkify/Feature/Payment/Home/persentation/Views/Widgets/FrontCardpayment.dart';

class FlipCardWidget extends StatelessWidget {
  const FlipCardWidget({
    super.key,
    required this.heaight,
    required this.controller,
  });

  final double heaight;
  final FlipCardController controller;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: heaight * 0.31,
      child: FlipCard(
        rotateSide: RotateSide.right,
        controller: controller,
        onTapFlipping: true,
        frontWidget: const FrontCardpayment(),
        backWidget: const BackCardPayment(),
      ),
    );
  }
}
