import 'package:go_router/go_router.dart';
import 'package:parkify/Feature/Home/persentation/Views/Bottom_Naviagation_bar.dart';
import 'package:parkify/Feature/Home/persentation/Views/Home_page2.dart';
import 'package:parkify/Feature/Splash/peresentation/Views/Onboarding_View1.dart';
import 'package:parkify/Feature/Splash/peresentation/Views/Onboarding_View2.dart';
import 'package:parkify/Feature/Splash/peresentation/Views/Splash_View.dart';
import 'package:parkify/Feature/Splash/peresentation/Views/onboarding_View3.dart';

abstract class AppRouter {
  static final onboardinview1 = '/onboarding1';
  static final onboardinview2 = '/onboarding2';
  static final onboardinview3 = '/onboarding3';
  static final bottomNaviagationBar = '/BottomNaviagationBar';
  static final homePage2 = '/homepage2';
  static final router = GoRouter(
    routes: [
      GoRoute(
        path: '/',
        builder: (context, state) => const SplashView(),
      ),
      GoRoute(
        path: onboardinview1,
        builder: (context, state) => const OnboardingView1(),
      ),
      GoRoute(
        path: onboardinview2,
        builder: (context, state) => const OnboardingView2(),
      ),
      GoRoute(
        path: onboardinview3,
        builder: (context, state) => const OnboardingView3(),
      ),
      GoRoute(
        path: bottomNaviagationBar,
        builder: (context, state) => const BottomNaviagationBar(),
      ),
      GoRoute(
        path: homePage2,
        builder: (context, state) => const HomePage2(),
      ),
    ],
  );
}
