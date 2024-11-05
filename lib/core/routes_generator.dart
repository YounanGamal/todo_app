import 'package:flutter/material.dart';
import 'package:todo_app/core/page_routes_name.dart';
import 'package:todo_app/modules/outh/login/login_view.dart';
import 'package:todo_app/modules/outh/register/register_view.dart';
import 'package:todo_app/modules/splash/splash_view.dart';

class RoutesGenerator {
  static Route<dynamic> onGenerator(RouteSettings settings) {
    switch (settings.name) {
      case PageRoutesName.initial:
        return MaterialPageRoute(
          builder: (context) => const SplashView(),
          settings: settings,
        );
      case PageRoutesName.login:
        return MaterialPageRoute(
          builder: (context) => LoginView(),
          settings: settings,
        );
      case PageRoutesName.register:
        return MaterialPageRoute(
          builder: (context) => RegisterView(),
          settings: settings,
        );
      default:
        return MaterialPageRoute(
          builder: (context) => const SplashView(),
          settings: settings,
        );
    }
  }
}
