import 'package:flutter/material.dart';
import 'package:parkify/Core/utlis/App_Router.dart';

void main() {
  runApp(const Parkify());
}

class Parkify extends StatelessWidget {
  const Parkify({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
        routerConfig: AppRouter.router, debugShowCheckedModeBanner: false);
  }
}
