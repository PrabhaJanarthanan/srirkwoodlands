import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:profinix_app/website/pages/privacypolicy/privacycontent.dart';
import 'package:profinix_app/website/widgets/basewidgets.dart';

class PrivacyPolicyTablet extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        title: const ProText(
          'Back',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assets/background/frontbg.png'),
              fit: BoxFit.cover),
        ),
        child: Center(
          child: Container(
            constraints: const BoxConstraints(
                maxWidth: 700), // Adjusted maxWidth for tablet view
            padding: const EdgeInsets.symmetric(
                vertical: 60, horizontal: 40), // Adjusted padding for tablet
            child: const SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ProText(
                    'Privacy Policy',
                    style: TextStyle(
                        fontSize: 22.0, // Reduced font size slightly
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                  SizedBox(height: 15.0), // Adjusted spacing
                  ProText(
                    privacypolicycontent,
                    style: TextStyle(
                        fontSize: 15.0,
                        color: Colors.white), // Reduced font size slightly
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Get.toNamed('/'); // Navigate to Home Page
        },
        child: const Icon(Icons.home),
        backgroundColor: Colors.pinkAccent, // Customize as needed
      ),
    );
  }
}
