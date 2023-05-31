import 'package:demoapp/auth/login_screen.dart';
import 'package:demoapp/home/detail_screen.dart';
import 'package:demoapp/home/home_screen.dart';
import 'package:demoapp/utils/constants.dart';
import 'package:demoapp/welcome/welcome_screen.dart';
import 'package:go_router/go_router.dart';

class AppRouter {
  final router = GoRouter(routes: [
    GoRoute(
        name: Constants.welcomeScreenRoute,
        path: "/",
        builder: (context, state) => const WelcomeScreen()),
    GoRoute(
        name: Constants.homeScreenRoute,
        path: "/home",
        builder: (context, state) => const HomeScreen(),
        routes: [
          GoRoute(
            name: Constants.detailScreenRoute,
            path: "detailScreen",
            builder: (context, state) => DetailScreen(
                title: state.queryParameters['title']!,
                image: state.queryParameters['image']!,
                price: state.queryParameters['price']!),
          )
        ]),
    GoRoute(
      name: Constants.loginScreenRoute,
      path: "/login",
      builder: (context, state) => const LoginScreen(),
    )
  ]);
}
