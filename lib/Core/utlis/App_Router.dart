import 'package:go_router/go_router.dart';
import 'package:parkify/Feature/Auth/Presentation/Views/DataEntry1.dart';
import 'package:parkify/Feature/Auth/Presentation/Views/DataEntry2.dart';
import 'package:parkify/Feature/Auth/Presentation/Views/LoginView.dart';
import 'package:parkify/Feature/Auth/Presentation/Views/SignUpView.dart';
import 'package:parkify/Feature/Home/persentation/Views/Bottom_Naviagation_bar.dart';
import 'package:parkify/Feature/Home/persentation/Views/Home_page2.dart';
import 'package:parkify/Feature/Home/persentation/Views/Home_page_Countdown.dart';
import 'package:parkify/Feature/Home/persentation/Views/Reservation_View.dart';
import 'package:parkify/Feature/Profile/Home/persentation/Views/Edit_Profile.dart';
import 'package:parkify/Feature/Profile/Home/persentation/Views/History_View.dart';
import 'package:parkify/Feature/Profile/Home/persentation/Views/Profile_view.dart';

import 'package:parkify/Feature/Splash/peresentation/Views/Onboarding_View1.dart';
import 'package:parkify/Feature/Splash/peresentation/Views/Onboarding_View2.dart';
import 'package:parkify/Feature/Splash/peresentation/Views/Splash_View.dart';
import 'package:parkify/Feature/Splash/peresentation/Views/onboarding_View3.dart';

abstract class AppRouter {
  static final onboardinview1 = '/onboarding1';
  static final onboardinview2 = '/onboarding2';
  static final onboardinview3 = '/onboarding3';
  static final bottomNaviagationBar = '/BottomNaviagationBar';
  static final reservationpage = '/reservationview';
  static final homePageCountdown = '/homePageCountdown';
  static final loginview = '/loginview';
  static final signupview = '/signupview';
  static final dataentry1view = '/dataentry1view';
  static final dataentry2view = '/dataentry2view';
  static final Homepage2 = '/homepage2';
  static final Editprofile = '/editprofile';
  static final profilepage = '/profilepage';
  static final Historypage = '/historypage';
  static final loginpage = '/loginpage';
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
        path: reservationpage,
        builder: (context, state) => const ReservationView(),
      ),
      GoRoute(
        path: homePageCountdown,
        builder: (context, state) => const HomePageCountdown(),
      ),
      GoRoute(
        path: loginview,
        builder: (context, state) => const Loginview(),
      ),
      GoRoute(
        path: signupview,
        builder: (context, state) => const Signupview(),
      ),
      GoRoute(
        path: dataentry1view,
        builder: (context, state) => const Dataentry1(),
      ),
      GoRoute(
        path: dataentry2view,
        builder: (context, state) => const Dataentry2(),
      ),
      GoRoute(
        path: Homepage2,
        builder: (context, state) => const HomePage2(),
      ),
      GoRoute(
        path: Editprofile,
        builder: (context, state) => const EditProfile(),
      ),
      GoRoute(
        path: profilepage,
        builder: (context, state) => const ProfileView(),
      ),
      GoRoute(
        path: Historypage,
        builder: (context, state) => const HistoryView(),
      ),
    ],
  );
}
