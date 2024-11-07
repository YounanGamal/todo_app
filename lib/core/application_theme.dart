import 'package:flutter/material.dart';

class ApplicationTheme {
  static Color primaryLight =Color(0xff5D9CEC);
  static Color primaryDark =Color(0xff5D9CEC);
  static ThemeData lightTheme = ThemeData(
    primaryColor: primaryLight,
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      showSelectedLabels: false,
      showUnselectedLabels: false,
      selectedIconTheme: IconThemeData(size: 30),
      unselectedIconTheme: IconThemeData(size: 30),
      selectedItemColor: primaryLight,
    ),
    scaffoldBackgroundColor: const Color(0xffDFECDB),
    textTheme: const TextTheme(
      titleLarge: TextStyle(
        fontSize: 22,
        fontFamily: 'Poppins',
        fontWeight: FontWeight.bold,
        color: Colors.black,
      ),
      titleMedium: TextStyle(
        fontSize: 20,
        fontFamily: 'Poppins',
        fontWeight: FontWeight.bold,
        color: Colors.black,
      ),
      titleSmall: TextStyle(
        fontSize: 18,
        fontFamily: 'Poppins',
        fontWeight: FontWeight.bold,
        color: Colors.black,
      ),
      bodyLarge: TextStyle(
        fontSize: 20,
        fontFamily: 'Poppins',
        fontWeight: FontWeight.w400,
        color: Colors.white,
      ),
      bodyMedium: TextStyle(
        fontSize: 16,
        fontFamily: 'Poppins',
        fontWeight: FontWeight.w400,
        color: Colors.black,
      ),
      bodySmall: TextStyle(
        fontSize: 16,
        fontFamily: 'Poppins',
        // fontWeight: FontWeight.bold,
        color: Colors.black,
      ),
    ),
  );
  static ThemeData darkTheme = ThemeData(
    scaffoldBackgroundColor: const Color(0xff060E1E),
  );
}
