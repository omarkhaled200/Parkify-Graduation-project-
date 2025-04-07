import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:parkify/Core/utlis/assets.dart';

class CustomCheckbox extends StatefulWidget {
  const CustomCheckbox({super.key, required this.onChanged});
  final ValueChanged<bool> onChanged; // Callback function
  @override
  State<CustomCheckbox> createState() => _CustomCheckboxState();
}

class _CustomCheckboxState extends State<CustomCheckbox> {
  bool _isChecked = false;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Transform.scale(
          scale: 1.5,
          child: Checkbox(
            value: _isChecked,
            onChanged: (bool? newValue) {
              setState(() => _isChecked = newValue!);
              widget.onChanged(_isChecked);
            },
            activeColor: Colors.black,
          ),
        ),
        Text(
          "I consent that this is my car \n plate number",
          style: TextStyle(
            fontFamily: Assets.textfamily,
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }
}
