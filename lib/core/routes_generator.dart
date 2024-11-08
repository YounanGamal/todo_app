import 'package:flutter/material.dart';
import 'package:todo_app/core/page_routes_name.dart';
import 'package:todo_app/modules/layout_view.dart';
import 'package:todo_app/modules/setttings/settings_view.dart';

import 'package:todo_app/modules/splash/splash_view.dart';
import 'package:todo_app/modules/tesks/tasks_view.dart';

import '../modules/auth/login/login_view.dart';
import '../modules/auth/register/register_view.dart';

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
      case PageRoutesName.layout:
        return MaterialPageRoute(
          builder: (context) => LayoutView(),
          settings: settings,
        ); case PageRoutesName.tasks:
        return MaterialPageRoute(
          builder: (context) => TasksView(),
          settings: settings,
        );
      case PageRoutesName.settings:
        return MaterialPageRoute(
          builder: (context) => SettingsView(),
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
