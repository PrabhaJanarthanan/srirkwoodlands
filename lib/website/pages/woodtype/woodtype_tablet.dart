import 'package:flutter/material.dart';
import 'package:profinix_app/website/pages/common_pages/common_tablet.dart';
import 'package:profinix_app/website/utils/constants.dart';

class WorldwideTablet extends StatelessWidget {
  const WorldwideTablet({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CommonTablet(
      'Where all it Functions',
      'It Functions Internationally',
      '"Our platform operates seamlessly on a global scale, offering reliable connectivity and consistent service to users worldwide. With a strong infrastructure and expansive reach, we ensure our solution performs effectively across diverse regions, meeting the needs of a global audience. Our commitment to international functionality ensures reliable performance and connectivity, empowering users to stay connected and productive."',
      image5,
      false,
    );
  }
}
