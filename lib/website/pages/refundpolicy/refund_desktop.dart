import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RefundDesktop extends StatelessWidget {
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
        //       image: AssetImage('assets/rkbackgroundbrown.png'),
        //       fit: BoxFit.cover),
        // ),
        child: Center(
          child: Container(
            constraints: const BoxConstraints(
                maxWidth: 900), // Adjust maxWidth as needed
            padding: const EdgeInsets.symmetric(vertical: 80, horizontal: 50),
            // color: Colors.white.withOpacity(0.8),
            child: const SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Refund Policy',
                    style: TextStyle(
                        fontSize: 24.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                  SizedBox(height: 20.0),
                  // ProText(
                  //   refundContent,
                  //   style: TextStyle(fontSize: 18.0, color: Colors.white),
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
        backgroundColor:
            Color.fromARGB(255, 233, 156, 13), // Customize as needed
      ),
    );
  }
}
