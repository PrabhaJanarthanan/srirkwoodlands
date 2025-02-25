import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:profinix_app/website/controller/auth_controller.dart';
import 'package:profinix_app/website/utils/constants.dart';
import 'package:profinix_app/website/utils/show_ordersdialog.dart';
import 'package:profinix_app/website/widgets/basewidgets.dart';

class DesktopNavBar extends StatefulWidget {
  final VoidCallback scrollToContact;
  final VoidCallback scrollToFeatures;
  final VoidCallback scrollToHome;

  DesktopNavBar({
    super.key,
    required this.scrollToContact,
    required this.scrollToFeatures,
    required this.scrollToHome,
    required Function(int p1) onNavItemTap,
  });

  @override
  _DesktopNavBarState createState() => _DesktopNavBarState();
}

class _DesktopNavBarState extends State<DesktopNavBar>
    with SingleTickerProviderStateMixin {
  late List<bool> isHoveredList;
  late AnimationController _animationController;
  late Animation<double> _animation;
  bool _isDropdownOpen = false;

  @override
  void initState() {
    super.initState();
    isHoveredList = List.filled(6, false);

    _animationController = AnimationController(
      duration: const Duration(milliseconds: 300),
      vsync: this,
    );
    _animation = CurvedAnimation(
      parent: _animationController,
      curve: Curves.easeInOut,
    );
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  void _toggleHover(bool isHovering, int index) {
    setState(() {
      isHoveredList[index] = isHovering;
    });
  }

  void _toggleDropdown(bool isHovering) {
    setState(() {
      _isDropdownOpen = isHovering;
      if (_isDropdownOpen) {
        _animationController.forward();
      } else {
        _animationController.reverse();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double margin =
        screenWidth > 800 ? 50 : 20; // Adjust margin based on screen size
    double logoSize = screenWidth > 600 ? 40 : 30; // Logo size adjustment
    double fontSize = screenWidth > 600 ? 18 : 14; // Font size adjustment

    return SingleChildScrollView(
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: margin, vertical: 30),
        height: 70,
        decoration: const BoxDecoration(
          color: Colors.transparent,
        ),
        child: ProRow(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            navLogo(logoSize),
            Expanded(
              child: ProRow(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  navButton('Home', widget.scrollToHome, 0, fontSize),
                  navButton('Contact Us', () {
                    Get.toNamed('/contactUs');
                  }, 5, fontSize),
                  //navButton('About Us', widget.scrollToFeatures, 2, fontSize),
                  //navButton('Contact Us', widget.scrollToContact, 3, fontSize),

                  //navButton('Login', login_launchURL, 4, fontSize),
                  navButton('Shop with Us', () {
                    Get.toNamed('/shopping');
                  }, 5, fontSize),
                  GetX<AuthController>(
                    builder: (controller) {
                      return (controller.user.value != null &&
                              controller.user.value!.uid.isNotEmpty)
                          ? PopupMenuButton<String>(
                              onSelected: (value) {
                                if (value == 'Logout') {
                                  AuthController.instance.signOut();
                                  Get.offAllNamed('/');
                                } else if (value == 'My Orders') {
                                  Get.to(() => const MyOrdersPage());
                                }
                              },
                              itemBuilder: (context) => [
                                PopupMenuItem(
                                  value: 'My Orders',
                                  child: Row(
                                    children: [
                                      Icon(Icons.list_alt, color: Colors.black),
                                      SizedBox(width: 8),
                                      Text("My Orders"),
                                    ],
                                  ),
                                ),
                                PopupMenuItem(
                                  value: 'Logout',
                                  child: Row(
                                    children: [
                                      Icon(Icons.logout, color: Colors.black),
                                      SizedBox(width: 8),
                                      Text("Logout"),
                                    ],
                                  ),
                                ),
                              ],
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 12.0),
                                child: Obx(() {
                                  return CircleAvatar(
                                    backgroundColor: Colors.grey[300],
                                    backgroundImage: (controller
                                                .user.value?.photoURL !=
                                            null)
                                        ? CachedNetworkImageProvider(
                                            controller.user.value!.photoURL!)
                                        : null,
                                    onBackgroundImageError: (_, __) {
                                      print(
                                          "Image failed to load! Updating...");
                                      controller.updateUserData();
                                    },
                                    child:
                                        controller.user.value?.photoURL == null
                                            ? Icon(Icons.person,
                                                size: 20, color: Colors.white)
                                            : null,
                                    radius: 18,
                                  );
                                }),
                              ),
                            )
                          : navButton('Login', () {
                              AuthController.instance.signInWithGoogle();
                            }, 4, fontSize);
                    },
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget navButton(
      String text, VoidCallback onPressed, int index, double fontSize) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12.0),
      child: MouseRegion(
        onEnter: (_) => _toggleHover(true, index),
        onExit: (_) => _toggleHover(false, index),
        child: GestureDetector(
          onTap: onPressed,
          child: isHoveredList[index]
              ? ShaderMask(
                  shaderCallback: (Rect bounds) {
                    return const LinearGradient(
                      colors: <Color>[
                        Color.fromARGB(255, 233, 156, 13),
                        Color.fromARGB(255, 245, 208, 85),
                      ],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ).createShader(bounds);
                  },
                  child: ProText(
                    text,
                    style: TextStyle(
                      fontSize: fontSize,
                      fontWeight: FontWeight.normal,
                      color: Colors.white,
                    ),
                  ),
                )
              : ProText(
                  text,
                  style: TextStyle(
                    fontSize: fontSize,
                    fontWeight: FontWeight.normal,
                    color: Colors.white,
                  ),
                ),
        ),
      ),
    );
  }

  Widget dropdownMenuItem(String text, VoidCallback onTap) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
        child: Text(
          text,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.normal,
            color: Colors.black,
          ),
        ),
      ),
    );
  }

  Widget navLogo(double logoSize) {
    return ProRow(
      mainAxisSize: MainAxisSize.min,
      children: [
        ProContainer(
          width: logoSize,
          height: logoSize,
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage(weblogo),
              fit: BoxFit.contain,
            ),
          ),
        ),
        const ProText(
          'Sri RK Woodlands',
          style: TextStyle(
            fontSize: 30,
            color: Colors.white,
            fontWeight: FontWeight.normal,
          ),
        ),
      ],
    );
  }
}
