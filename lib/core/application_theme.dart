// import 'package:flutter/material.dart';
//
// class ApplicationTheme {
//   static Color primaryLight =Color(0xff5D9CEC);
//   static Color primaryDark =Color(0xff5D9CEC);
//   static ThemeData lightTheme = ThemeData(
//     primaryColor: primaryLight,
//     bottomNavigationBarTheme: BottomNavigationBarThemeData(
//       showSelectedLabels: false,
//       showUnselectedLabels: false,
//       selectedIconTheme: IconThemeData(size: 30),
//       unselectedIconTheme: IconThemeData(size: 30),
//       selectedItemColor: primaryLight,
//     ),
//     scaffoldBackgroundColor: const Color(0xffDFECDB),
//     textTheme: const TextTheme(
//       titleLarge: TextStyle(
//         fontSize: 22,
//         fontFamily: 'Poppins',
//         fontWeight: FontWeight.bold,
//         color: Colors.black,
//       ),
//       titleMedium: TextStyle(
//         fontSize: 20,
//         fontFamily: 'Poppins',
//         fontWeight: FontWeight.bold,
//         color: Colors.black,
//       ),
//       titleSmall: TextStyle(
//         fontSize: 18,
//         fontFamily: 'Poppins',
//         fontWeight: FontWeight.bold,
//         color: Colors.black,
//       ),
//       bodyLarge: TextStyle(
//         fontSize: 20,
//         fontFamily: 'Poppins',
//         fontWeight: FontWeight.w400,
//         color: Colors.white,
//       ),
//       bodyMedium: TextStyle(
//         fontSize: 16,
//         fontFamily: 'Poppins',
//         fontWeight: FontWeight.w400,
//         color: Colors.black,
//       ),
//       bodySmall: TextStyle(
//         fontSize: 16,
//         fontFamily: 'Poppins',
//         // fontWeight: FontWeight.bold,
//         color: Colors.black,
//       ),
//     ),
//   );
//   static ThemeData darkTheme = ThemeData(
//     scaffoldBackgroundColor: const Color(0xff060E1E),
//   );
// }
import 'package:flutter/material.dart';

class ApplicationThemeManager {
  static const Color primaryColor = Color(0xFF5D9CEC);
  static ThemeData lightTheme = ThemeData(
    primaryColor: primaryColor,
    scaffoldBackgroundColor: const Color(
      0xFFDFECDB,
    ),
    floatingActionButtonTheme: FloatingActionButtonThemeData(
        backgroundColor: primaryColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(50),
          side: const BorderSide(
            color: Colors.white,
            width: 4,
          ),
        )),
    bottomAppBarTheme: const BottomAppBarTheme(
      color: Colors.white,
      padding: EdgeInsets.zero,
    ),
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      elevation: 0,
      type: BottomNavigationBarType.fixed,
      backgroundColor: Colors.transparent,
      showSelectedLabels: false,
      // selectedItemColor: primaryColor,
      selectedIconTheme: IconThemeData(
        color: primaryColor,
        size: 38,
      ),
      showUnselectedLabels: false,
      unselectedIconTheme: IconThemeData(
        color: Color(0xFFC8C9CB),
        size: 34,
      ),
    ),
    textTheme: const TextTheme(
      titleLarge: TextStyle(
        fontFamily: "Poppins",
        fontSize: 22,
        fontWeight: FontWeight.bold,
        color: Colors.white,
      ),
      bodyLarge: TextStyle(
        fontFamily: "Poppins",
        fontSize: 20,
        fontWeight: FontWeight.w400,
        color: Colors.black,
      ),
      bodyMedium: TextStyle(
        fontFamily: "Poppins",
        fontSize: 18,
        fontWeight: FontWeight.bold,
        color: Colors.black,
      ),
      bodySmall: TextStyle(
        fontFamily: "Poppins",
        fontSize: 14,
        fontWeight: FontWeight.bold,
        color: Colors.black,
      ),
      displayLarge: TextStyle(
        fontFamily: "Poppins",
        fontSize: 15,
        fontWeight: FontWeight.bold,
        color: Colors.black,
      ),
    ),
  );

  static ThemeData darkTheme = ThemeData(
    primaryColor: primaryColor,
    scaffoldBackgroundColor: const Color(0xFF060E1E),
    bottomAppBarTheme: const BottomAppBarTheme(
      color: Color(0xFF141922),
      padding: EdgeInsets.zero,
    ),
    floatingActionButtonTheme: FloatingActionButtonThemeData(
        backgroundColor: primaryColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(50),
          side: const BorderSide(
            color: Color(0xFF060E1E),
            width: 4,
          ),
        )),
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      elevation: 0,
      type: BottomNavigationBarType.fixed,
      backgroundColor: Colors.transparent,
      showSelectedLabels: false,
      // selectedItemColor: primaryColor,
      selectedIconTheme: IconThemeData(
        color: primaryColor,
        size: 38,
      ),
      showUnselectedLabels: false,
      unselectedIconTheme: IconThemeData(
        color: Color(0xFFC8C9CB),
        size: 34,
      ),
    ),
    textTheme: const TextTheme(
      titleLarge: TextStyle(
        fontFamily: "Poppins",
        fontSize: 22,
        fontWeight: FontWeight.bold,
        color: Colors.white,
      ),
      bodyLarge: TextStyle(
        fontFamily: "Poppins",
        fontSize: 20,
        fontWeight: FontWeight.w400,
        color: Colors.white,
      ),
      bodyMedium: TextStyle(
        fontFamily: "Poppins",
        fontSize: 18,
        fontWeight: FontWeight.bold,
        color: Colors.white,
      ),
      bodySmall: TextStyle(
        fontFamily: "Poppins",
        fontSize: 14,
        fontWeight: FontWeight.bold,
        color: Colors.white,
      ),
      displayLarge: TextStyle(
        fontFamily: "Poppins",
        fontSize: 15,
        fontWeight: FontWeight.bold,
        color: Colors.black,
      ),
    ),
  );
}