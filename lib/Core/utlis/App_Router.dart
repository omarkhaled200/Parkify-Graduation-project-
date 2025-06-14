import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:go_router/go_router.dart';
import 'package:parkify/Feature/Auth/Presentation/Views/DataEntry1.dart';
import 'package:parkify/Feature/Auth/Presentation/Views/LoginView.dart';
import 'package:parkify/Feature/Auth/Presentation/Views/SignUpView.dart';
import 'package:parkify/Feature/Auth/data/Models/user_model/user_model.dart';
import 'package:parkify/Feature/Home/data/Model/location_model/location_model.dart';
import 'package:parkify/Feature/Home/persentation/View_Model/Manage_Page/manage_page_cubit.dart';
import 'package:parkify/Feature/Home/persentation/Views/Bottom_Naviagation_bar.dart';
import 'package:parkify/Feature/Home/persentation/Views/HomePage1.dart';
import 'package:parkify/Feature/Home/persentation/Views/Home_page2.dart';
import 'package:parkify/Feature/Home/persentation/Views/Home_page_Countdown.dart';
import 'package:parkify/Feature/Home/persentation/Views/Reservation_View.dart';
import 'package:parkify/Feature/Profile/Home/persentation/Views/Edit_Profile.dart';
import 'package:parkify/Feature/Profile/Home/persentation/Views/History_View.dart';
import 'package:parkify/Feature/Profile/Home/persentation/Views/Language_Page.dart';
import 'package:parkify/Feature/Profile/Home/persentation/Views/Plates_View.dart';

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
  static final platespage = '/platespage';
  static final loginpage = '/loginpage';
  static final languagepage = '/languagepage';
  static final homepage1 = '/homepage1';
  static final router = GoRouter(
    routes: [
      GoRoute(
        path: '/',
        pageBuilder: (context, state) {
          return CustomTransitionPage(
            key: state.pageKey,
            child: const SplashView(),
            transitionsBuilder:
                (context, animation, secondaryAnimation, child) {
              return FadeTransition(
                opacity: animation,
                child: child,
              );
            },
          );
        },
      ),
      GoRoute(
          path: homepage1,
          pageBuilder: (context, state) {
            final extra = state.extra as UserModel;
            return CustomTransitionPage(
              key: state.pageKey,
              child: Homepage1(userdata: extra),
              transitionsBuilder:
                  (context, animation, secondaryAnimation, child) {
                return FadeTransition(
                  opacity: animation,
                  child: child,
                );
              },
            );
          }),
      GoRoute(
          path: homePageCountdown,
          pageBuilder: (context, state) {
            return CustomTransitionPage(
              key: state.pageKey,
              child: HomePageCountdown(user: state.extra as UserModel),
              transitionsBuilder:
                  (context, animation, secondaryAnimation, child) {
                return FadeTransition(
                  opacity: animation,
                  child: child,
                );
              },
            );
          }),
      GoRoute(
        path: platespage,
        pageBuilder: (context, state) {
          return CustomTransitionPage(
            key: state.pageKey,
            child: const PlatesView(),
            transitionsBuilder:
                (context, animation, secondaryAnimation, child) {
              return FadeTransition(
                opacity: animation,
                child: child,
              );
            },
          );
        },
      ),
      GoRoute(
        path: languagepage,
        pageBuilder: (context, state) {
          return CustomTransitionPage(
            key: state.pageKey,
            child: const LanguagePage(),
            transitionsBuilder:
                (context, animation, secondaryAnimation, child) {
              return FadeTransition(
                opacity: animation,
                child: child,
              );
            },
          );
        },
      ),
      GoRoute(
        path: onboardinview1,
        pageBuilder: (context, state) {
          return CustomTransitionPage(
            key: state.pageKey,
            child: const OnboardingView1(),
            transitionsBuilder:
                (context, animation, secondaryAnimation, child) {
              return FadeTransition(
                opacity: animation,
                child: child,
              );
            },
          );
        },
      ),
      GoRoute(
        path: onboardinview2,
        pageBuilder: (context, state) {
          return CustomTransitionPage(
            key: state.pageKey,
            child: const OnboardingView2(),
            transitionsBuilder:
                (context, animation, secondaryAnimation, child) {
              return FadeTransition(
                opacity: animation,
                child: child,
              );
            },
          );
        },
      ),
      GoRoute(
        path: onboardinview3,
        pageBuilder: (context, state) {
          return CustomTransitionPage(
            key: state.pageKey,
            child: const OnboardingView3(),
            transitionsBuilder:
                (context, animation, secondaryAnimation, child) {
              return FadeTransition(
                opacity: animation,
                child: child,
              );
            },
          );
        },
      ),
      GoRoute(
        path: bottomNaviagationBar,
        builder: (context, state) => const CustomBottomNavigationBar(),
      ),
      GoRoute(
        path: reservationpage,
        pageBuilder: (context, state) {
          return CustomTransitionPage(
            key: state.pageKey,
            child: const ReservationView(),
            transitionsBuilder:
                (context, animation, secondaryAnimation, child) {
              return FadeTransition(
                opacity: animation,
                child: child,
              );
            },
          );
        },
      ),
      GoRoute(
        path: loginview,
        pageBuilder: (context, state) {
          return CustomTransitionPage(
              key: state.pageKey,
              child: const Loginview(),
              transitionsBuilder:
                  (context, animation, secondaryAnimation, child) {
                return FadeTransition(
                  opacity: animation,
                  child: SlideTransition(
                    position: animation.drive(
                      Tween<Offset>(
                        begin: Offset(0, 1),
                        end: Offset.zero,
                      ).chain(CurveTween(curve: Curves.easeInOut)),
                    ),
                    child: child,
                  ),
                );
              });
        },
      ),
      GoRoute(
        path: signupview,
        pageBuilder: (context, state) {
          return CustomTransitionPage(
              key: state.pageKey,
              child: const Signupview(),
              transitionsBuilder:
                  (context, animation, secondaryAnimation, child) {
                return FadeTransition(
                  opacity: animation,
                  child: SlideTransition(
                    position: animation.drive(
                      Tween<Offset>(
                        begin: Offset(0, 1), // من تحت
                        end: Offset.zero,
                      ).chain(CurveTween(curve: Curves.easeInOut)),
                    ),
                    child: child,
                  ),
                );
              });
        },
      ),
      GoRoute(
        path: dataentry1view,
        pageBuilder: (context, state) {
          return CustomTransitionPage(
              key: state.pageKey,
              child: const Dataentry1(),
              transitionsBuilder:
                  (context, animation, secondaryAnimation, child) {
                return FadeTransition(
                  opacity: animation,
                  child: SlideTransition(
                    position: animation.drive(
                      Tween<Offset>(
                        begin: Offset(0, 1), // من تحت
                        end: Offset.zero,
                      ).chain(CurveTween(curve: Curves.easeInOut)),
                    ),
                    child: child,
                  ),
                );
              });
        },
      ),
      GoRoute(
        path: Editprofile,
        pageBuilder: (context, state) {
          return CustomTransitionPage(
              key: state.pageKey,
              child: const EditProfile(),
              transitionsBuilder:
                  (context, animation, secondaryAnimation, child) {
                return FadeTransition(
                  opacity: animation,
                  child: SlideTransition(
                    position: animation.drive(
                      Tween<Offset>(
                        begin: Offset(0, 1), // من تحت
                        end: Offset.zero,
                      ).chain(CurveTween(curve: Curves.easeInOut)),
                    ),
                    child: child,
                  ),
                );
              });
        },
      ),
      GoRoute(
        path: Historypage,
        pageBuilder: (context, state) {
          return CustomTransitionPage(
            key: state.pageKey,
            child: HistoryView(token: state.extra as String),
            transitionsBuilder:
                (context, animation, secondaryAnimation, child) {
              return FadeTransition(
                opacity: animation,
                child: child,
              );
            },
          );
        },
      ),
      GoRoute(
        path: Homepage2,
        pageBuilder: (context, state) {
          return CustomTransitionPage(
            key: state.pageKey,
            child: const HomePage2(),
            transitionsBuilder:
                (context, animation, secondaryAnimation, child) {
              return FadeTransition(
                opacity: animation,
                child: child,
              );
            },
          );
        },
      ),
    ],
  );
}
