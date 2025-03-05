import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:parkify/Core/utlis/assets.dart';
import 'package:parkify/Feature/Splash/peresentation/Views/Widgets/sliding_animation.dart';

class SplashViewbody extends StatefulWidget {
  const SplashViewbody({super.key});

  @override
  State<SplashViewbody> createState() => _SplashViewBodyState();
}

class _SplashViewBodyState extends State<SplashViewbody>
    with SingleTickerProviderStateMixin {
  late AnimationController animationController;
  late Animation<Offset> slidinganimation;

  @override
  void initState() {
    super.initState();
    initSlidingAnimation();

    // navigateToHomeViews();
  }

  @override
  void dispose() {
    super.dispose();
    animationController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Image.asset(
          Assets.logo,
          height: MediaQuery.of(context).size.height * 0.2,
          fit: BoxFit.contain,
        ),
        const SizedBox(
          height: 4,
        ),
        sliding_Animation(),
      ],
    );
  }

  void initSlidingAnimation() {
    animationController =
        AnimationController(vsync: this, duration: const Duration(seconds: 1));

    slidinganimation =
        Tween<Offset>(begin: const Offset(0, 2), end: Offset.zero)
            .animate(animationController);
    animationController.forward();
  }

  // void navigateToHomeViews() {
  //   Future.delayed(const Duration(seconds: 2), () {
  //     GoRouter.of(context).push(AppRouters.kHomeview,);
  //   });
  // }
}
