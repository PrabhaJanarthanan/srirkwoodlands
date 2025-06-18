import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RefundTablet extends StatelessWidget {
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
        // decoration: const BoxDecoration(
        //   image: DecorationImage(
        //       image: AssetImage('assets/background/frontbg.png'),
        //       fit: BoxFit.cover),
        // ),
        child: Center(
          child: Container(
            constraints: const BoxConstraints(
                maxWidth: 750), // Adjusted maxWidth for tablet view
            padding: const EdgeInsets.symmetric(
                vertical: 60, horizontal: 40), // Adjusted padding for tablet
            child: const SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Refund Policy',
                    style: TextStyle(
                        fontSize: 22.0, // Reduced font size for tablet
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                  SizedBox(height: 15.0), // Adjusted spacing for tablet
                  // ProText(
                  //   refundContent,
                  //   style: TextStyle(
                  //       fontSize: 15.0,
                  //       color: Colors.white), // Reduced font size slightly
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
        child: const Icon(Icons.home),
        backgroundColor: Colors.pinkAccent, // Customize as needed
      ),
    );
  }
}
