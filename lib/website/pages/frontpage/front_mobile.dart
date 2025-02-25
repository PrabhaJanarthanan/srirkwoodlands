import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:profinix_app/website/utils/constants.dart';
import 'package:profinix_app/website/widgets/basewidgets.dart';

class FrontMobile extends GetResponsiveView {
  final VoidCallback scrollToContact;
  final VoidCallback scrollToFeatures;
  final VoidCallback scrollToHome;
  final GlobalKey<ScaffoldState> scaffoldKey; // Changed type
  final Function(int) onNavItemTap;

  FrontMobile({
    Key? key,
    required this.scrollToContact,
    required this.scrollToFeatures,
    required this.scrollToHome,
    required this.onNavItemTap,
    required this.scaffoldKey,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned.fill(
          child: Container(
              // Uncomment the following lines to set a background image
              // child: Image.asset(
              //   'assets/your_background_image.png',
              //   fit: BoxFit.cover,
              // ),
              ),
        ),
        // MobileNavBar(
        //   scrollToContact: scrollToContact,
        //   scrollToFeatures: scrollToFeatures,
        //   scrollToHome: scrollToHome,
        //   onNavItemTap: onNavItemTap, // Pass the onNavItemTap function
        //   scaffoldKey: scaffoldKey,
        // ),
        // Content
        SingleChildScrollView(
          child: Container(
            margin: EdgeInsets.symmetric(horizontal: w! / 20, vertical: 20),
            child: ProColumn(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(height: 30),
                Center(
                  child: Text(
                    'Where craftsmanship meets elegance. Woodwork that lasts a lifetime.',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: w! / 16,
                      fontWeight: FontWeight.bold,
                      height: 1.5,
                      color: Colors.white,
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                const Text(
                  'At Sri RK Woodlands, we specialize in crafting the finest wooden products that blend timeless elegance with durability. Whether you’re furnishing your home or office, our expertly crafted wood items ensure a touch of sophistication in every space. Discover our wide range of products designed to elevate your surroundings with natural beauty and strength.',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                  ),
                ),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // IconButton(
                    //   icon: ShaderMask(
                    //     shaderCallback: (bounds) => const LinearGradient(
                    //       colors: [
                    //         Colors.pinkAccent,
                    //         Colors.blueAccent,
                    //       ],
                    //       begin: Alignment.topLeft,
                    //       end: Alignment.bottomRight,
                    //     ).createShader(bounds),
                    //     child: const Icon(
                    //       Icons.apple,
                    //       size: 40,
                    //       color: Colors.white,
                    //     ),
                    //   ),
                    //   onPressed: () {},
                    // ),
                    // IconButton(
                    //   icon: ShaderMask(
                    //     shaderCallback: (bounds) => const LinearGradient(
                    //       colors: [
                    //         Colors.pinkAccent,
                    //         Colors.blueAccent,
                    //       ],
                    //       begin: Alignment.topLeft,
                    //       end: Alignment.bottomRight,
                    //     ).createShader(bounds),
                    //     child: const Icon(
                    //       Icons.android,
                    //       size: 40,
                    //       color: Colors.white,
                    //     ),
                    //   ),
                    //   onPressed: () {},
                    // ),
                    IconButton(
                      icon: ShaderMask(
                        shaderCallback: (bounds) => const LinearGradient(
                          colors: [
                            Color.fromARGB(255, 233, 156, 13),
                            Color.fromARGB(255, 245, 208, 85),
                          ],
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                        ).createShader(bounds),
                        child: const Icon(
                          Icons.shopping_cart_checkout_outlined,
                          size: 40,
                          color: Colors.white,
                        ),
                      ),
                      onPressed: () {},
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                const Divider(
                  height: 4,
                  color: Colors.white,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
