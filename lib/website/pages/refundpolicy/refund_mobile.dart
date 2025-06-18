import 'package:flutter/material.dart';
import 'package:get/get.dart';

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
        title:  Text(
          "Back",
           style: Theme.of(context).textTheme.labelLarge,
        ),
      ),
      body: Container(
        // decoration: const BoxDecoration(
        //   image: DecorationImage(
        //       image: AssetImage('assets/rkbackground.png'), fit: BoxFit.cover),
        // ),
        child: Center(
          child: Container(
            constraints: const BoxConstraints(
                maxWidth: 600), // Adjusted maxWidth for mobile view
            padding: const EdgeInsets.symmetric(
                vertical: 40, horizontal: 20), // Reduced padding for mobile
            child:  SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Refund Policy',
                    style: Theme.of(context).textTheme.titleSmall,
                  ),
                  SizedBox(height: 10.0), // Adjusted spacing for mobile
                  // ProText(
                  //   refundContent,
                  //   style: TextStyle(
                  //       fontSize: 14.0,
                  //       color: Colors
                  //           .white), // Further reduced font size for mobile
                  // ),
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
