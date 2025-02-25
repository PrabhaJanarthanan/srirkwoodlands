import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:profinix_app/website/pages/privacypolicy/privacycontent.dart';
import 'package:profinix_app/website/widgets/basewidgets.dart';

class PrivacyPolicyDesktop extends StatelessWidget {
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
              image: AssetImage('assets/rkbackgroundbrown.png'),
              fit: BoxFit.cover),
        ),
        child: Center(
          child: Container(
            constraints: const BoxConstraints(
                maxWidth: 800), // Adjust maxWidth as needed
            padding: const EdgeInsets.symmetric(vertical: 80, horizontal: 50),
            child: const SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ProText(
                    'Privacy Policy',
                    style: TextStyle(
                        fontSize: 24.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                  SizedBox(height: 20.0),
                  ProText(
                    privacypolicycontent,
                    style: TextStyle(fontSize: 16.0, color: Colors.white),
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
        child: const Icon(
          Icons.home,
          color: Colors.white,
        ),
        backgroundColor:
            Color.fromARGB(255, 233, 156, 13), // Customize as needed
      ),
    );
  }
}
