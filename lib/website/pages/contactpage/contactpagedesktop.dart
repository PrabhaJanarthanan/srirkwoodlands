import 'package:flutter/material.dart';
import 'package:get/get.dart'; // For navigation

class ContactUs extends StatelessWidget {
  const ContactUs({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // Background Container
        Container(
          height: MediaQuery.of(context).size.height, // Full screen height
          width: MediaQuery.of(context).size.width, // Full screen width
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/rkbackgroundbrown.png"),
              fit: BoxFit.cover,
            ),
          ),
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(32),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(height: 80),
                const Text(
                  "Contact Us",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 35,
                    color: Colors.white,
                    decoration: TextDecoration.none, // Remove underline
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 100),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // Address Section
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: const [
                          Text(
                            "Sri RK Woodlands, \n178, Erode Road, \nKrishnapuram, \nKavindapadi, \nErode, \nTamilnadu-638455, \nIndia.",
                            style: TextStyle(
                              fontSize: 24,
                              letterSpacing: 1.5,
                              height: 1.5,
                              fontWeight: FontWeight.normal,
                              color: Colors.white,
                              decoration:
                                  TextDecoration.none, // Remove underline
                            ),
                            textAlign: TextAlign.start,
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(width: 20),
                    // Contact Details Section
                    Expanded(
                      child: Container(
                        padding: const EdgeInsets.all(8),
                        child: const Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Text(
                              '+91 97912 96517, \n srirkwoodlands@gmail.com',
                              style: TextStyle(
                                fontSize: 28,
                                color: Colors.white,
                                fontWeight: FontWeight.normal,
                                decoration:
                                    TextDecoration.none, // Remove underline
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 80),
                const Divider(color: Colors.white),
                const SizedBox(height: 25),
              ],
            ),
          ),
        ),

        // Back Button (Top Left)
        Positioned(
          top: 40, // Adjust the position as needed
          left: 20,
          child: IconButton(
            icon: const Icon(Icons.arrow_back, color: Colors.white, size: 30),
            onPressed: () {
              Get.back(); // Navigates back to the previous screen
            },
          ),
        ),
      ],
    );
  }
}
