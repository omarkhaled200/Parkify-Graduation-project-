import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:parkify/Core/utlis/assets.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField(
      {super.key,
      required this.hintText,
      this.prefixIcon,
      this.obscureText = false,
      this.suffixIcon,
      this.hintcolor,
      this.textcolor});

  final String hintText;
  final IconData? prefixIcon;
  final IconData? suffixIcon;
  final bool obscureText;
  final Color? hintcolor;
  final Color? textcolor;
  @override
  Widget build(BuildContext context) {
    return TextField(
      cursorColor: const Color(0xffA0A0A0),
      style: TextStyle(
        color: textcolor,
        fontFamily: Assets.textfamily,
        fontSize: 20,
        fontWeight: FontWeight.w500,
      ),
      obscureText: obscureText,
      decoration: InputDecoration(
        prefixIcon: prefixIcon != null
            ? Icon(
                prefixIcon,
                color: Colors.grey,
                size: 24,
              )
            : null,
        suffixIcon: suffixIcon != null
            ? IconButton(
                onPressed: () {},
                icon: Icon(
                  suffixIcon,
                  size: 24,
                ),
                color: Colors.grey,
              )
            : null,
        hintText: hintText,
        hintStyle: TextStyle(
          color: hintcolor,
          fontFamily: Assets.textfamily,
          fontSize: 20,
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
