import 'package:go_router/go_router.dart';
import 'package:parkify/Feature/Splash/peresentation/Views/Splash_View.dart';

abstract class AppRouter {
  static final router = GoRouter(
    routes: [
      GoRoute(
        path: '/',
        builder: (context, state) => const SplashView(),
      ),
    ],
  );
}
