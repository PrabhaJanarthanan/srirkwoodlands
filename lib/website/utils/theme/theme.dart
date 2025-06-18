
import 'package:flutter/material.dart';

import 'custom_theme/appbar_theme.dart';
import 'custom_theme/bottom_sheet_theme.dart';
import 'custom_theme/checkbox_theme.dart';
import 'custom_theme/chip_theme.dart';
import 'custom_theme/elevated_button_theme.dart';
import 'custom_theme/outline_button_theme.dart';
import 'custom_theme/text_field_theme.dart';
import 'custom_theme/text_theme.dart';

class SNWebsiteTheme {
  SNWebsiteTheme._();

  static ThemeData lightTheme = ThemeData(
    useMaterial3: true,
    fontFamily: 'Poppins',
    brightness: Brightness.light,
    primaryColor: Colors.amber,
    scaffoldBackgroundColor: Colors.white,
    textTheme: SNTextTheme.lightTextTheme,
    elevatedButtonTheme: SNElevatedButtonTheme.lightElevatedButtonTheme,
    chipTheme: ATChipTheme.lightChipTheme,
    appBarTheme: SNAppBarTheme.lightAppBarTheme,
    checkboxTheme: ATCheckboxTheme.lightCheckboxTheme,
    bottomSheetTheme: ATBottomSheetTheme.lightBottomSheetTheme,
    outlinedButtonTheme: ATOutlineButtonTheme.lightOutlineButtonTheme,
    inputDecorationTheme: ATTextFormFieldTheme.lightInputDecorationTheme,
  );
  static ThemeData darkTheme = ThemeData(
    useMaterial3: true,
    fontFamily: 'Poppins',
    brightness: Brightness.dark,
    primaryColor: Colors.amber,
    scaffoldBackgroundColor: Colors.black,
    textTheme: SNTextTheme.darkTextTheme,
    elevatedButtonTheme: SNElevatedButtonTheme.darkElevatedButtonTheme,
    chipTheme: ATChipTheme.darkChipTheme,
    appBarTheme: SNAppBarTheme.darkAppBarTheme,
    checkboxTheme: ATCheckboxTheme.darkCheckboxTheme,
    bottomSheetTheme: ATBottomSheetTheme.darkBottomSheetTheme,
    outlinedButtonTheme: ATOutlineButtonTheme.darkOutlineButtonTheme,
    inputDecorationTheme: ATTextFormFieldTheme.darkInputDecorationTheme,
  );
}
