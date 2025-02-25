import 'package:flutter/material.dart';
import 'package:profinix_app/website/utils/colors.dart';

ButtonStyle outlinedButtonStyle = OutlinedButton.styleFrom(
  side: BorderSide(color: WebColors.primary),
  backgroundColor: Colors.white,
  shape: RoundedRectangleBorder(
    borderRadius: BorderRadius.circular(8.0),
  ),
);
