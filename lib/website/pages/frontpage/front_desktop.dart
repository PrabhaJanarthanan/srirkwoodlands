import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../utils/helpers/helper_functions.dart';

class FrontDesktop extends StatefulWidget {
  final VoidCallback scrollToContact;
  final VoidCallback scrollToFeatures;
  final VoidCallback scrollToHome;

  FrontDesktop({
    Key? key,
    required this.scrollToContact,
    required this.scrollToFeatures,
    required this.scrollToHome,
  }) : super(key: key);

  @override
  _FrontDesktopState createState() => _FrontDesktopState();
}

class _FrontDesktopState extends State<FrontDesktop>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _fadeAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 5),
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
    double screenWidth = Get.width;

    return Stack(
      children: [
        Positioned(
          top: 0,
          left: 0,
          right: 0,
          child: Container(),
        ),
        Container(
          height: 200, // Increased height to fit image circles
          margin:
              EdgeInsets.symmetric(horizontal: screenWidth / 10, vertical: 20),
          child: Row(
            children: [
              Expanded(
                child: FadeTransition(
                  opacity: _fadeAnimation,
                  child: Container(
                    padding: const EdgeInsets.only(bottom: 20.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                   
                    
             
                        const SizedBox(height: 50),

                        // Saree Type Circles
                        Wrap(
                          spacing: 30,
                          runSpacing: 30,
                          alignment: WrapAlignment.center,
                          children: [
                            buildSareeCircle(
                              'assets/sarees/kalamkarisaree.png',
                              'Shop Cotton Sarees',
                            ),
                            buildSareeCircle(
                              'assets/sarees/cottonsaree.png',
                              'Shop Designer Sarees',
                            ),
                            buildSareeCircle(
                              'assets/sarees/fancysaree.png',
                              'Shop Fancy Sarees',
                            ),
                            buildSareeCircle(
                              'assets/sarees/banarasisaree.png',
                              'Shop Semi Banarasi',
                            ),
                           
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  /// Circle image with label below
  Widget buildSareeCircle(String imagePath, String label) {
    final dark = SNHelperFunctions.isDarkMode(context);
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          width: 100,
          height: 100,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(color: dark? Colors.white : Colors.black, width: 2),
            image: DecorationImage(
              image: AssetImage(imagePath),
              fit: BoxFit.cover,
            ),
          ),
        ),
        const SizedBox(height: 8),
        Text(
          label,
         
        ),
      ],
    );
  }
}
