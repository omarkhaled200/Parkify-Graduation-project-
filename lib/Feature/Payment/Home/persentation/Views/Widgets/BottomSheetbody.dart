import 'package:flutter/material.dart';
import 'package:parkify/Core/utlis/CustomButton.dart';
import 'package:parkify/Core/utlis/CustomTextField.dart';
import 'package:parkify/Core/utlis/assets.dart';

class BottomSheetbody extends StatelessWidget {
  const BottomSheetbody({super.key});

  @override
  Widget build(BuildContext context) {
    var heaight = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            'Tap here to top up your account balance and enjoy uninterrupted access ❤️!',
            style: TextStyle(
              color: Colors.white,
              fontSize: 20,
              fontWeight: FontWeight.w600,
              fontFamily: Assets.textfamily,
            ),
            textAlign: TextAlign.center,
          ),
          SizedBox(
            height: heaight * 0.02,
          ),
          CustomTextField(
            textcolor: Colors.white,
            hintcolor: Colors.white.withOpacity(0.5),
            hintText: 'Enter Amount',
            prefixIcon: Icons.attach_money_outlined,
          ),
          SizedBox(
            height: heaight * 0.1,
          ),
          CustomButton(
            width: width,
            heaight: heaight,
            text: 'Transfer',
            onPressed: () {},
            backcolor: const Color(0xff1D5CD1),
          ),
        ],
      ),
    );
  }
}
