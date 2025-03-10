import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:parkify/Core/utlis/assets.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField(
      {super.key,
      required this.hintText,
      required this.prefixIcon,
      this.obscureText = false,
      this.suffixIcon});

  final String hintText;
  final IconData prefixIcon;
  final IconData? suffixIcon;
  final bool obscureText;
  @override
  Widget build(BuildContext context) {
    return TextField(
      cursorColor: const Color(0xffA0A0A0),
      style: TextStyle(
        fontFamily: Assets.textfamily,
        fontSize: 20,
        fontWeight: FontWeight.w500,
      ),
      obscureText: obscureText,
      decoration: InputDecoration(
        prefixIcon: Icon(
          prefixIcon,
          color: Colors.grey,
          size: 28,
        ),
        suffixIcon: IconButton(
          onPressed: () {},
          icon: Icon(
            suffixIcon,
            size: 28,
          ),
          color: Colors.grey,
        ),
        hintText: hintText,
        hintStyle: TextStyle(
          fontFamily: Assets.textfamily,
          fontSize: 22,
          fontWeight: FontWeight.w600,
        ),
        enabledBorder: OutlineinputBorder(),
        border: OutlineinputBorder(),
        focusedBorder: OutlineinputBorder(),
      ),
    );
  }

  OutlineInputBorder OutlineinputBorder() {
    return OutlineInputBorder(
      borderSide: const BorderSide(color: Color(0xffA0A0A0), width: 2),
      borderRadius: BorderRadius.circular(10),
    );
  }
}
