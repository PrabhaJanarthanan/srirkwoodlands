import 'package:flutter/material.dart';

class SNTextTheme {
  SNTextTheme._();

  static TextTheme lightTextTheme = TextTheme(
    headlineLarge: TextStyle(fontSize: 32, fontWeight: FontWeight.bold, color: Colors.black),
    headlineMedium: TextStyle(fontSize: 24, fontWeight: FontWeight.w600, color: Colors.black),
    headlineSmall: TextStyle(fontSize: 18, fontWeight: FontWeight.w600, color: Colors.black),
    titleLarge: TextStyle(fontSize: 16, fontWeight: FontWeight.w600, color: Colors.black),
    titleMedium: TextStyle(fontSize: 16, fontWeight: FontWeight.w500, color: Colors.black),
    titleSmall: TextStyle(fontSize: 16, fontWeight: FontWeight.w400, color: Colors.black),
    bodyLarge: TextStyle(fontSize: 14, fontWeight: FontWeight.w500, color: Colors.black),
    bodyMedium: TextStyle(fontSize: 14, fontWeight: FontWeight.normal, color: Colors.black),
    bodySmall: TextStyle(fontSize: 14, fontWeight: FontWeight.w500, color: Colors.black.withAlpha(128)), // 50% opacity
    labelLarge: TextStyle(fontSize: 12, fontWeight: FontWeight.normal, color: Colors.black),
    labelMedium: TextStyle(fontSize: 12, fontWeight: FontWeight.normal, color: Colors.black), // 50% opacity
  );

  static TextTheme darkTextTheme = TextTheme(
    headlineLarge: TextStyle(fontSize: 32, fontWeight: FontWeight.bold, color: Colors.white),
    headlineMedium: TextStyle(fontSize: 24, fontWeight: FontWeight.w600, color: Colors.white),
    headlineSmall: TextStyle(fontSize: 18, fontWeight: FontWeight.w600, color: Colors.white),
    titleLarge: TextStyle(fontSize: 16, fontWeight: FontWeight.w600, color: Colors.white),
    titleMedium: TextStyle(fontSize: 16, fontWeight: FontWeight.w500, color: Colors.white),
    titleSmall: TextStyle(fontSize: 16, fontWeight: FontWeight.w400, color: Colors.white),
    bodyLarge: TextStyle(fontSize: 14, fontWeight: FontWeight.w500, color: Colors.white),
    bodyMedium: TextStyle(fontSize: 14, fontWeight: FontWeight.normal, color: Colors.white),
    bodySmall: TextStyle(fontSize: 14, fontWeight: FontWeight.w500, color: Colors.white.withAlpha(128)), // 50% opacity
    labelLarge: TextStyle(fontSize: 12, fontWeight: FontWeight.normal, color: Colors.white),
    labelMedium: TextStyle(fontSize: 12, fontWeight: FontWeight.normal, color: Colors.white), // 50% opacity
  );
}
