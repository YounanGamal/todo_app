import 'package:flutter/material.dart';
import 'package:todo_app/core/application_theme.dart';
import 'package:todo_app/core/page_routes_name.dart';
import 'package:todo_app/core/routes_generator.dart';
import 'package:todo_app/modules/outh/login/login_view.dart';
import 'package:todo_app/modules/outh/register/register_view.dart';

void main() {
  runApp(const ToDoApp());
}

class ToDoApp extends StatelessWidget {
  const ToDoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ApplicationTheme.lightTheme,
      darkTheme: ApplicationTheme.darkTheme,
      themeMode: ThemeMode.light,
      initialRoute: PageRoutesName.initial,
      onGenerateRoute: RoutesGenerator.onGenerator,
    );
  }
}
