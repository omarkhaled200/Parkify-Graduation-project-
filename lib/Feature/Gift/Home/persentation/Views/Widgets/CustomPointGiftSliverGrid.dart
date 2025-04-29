import 'package:flutter/material.dart';
import 'package:parkify/Feature/Gift/Home/persentation/Views/Widgets/ItemPointGift.dart';

class CustomPointGiftSliverGrid extends StatefulWidget {
  const CustomPointGiftSliverGrid({
    super.key,
    required this.controller,
  });
  final ScrollController controller;

  @override
  State<CustomPointGiftSliverGrid> createState() =>
      _CustomPointGiftSliverGridState();
}

class _CustomPointGiftSliverGridState extends State<CustomPointGiftSliverGrid> {
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
          return AnimatedBuilder(
            animation: widget.controller,
            builder: (context, child) {
              double offset = 0;
              if (widget.controller.hasClients) {
                offset = widget.controller.offset / 75 - index;
              }
              offset = offset.clamp(0, 2);
              return Transform.scale(
                scale: 1 - (offset * 0.2),
                child: const ItemPointGift(),
              );
            },
          );
        });
  }
}
