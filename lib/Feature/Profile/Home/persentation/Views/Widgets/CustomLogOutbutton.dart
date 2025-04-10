import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:parkify/Core/utlis/App_Router.dart';
import 'package:parkify/Core/utlis/assets.dart';

class CustomLogOutbutton extends StatelessWidget {
  const CustomLogOutbutton({
    super.key,
    required this.heaight,
  });

  final double heaight;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        GoRouter.of(context).push(AppRouter.loginview);
      },
      child: Container(
        padding: const EdgeInsets.all(16),
        height: heaight * 0.1,
        width: MediaQuery.of(context).size.width,
        decoration: const BoxDecoration(
          color: Colors.black,
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(400),
            bottomRight: Radius.circular(400),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Logout',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  fontFamily: Assets.textfamily),
            ),
            const Icon(
              Icons.exit_to_app_rounded,
              size: 24,
              color: Colors.white,
            )
          ],
        ),
      ),
    );
  }
}
