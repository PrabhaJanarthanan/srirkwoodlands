import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:profinix_app/website/utils/colors.dart';

class FooterTablet extends StatefulWidget {
  const FooterTablet({super.key});

  @override
  State<FooterTablet> createState() => _FooterTabletState();
}

class _FooterTabletState extends State<FooterTablet> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          // image: DecorationImage(
          //   image: AssetImage('assets/background/commoncontainerback.png'),
          //   fit: BoxFit.cover,
          // ),
          ),
      padding: const EdgeInsets.symmetric(
          vertical: 30, horizontal: 40), // Adjusted padding
      width: double.maxFinite,
      alignment: Alignment.center,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Text(
            '© 2024 Profinix Technologies, Inc.',
            style: TextStyle(
              fontSize: 22, // Slightly increased font size for tablet
              fontWeight: FontWeight.w400,
              color: Colors.white,
            ),
          ),
          const SizedBox(height: 20),
          Wrap(
            // Changed to Wrap for better alignment on tablet
            alignment: WrapAlignment.center,
            spacing: 40, // Increased spacing for better readability
            runSpacing: 10,
            children: [
              InkWell(
                onTap: () {
                  Get.toNamed('/privacypolicy');
                },
                child: const Text(
                  'Privacy Policy',
                  style: TextStyle(
                    color: Colors.white,
                    decoration: TextDecoration.underline,
                    decorationColor: Colors.pinkAccent,
                    fontSize: 18, // Increased font size
                  ),
                ),
              ),
              InkWell(
                onTap: () {
                  Get.toNamed('/termsandconditions');
                },
                child: const Text(
                  'Terms and Conditions',
                  style: TextStyle(
                    color: Colors.white,
                    decoration: TextDecoration.underline,
                    decorationColor: Colors.pinkAccent,
                    fontSize: 18,
                  ),
                ),
              ),
              InkWell(
                onTap: () {
                  Get.toNamed('/returnsrefund');
                },
                child: const Text(
                  'Refund Policy',
                  style: TextStyle(
                    color: Colors.white,
                    decoration: TextDecoration.underline,
                    decorationColor: Colors.pinkAccent,
                    fontSize: 18,
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
