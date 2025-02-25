import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:profinix_app/website/utils/constants.dart';
import 'package:profinix_app/website/utils/demorequest_sheet.dart';
import 'package:profinix_app/website/widgets/basewidgets.dart';

class MobileNavBar extends StatefulWidget {
  final VoidCallback scrollToContact;
  final VoidCallback scrollToFeatures;
  final VoidCallback scrollToHome;
  final Function(int) onNavItemTap;

  MobileNavBar({
    Key? key,
    required this.scrollToContact,
    required this.scrollToFeatures,
    required this.scrollToHome,
    required this.onNavItemTap,
    required GlobalKey<ScaffoldState> scaffoldKey,
  }) : super(key: key);

  @override
  _MobileNavBarState createState() => _MobileNavBarState();
}

class _MobileNavBarState extends State<MobileNavBar> {
  bool _isExpanded = false;

  void _toggleMenu() {
    setState(() {
      _isExpanded = !_isExpanded;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          decoration: const BoxDecoration(
            color: Colors.transparent,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  navLogo(),
                  const SizedBox(width: 10),
                  const ProText(
                    'Sri RK \nWoodlands',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 15,
                    ),
                  ),
                ],
              ),
              IconButton(
                icon: Icon(
                  _isExpanded ? Icons.close : Icons.menu_rounded,
                  color: Colors.white,
                  size: 35,
                ),
                onPressed: _toggleMenu,
              ),
              ProContainer(
                decoration: BoxDecoration(
                  gradient: const LinearGradient(
                    colors: [
                      Color.fromARGB(255, 233, 156, 13),
                      Color.fromARGB(255, 245, 208, 85),
                    ],
                    begin: Alignment.bottomLeft,
                    end: Alignment.topRight,
                  ),
                  borderRadius: BorderRadius.circular(20),
                ),
                height: 30,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      foregroundColor: Colors.white,
                      backgroundColor: Colors.transparent,
                      shadowColor: Colors.transparent,
                      textStyle: const TextStyle(fontSize: 16),
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      )),
                  onPressed: () {
                    Get.toNamed('/shopping');
                  },
                  child: const ProText(
                    'Shop',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        AnimatedContainer(
          duration: const Duration(milliseconds: 300),
          // Set maxHeight and use constraints
          constraints: BoxConstraints(
            maxHeight: _isExpanded ? 250 : 0,
          ),
          child: Center(
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                //crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  ListTile(
                    title: const Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.home, color: Colors.white),
                        SizedBox(width: 8),
                        ProText(
                          'Home',
                          style: TextStyle(color: Colors.white),
                        )
                      ],
                    ),
                    onTap: () {
                      widget.onNavItemTap(3);
                      _toggleMenu();
                    },
                  ),
                  ListTile(
                    title: const Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.featured_play_list, color: Colors.white),
                        SizedBox(width: 8),
                        ProText(
                          'Features',
                          style: TextStyle(color: Colors.white),
                        )
                      ],
                    ),
                    onTap: () {
                      widget.onNavItemTap(1);
                      _toggleMenu();
                    },
                  ),
                  ListTile(
                    title: const Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.connect_without_contact,
                            color: Colors.white),
                        SizedBox(width: 8),
                        ProText(
                          'Contact Us',
                          style: TextStyle(color: Colors.white),
                        )
                      ],
                    ),
                    onTap: () {
                      widget.onNavItemTap(0);
                      _toggleMenu();
                    },
                  ),
                  ListTile(
                    title: const Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.login_outlined, color: Colors.white),
                        SizedBox(width: 8),
                        ProText(
                          'Login',
                          style: TextStyle(color: Colors.white),
                        )
                      ],
                    ),
                    onTap: () {
                      login_launchURL();
                      Navigator.pop(context);
                    },
                  ),
                  ListTile(
                    title: const Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.currency_rupee_outlined,
                            color: Colors.white),
                        SizedBox(width: 8), // Space between icon and text
                        Text(
                          'Pricing',
                          style: TextStyle(color: Colors.white),
                        ),
                      ],
                    ),
                    onTap: () {
                      Get.toNamed('/pricing');
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget navLogo() {
    return Container(
      width: 50,
      height: 50,
      decoration: const BoxDecoration(
        image: DecorationImage(image: AssetImage(weblogo), fit: BoxFit.contain),
      ),
    );
  }
}
