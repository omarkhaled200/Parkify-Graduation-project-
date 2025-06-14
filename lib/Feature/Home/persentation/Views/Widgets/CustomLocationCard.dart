import 'package:flutter/material.dart';
import 'package:parkify/Core/utlis/assets.dart';
import 'package:parkify/Feature/Home/data/Model/location_model/location_model.dart';
import 'package:parkify/constant.dart';

class CustomLocationCard extends StatelessWidget {
  const CustomLocationCard({
    super.key,
    required this.loc,
  });
  final LocationModel loc;
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
              loc.name.toString(),
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                fontFamily: Assets.textfamily,
              ),
            ),
            subtitle: Text(
              loc.address.toString(),
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
