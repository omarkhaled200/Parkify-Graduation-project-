import 'package:flutter/material.dart';
import 'package:parkify/Core/utlis/assets.dart';
import 'package:parkify/constant.dart';

class CustomLocationCard extends StatelessWidget {
  const CustomLocationCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: kprimaryColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        children: [
          ListTile(
            leading: const Icon(Icons.location_on_rounded),
            title: Text(
              "Location",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                fontFamily: Assets.textfamily,
              ),
            ),
            subtitle: Text(
              "Select the location",
              style: TextStyle(
                fontSize: 16,
                fontFamily: Assets.textfamily,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
