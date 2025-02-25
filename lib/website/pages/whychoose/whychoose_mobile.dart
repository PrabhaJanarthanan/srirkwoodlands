import 'package:flutter/material.dart';
import 'package:profinix_app/website/pages/common_pages/common_mobile.dart';
import 'package:profinix_app/website/utils/constants.dart';

class WhywhatsappMobile extends StatelessWidget {
  const WhywhatsappMobile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CommonMobile(
      'COMMON QUESTION',
      'Why Choose Our Wood Products?',
      'At RK Woodlands, we provide the finest quality wood, carefully selected to meet the needs of construction, furniture making, and decorative pieces. Whether you are building a new home, furnishing an office, or seeking custom wood sculptures, our materials are crafted with precision. Here’s why our wood products stand out in the market.',
      image3,
      false,
    );
  }
}
