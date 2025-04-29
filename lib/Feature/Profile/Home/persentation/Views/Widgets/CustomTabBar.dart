import 'package:flutter/material.dart';
import 'package:parkify/Core/utlis/assets.dart';

class CustomTabBar extends StatelessWidget {
  const CustomTabBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color.fromARGB(255, 247, 244, 244),
      child: TabBar(
        labelColor: Colors.black,
        unselectedLabelColor: Colors.black,
        labelStyle: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w600,
          fontFamily: Assets.textfamily,
        ),
        indicator: const UnderlineTabIndicator(
          borderSide: BorderSide(width: 4.0, color: Colors.black),
          insets: EdgeInsets.symmetric(horizontal: 8.0),
        ),
        tabs: const [
          Tab(
            text: 'Reservable Spot',
          ),
          Tab(text: 'Public Spots'),
        ],
      ),
    );
  }
}
