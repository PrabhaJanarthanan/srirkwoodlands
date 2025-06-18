import 'package:flutter/material.dart';

import '../../constants/colors.dart';

class SNElevatedButtonTheme {
  SNElevatedButtonTheme._();

  static final lightElevatedButtonTheme = ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
    elevation: 0,
    foregroundColor: Colors.white,
    backgroundColor: SNColors.primaryColor,
    disabledBackgroundColor: Colors.blueGrey,
    disabledForegroundColor: Colors.blueGrey,
    side: const BorderSide(color: SNColors.primaryColor,),
    padding: const EdgeInsets.symmetric(vertical: 18),
    textStyle: const TextStyle(
        fontSize: 16, color: Colors.white, fontWeight: FontWeight.w600),
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
  ));

  //DarkTheme
  static final darkElevatedButtonTheme = ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
    elevation: 0,
    foregroundColor: Colors.white,
    backgroundColor: SNColors.primaryColor,
    disabledBackgroundColor: Colors.blueGrey,
    disabledForegroundColor: Colors.blueGrey,
    side: const BorderSide(color: SNColors.primaryColor),
    padding: const EdgeInsets.symmetric(vertical: 18),
    textStyle: const TextStyle(
        fontSize: 16, color: Colors.white, fontWeight: FontWeight.w600),
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
  ));
}
