import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:profinix_app/website/pages/refundpolicy/refund_content.dart';
import 'package:profinix_app/website/widgets/basewidgets.dart';

class RefundMobile extends StatelessWidget {
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
        title: const Text(
          "Back",
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assets/rkbackground.png'), fit: BoxFit.cover),
        ),
        child: Center(
          child: Container(
            constraints: const BoxConstraints(
                maxWidth: 600), // Adjusted maxWidth for mobile view
            padding: const EdgeInsets.symmetric(
                vertical: 40, horizontal: 20), // Reduced padding for mobile
            child: const SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ProText(
                    'Refund Policy',
                    style: TextStyle(
                        fontSize: 18.0, // Further reduced font size for mobile
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                  SizedBox(height: 10.0), // Adjusted spacing for mobile
                  ProText(
                    refundContent,
                    style: TextStyle(
                        fontSize: 14.0,
                        color: Colors
                            .white), // Further reduced font size for mobile
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
        backgroundColor: Colors.pinkAccent, // Customize as needed
      ),
    );
  }
}
