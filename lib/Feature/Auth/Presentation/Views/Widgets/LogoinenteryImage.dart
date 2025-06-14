import 'package:flutter/widgets.dart';
import 'package:parkify/Core/utlis/assets.dart';

class LogoinenteryImage extends StatelessWidget {
  const LogoinenteryImage({
    super.key,
    required this.width,
    required this.heaight,
  });

  final double width;
  final double heaight;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Image.asset(
        Assets.logo,
        width: width * 0.4,
        height: heaight * 0.2,
        fit: BoxFit.contain,
      ),
    );
  }
}
