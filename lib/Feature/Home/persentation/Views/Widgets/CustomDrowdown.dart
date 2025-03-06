import 'package:flutter/material.dart';
import 'package:parkify/Core/utlis/assets.dart';

class CustomDrowdown extends StatefulWidget {
  CustomDrowdown({super.key, required this.list, required this.selectedPlate});

  String selectedPlate;

  final List<String> list;
  @override
  State<CustomDrowdown> createState() => _CustomDrowdownState();
}

class _CustomDrowdownState extends State<CustomDrowdown> {
  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField<String>(
      decoration: InputDecoration(
        labelText: 'Select License Plate',
        labelStyle: TextStyle(
          color: Colors.black,
          fontSize: 18,
          fontWeight: FontWeight.w400,
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
