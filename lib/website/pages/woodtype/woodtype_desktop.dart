import 'package:flutter/material.dart';
import 'package:profinix_app/website/pages/common_pages/common_desktop.dart';
import 'package:profinix_app/website/utils/constants.dart';

class WorldwideDesktop extends StatelessWidget {
  const WorldwideDesktop({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const CommonDesktop(
      s1: 'Where all it Functions',
      s2: 'Choose Your Preferred Wood Type, and We’ll Customize It for You',
      s3: 'At RK Woodlands, we offer a wide selection of premium wood types for you to choose from. Whether you prefer the richness of Oak, the elegance of Mahogany, or the warmth of Teak, we have it all. Our skilled artisans will work with you to bring your vision to life, customizing each product to fit your exact needs. From size and shape to finish and texture, we ensure your creation is unique and perfectly tailored to your space. Let us craft the perfect wooden product, made just for you',
      image: image5, // Ensure 'image5' is defined in your constants
      imageLeft:
          false, // Set whether the image should be left or right (false for right in this case)
    );
  }
}
