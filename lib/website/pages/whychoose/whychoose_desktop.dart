import 'package:flutter/material.dart';
import 'package:profinix_app/website/pages/common_pages/common_desktop.dart';
import 'package:profinix_app/website/utils/constants.dart';

class WhywhatsappDesktop extends StatefulWidget {
  const WhywhatsappDesktop({Key? key}) : super(key: key);

  @override
  _WhywhatsappDesktopState createState() => _WhywhatsappDesktopState();
}

class _WhywhatsappDesktopState extends State<WhywhatsappDesktop> {
  @override
  Widget build(BuildContext context) {
    return const CommonDesktop(
      s1: 'COMMON QUESTION',
      s2: 'Why Choose Our Wood Products?',
      s3: 'At RK Woodlands, we provide the finest quality wood, carefully selected to meet the needs of construction, furniture making, and decorative pieces. Whether you are building a new home, furnishing an office, or seeking custom wood sculptures, our materials are crafted with precision. Here’s why our wood products stand out in the market:',
      image: image3,
      imageLeft: false,
      addData: true,
    );
  }
}
