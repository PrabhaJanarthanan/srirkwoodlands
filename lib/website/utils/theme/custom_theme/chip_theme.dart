import 'package:flutter/material.dart';

import '../../constants/colors.dart';

class ATChipTheme {
  ATChipTheme._();

  static ChipThemeData lightChipTheme = ChipThemeData(
    disabledColor: SNColors.grey.withAlpha(20),
    labelStyle: const TextStyle(color: SNColors.black),
    selectedColor:SNColors.primaryColor,
    padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
    checkmarkColor: SNColors.white,
  );

  //Darktheme
  static ChipThemeData darkChipTheme = ChipThemeData(
    disabledColor: SNColors.darkerGrey,
    labelStyle: const TextStyle(color:SNColors.white),
    selectedColor: SNColors.primaryColor,
    padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
    checkmarkColor: SNColors.white,
  );
}
