import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:todo_app/core/application_theme.dart';
import 'package:todo_app/core/page_routes_name.dart';
import 'package:todo_app/core/routes_generator.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:todo_app/core/services/loading.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const ToDoApp());
  configLoading();
}



class ToDoApp extends StatelessWidget {
  const ToDoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ApplicationThemeManager.lightTheme,
      darkTheme: ApplicationThemeManager.darkTheme,
      themeMode: ThemeMode.light,
      initialRoute: PageRoutesName.initial,
      onGenerateRoute: RoutesGenerator.onGenerator,
      builder: EasyLoading.init(),
    );
  }
}
