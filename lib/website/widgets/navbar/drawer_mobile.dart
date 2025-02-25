import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:profinix_app/website/utils/constants.dart';

class DrawerMobile extends StatelessWidget {
  final Function(int) onNavItemTap;

  const DrawerMobile({Key? key, required this.onNavItemTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        decoration: const BoxDecoration(
            // Optional: gradient background for the drawer
            ),
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const SizedBox(height: 30),
            ListTile(
              leading: const Icon(Icons.home, color: Colors.white),
              title: const Text('Home'),
              onTap: () {
                onNavItemTap(0); // Navigate to Home
                Navigator.pop(context);
              },
            ),
            // ListTile(
            //   leading: const Icon(Icons.featured_play_list,
            //       color: Colors.white),
            //   title: const Text('Features'),
            //   onTap: () {
            //     onNavItemTap(1); // Navigate to Features
            //     Navigator.pop(context);
            //   },
            // ),
            ListTile(
              leading:
                  const Icon(Icons.phone_android_outlined, color: Colors.white),
              title: const Text('Contact Us'),
              onTap: () {
                onNavItemTap(2); // Navigate to Contact Us
                Navigator.pop(context);
              },
            ),
            // ListTile(
            //   leading: const Icon(Icons.login, color: Colors.white),
            //   title: const Text('Login'),
            //   onTap: () {
            //     login_launchURL();
            //     Navigator.pop(context);
            //   },
            // ),
            ListTile(
              leading: const Icon(Icons.attach_money, color: Colors.white),
              title: const Text('Shopping'),
              onTap: () {
                Get.toNamed('/shoppingmobile');
              },
            ),
          ],
        ),
      ),
    );
  }
}
