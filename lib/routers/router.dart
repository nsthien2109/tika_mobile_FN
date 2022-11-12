import 'package:flutter/material.dart';
import 'package:tika_store/screens/auth/sign_in_screen.dart';
import 'package:tika_store/screens/navigate/navigate.dart';

class AppRouter {
  static const String introRouter = '/intro';
  static const String mainRouter= '/';
  static const String loginRoute= '/sign_in';
  static const String registerRoute = '/sign_up';
  static const String cartRouter = '/cart'; 


  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {

      case mainRouter:
        return MaterialPageRoute(
          settings: settings,
          builder: (_) => const NavigateView(),
        );
      case loginRoute:
        return MaterialPageRoute(
          settings: settings,
          builder: (_) => const SignInScreen(),
        );
      default:
        return MaterialPageRoute(
          settings: settings,
          builder: (_) => const NavigateView(),
        );
    }
  }
}