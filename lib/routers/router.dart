import 'package:flutter/material.dart';
import 'package:tika_store/models/category.dart';
import 'package:tika_store/models/product.dart';
import 'package:tika_store/screens/auth/sign_in_screen.dart';
import 'package:tika_store/screens/auth/sign_up_screen.dart';
import 'package:tika_store/screens/detail/detail_screen.dart';
import 'package:tika_store/screens/navigate/navigate.dart';
import 'package:tika_store/screens/product_by_category/product_by_category.dart';
import 'package:tika_store/screens/profile/ProfileChangeInformation/profile_change_info.dart';
import 'package:tika_store/screens/search/seach_screen.dart';

class AppRouter {
  static const String introRouter = '/intro';
  static const String mainRouter= '/';
  static const String signInRoute = '/sign_in';
  static const String signUpRoute = '/sign_up';
  static const String searchRouter = '/search';
  static const String detailRouter = '/detail'; 
  static const String categoryRouter = '/category';
  static const String changeProfileInfo = '/edit_profile_info';  
  static const String cartRouter = '/cart'; 


  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {

      case mainRouter:
        return MaterialPageRoute(
          settings: settings,
          builder: (_) => const NavigateView(),
        );
      case signInRoute:
        return MaterialPageRoute(
          settings: settings,
          builder: (_) => const SignInScreen(),
        );
      case signUpRoute:
        return MaterialPageRoute(
          settings: settings,
          builder: (_) => const SignUpScreen(),
        );
      case searchRouter:
        return MaterialPageRoute(
          settings: settings,
          builder: (_) => const SearchScreen(),
        );
      case detailRouter:
        return MaterialPageRoute(
          settings: settings,
          builder: (_) => DetailScreen(product: settings.arguments as DataProduct),
        );
      case categoryRouter:
        return MaterialPageRoute(
          settings: settings,
          builder: (_) => ProductByCategory(category: settings.arguments as DataCategory),
        );
      case changeProfileInfo:
        return MaterialPageRoute(
          settings: settings,
          builder: (_) => ProfileChangeInfo(),
        );
      default:
        return MaterialPageRoute(
          settings: settings,
          builder: (_) => const NavigateView(),
        );
    }
  }
}