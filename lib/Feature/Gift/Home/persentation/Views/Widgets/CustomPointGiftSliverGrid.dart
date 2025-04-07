import 'package:flutter/material.dart';
import 'package:parkify/Core/utlis/assets.dart';
import 'package:parkify/Feature/Gift/Home/persentation/Views/Widgets/ItemPointGift.dart';
import 'package:parkify/constant.dart';

class CustomPointGiftSliverGrid extends StatelessWidget {
  const CustomPointGiftSliverGrid({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SliverGrid.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 5,
          mainAxisSpacing: 10,
          childAspectRatio: 1.5,
        ),
        itemCount: 50,
        itemBuilder: (context, index) {
          return const ItemPointGift();
        });
  }
}
