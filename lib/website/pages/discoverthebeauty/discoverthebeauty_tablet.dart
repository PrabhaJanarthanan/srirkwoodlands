import 'package:flutter/material.dart';
import 'package:profinix_app/website/pages/common_pages/common_tablet.dart';
import 'package:profinix_app/website/utils/constants.dart';

class AistudioTablet extends StatelessWidget {
  const AistudioTablet({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CommonTablet(
      'AI-Powered Enhancements',
      'Upgrade Your Designs with our AI Studio',
      '"Once your template is ready, take your design to the next level with AI-powered enhancements. Our intelligent system refines and improves your visuals, ensuring they are optimized for maximum impact. From cropping images to removing backgrounds, and enhancing image quality, AI Studio provides all the tools you need to create polished, professional posters. Whether its sharpening details or improving overall aesthetics, our AI ensures your designs stand out in any campaign."',
      image6,
      true,
    );
  }
}
