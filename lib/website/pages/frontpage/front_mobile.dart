import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../utils/helpers/helper_functions.dart';

class FrontMobile extends StatefulWidget {
  final VoidCallback scrollToContact;
  final VoidCallback scrollToFeatures;
  final VoidCallback scrollToHome;

  FrontMobile({
    Key? key,
    required this.scrollToContact,
    required this.scrollToFeatures,
    required this.scrollToHome,
  }) : super(key: key);

  @override
  _FrontMobileState createState() => _FrontMobileState();
}

class _FrontMobileState extends State<FrontMobile>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _fadeAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 3),
      vsync: this,
    );

    _fadeAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Curves.easeInOut,
      ),
    );

    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = Get.width;
    final dark = SNHelperFunctions.isDarkMode(context);

    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 20),
        child: FadeTransition(
          opacity: _fadeAnimation,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 20),

              // Saree Type Circles in a wrap for responsiveness
              Wrap(
                spacing: 20,
                runSpacing: 20,
                alignment: WrapAlignment.center,
                children: [
                  buildSareeCircle(
                    'assets/sarees/ownimage1.png',
                    'Cotton Sarees',
                    dark,
                    () => Get.toNamed('/bridalCollectionsmobile')
                  ),
                  buildSareeCircle(
                    'assets/sarees/ownimage2.png',
                    'Silk Sarees',
                    dark,
                    () => Get.toNamed('/bridalCollectionsmobile', )
                  ),
                  buildSareeCircle(
                    'assets/sarees/ownimage3.png',
                    'Salwar Suits',
                    dark,
                    () => Get.toNamed('/bridalCollectionsmobile')
                  ),
                  buildSareeCircle(
                    'assets/sarees/ownimage4.png',
                    'Daily Wear',
                    dark,
                    () => Get.toNamed('/bridalCollectionsmobile')
                  ),
                ],
              ),

              const SizedBox(height: 40),
              // You can add navigation buttons or scroll triggers here if needed
            ],
          ),
        ),
      ),
    );
  }

  /// Circle image with label
  Widget buildSareeCircle(String imagePath, String label, bool dark, VoidCallback onTap) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: 130,
            height: 130,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(color: dark ? Colors.white : Colors.amberAccent, width: 1.5),
              image: DecorationImage(
                image: AssetImage(imagePath),
                fit: BoxFit.cover,
              ),
            ),
          ),
          const SizedBox(height: 6),
          Text(
            label,
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 12),
          ),
        ],
      ),
    );
  }
}
