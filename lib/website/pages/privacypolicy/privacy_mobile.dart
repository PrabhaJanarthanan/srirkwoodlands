import 'package:flutter/material.dart';
import 'package:profinix_app/website/utils/helpers/helper_functions.dart';

import '../../utils/constants/colors.dart';

class PrivacyPolicyMobile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final dark = SNHelperFunctions.isDarkMode(context);
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
       // backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon:  Icon(Icons.arrow_back, 
          color: dark? SNColors.white : SNColors.black),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        title:  Text(
          'Back',
          style: Theme.of(context).textTheme.labelLarge,
        ),
      ),
      body: Stack(
        children: [
          Positioned.fill(
            child: Image.asset(
              Theme.of(context).brightness == Brightness.dark
              ?'assets/background/srinivibackgrounddark.png'
              : 'assets/background/srinivibackgroundlight.png',
              fit: BoxFit.cover,
            ),
          ),
           Padding(
            padding: EdgeInsets.all(20),
            child: SingleChildScrollView(
              padding: EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 10.0),
                  Center(
                    child: Text(
                      'Privacy Policy',
                      style: Theme.of(context).textTheme.titleSmall
                    ),
                  ),
                  SizedBox(height: 10.0),
                  // ProText(
                  //   privacypolicycontent,
                  //   style: TextStyle(
                  //       fontSize: 14.0,
                  //       fontWeight: FontWeight.normal,
                  //       color: Colors.white),
                  // ),
                ],
              ),
            ),
          ),
        ],
      ),
      // floatingActionButton: FloatingActionButton(
      //   onPressed: () {
      //     Get.toNamed('/'); // Navigate to Home Page
      //   },
      //   child: const Icon(
      //     Icons.home,
      //     color: Colors.white,
      //   ),
      //   backgroundColor:
      //       Color.fromARGB(255, 233, 156, 13), // Customize as needed
      // ),
    );
  }
}
