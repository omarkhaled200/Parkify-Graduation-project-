import 'package:flutter/material.dart';
import 'package:flutter_flip_card/controllers/flip_card_controllers.dart';
import 'package:flutter_flip_card/flipcard/flip_card.dart';
import 'package:flutter_flip_card/modal/flip_side.dart';
import 'package:parkify/Feature/Auth/data/Models/user_model/user_model.dart';
import 'package:parkify/Feature/Payment/Home/persentation/Views/Widgets/BackCardPayment.dart';
import 'package:parkify/Feature/Payment/Home/persentation/Views/Widgets/FrontCardpayment.dart';

class FlipCardWidget extends StatelessWidget {
  const FlipCardWidget({
    super.key,
    required this.heaight,
    required this.controller,
    required this.userModel,
  });

  final double heaight;
  final FlipCardController controller;
  final UserModel userModel;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: heaight * 0.31,
      child: FlipCard(
        rotateSide: RotateSide.right,
        controller: controller,
        onTapFlipping: true,
        backWidget: const FrontCardpayment(),
        frontWidget: BackCardPayment(
          user: userModel,
        ),
      ),
    );
  }
}
