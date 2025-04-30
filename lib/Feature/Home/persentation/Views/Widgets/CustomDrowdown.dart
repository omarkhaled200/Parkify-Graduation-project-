import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:parkify/Core/utlis/assets.dart';

class CustomDrowdown extends StatefulWidget {
  CustomDrowdown({
    super.key,
    required this.list,
    required this.selectedPlate,
    required this.text,
    required this.onChanged, // <-- ✅ أضف ده
  });

  String selectedPlate;
  final List<String> list;
  final String text;

  final Function(String) onChanged; // <-- ✅ Define callback

  @override
  State<CustomDrowdown> createState() => _CustomDrowdownState();
}

class _CustomDrowdownState extends State<CustomDrowdown> {
  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField<String>(
      style: TextStyle(
        color: Colors.black,
        fontSize: 18,
        fontWeight: FontWeight.w500,
        fontFamily: Assets.textfamily,
      ),
      icon: const Icon(
        Icons.keyboard_arrow_down_rounded,
        color: Colors.black,
      ),
      iconSize: 26,
      borderRadius: BorderRadius.circular(16),
      decoration: InputDecoration(
        labelText: widget.text,
        labelStyle: TextStyle(
          color: Colors.black,
          fontSize: 18,
          fontWeight: FontWeight.w500,
          fontFamily: Assets.textfamily,
        ),
        enabledBorder: CustomOutlineinputborderdesign(),
        border: CustomOutlineinputborderdesign(),
        focusedBorder: CustomOutlineinputborderdesign(),
      ),
      value: widget.selectedPlate,
      items: widget.list.map((String value) {
        return DropdownMenuItem(
          value: value,
          child: Text(value),
        );
      }).toList(),
      onChanged: (newvalue) {
        setState(() {
          widget.selectedPlate = newvalue!;
        });
        widget.onChanged(newvalue!); // <-- ✅ استدعي الكولباك هنا
      },
    );
  }

  OutlineInputBorder CustomOutlineinputborderdesign() {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(10),
      borderSide: const BorderSide(color: Colors.black, width: 2),
    );
  }
}
