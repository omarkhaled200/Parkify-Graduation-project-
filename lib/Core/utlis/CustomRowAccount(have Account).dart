import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:parkify/Core/utlis/assets.dart';

class CustomRowAccount extends StatelessWidget {
  const CustomRowAccount({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text("Don't have Account?",
            style: TextStyle(
                fontFamily: Assets.textfamily,
                fontSize: 18,
                color: Colors.black)),
        TextButton(
          onPressed: () {},
          child: Text(
            "Sign up",
            style: TextStyle(
              color: const Color(0XFF70A2B3),
              fontFamily: Assets.textfamily,
              fontSize: 18,
            ),
          ),
        ),
      ],
    );
  }
}
