import 'package:flutter/material.dart';
import 'package:profinix_app/website/pages/common_pages/common_mobile.dart';
import 'package:profinix_app/website/utils/constants.dart';

class WorldwideMobile extends StatelessWidget {
  const WorldwideMobile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CommonMobile(
      'Where all it Functions',
      'Choose your wood type, and we will craft it to perfection for you.',
      '"At RK Woodlands, choose from premium woods like Oak, Mahogany, and Teak. Our artisans customize each piece to your needs, ensuring a unique, perfectly crafted creation for your space."',
      image5,
      false,
    );
  }
}
