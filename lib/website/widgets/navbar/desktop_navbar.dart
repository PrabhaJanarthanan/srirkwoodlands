import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:profinix_app/website/controller/auth_controller.dart';
import 'package:profinix_app/website/controller/wishlist_controller.dart';
import 'package:profinix_app/website/utils/show_ordersdialog.dart';
import '../../pages/shopping/cart/cart_page_desktop.dart';
import '../../pages/shopping/cartcontroller.dart';
import '../../utils/constants/sizes.dart';
import '../../utils/helpers/helper_functions.dart';

class DesktopNavBar extends StatefulWidget {
  final VoidCallback scrollToContact;
  final VoidCallback scrollToFeatures;
  final VoidCallback scrollToHome;

  const DesktopNavBar({
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
  final CartController cartController = Get.put(CartController());
  final WishlistController wishlistController = Get.find();
  late List<bool> isHoveredList;
  late AnimationController _animationController;
  late Animation<double> _animation;
  bool _isDropdownOpen = false;

  @override
  void initState() {
    super.initState();
    isHoveredList = List.filled(10, false); // enough for all icons
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

  @override
  Widget build(BuildContext context) {
    final dark = SNHelperFunctions.isDarkMode(context);
    double screenWidth = MediaQuery.of(context).size.width;
    double margin = screenWidth > 800 ? 50 : 20;
    double logoSize = screenWidth > 600 ? 40 : 30;
    double fontSize = screenWidth > 600 ? 18 : 14;

    return SingleChildScrollView(
      child: Column(
        children: [
          Container(
            margin: EdgeInsets.symmetric(horizontal: margin, vertical: 30),
            height: 70,
            color: Colors.transparent,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                navLogo(logoSize),
                Expanded(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      navButtonWithIconAndText(
                        label: 'Search',
                        icon: Icons.search,
                        onPressed: () {},
                        index: 0,
                        fontSize: fontSize,
                      ),
                      navButtonWithIconAndText(
                        icon: Icons.home,
                        onPressed: widget.scrollToHome,
                        index: 1,
                        fontSize: fontSize,
                      ),
                      Obx(() {
                        return MouseRegion(
                          cursor: SystemMouseCursors.click,
                          onEnter: (_) => _toggleHover(true, 2),
                          onExit: (_) => _toggleHover(false, 2),
                          child: GestureDetector(
                            onTap: () => Get.to(() => CartPageDesktop()),
                            child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 12.0),
                              child: Stack(
                                clipBehavior: Clip.none,
                                children: [
                                  Icon(
                                    Icons.shopping_cart,
                                    size: SNSizes.iconMd,
                                    color: isHoveredList[2]
                                        ? const Color.fromARGB(
                                            255, 233, 156, 13)
                                        : (dark ? Colors.white : Colors.black),
                                  ),
                                  if (cartController.cartItemCount > 0)
                                    Positioned(
                                      right: -6,
                                      top: -6,
                                      child: CircleAvatar(
                                        radius: 9,
                                        backgroundColor: Colors.red,
                                        child: Text(
                                          cartController.cartItemCount
                                              .toString(),
                                          style: Theme.of(context).textTheme.labelMedium
                                        ),
                                      ),
                                    ),
                                ],
                              ),
                            ),
                          ),
                        );
                      }),

                      //wishlist icon
                      Obx(() {
                        final count = wishlistController.wishlistItems.length;
                        return MouseRegion(
                          cursor: SystemMouseCursors.click,
                          onEnter: (_) => _toggleHover(true, 3),
                          onExit: (_) => _toggleHover(false, 3),
                          child: GestureDetector(
                            onTap: () => Get.toNamed('/wishlist'),
                            child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 12.0),
                              child: Stack(
                                clipBehavior: Clip.none,
                                children: [
                                  Icon(
                                    Icons.favorite,
                                    size: SNSizes.iconMd,
                                    color: isHoveredList[3]
                                        ? const Color.fromARGB(
                                            255, 233, 156, 13)
                                        : (dark ? Colors.white : Colors.black),
                                  ),
                                  if (count > 0)
                                    Positioned(
                                      right: -6,
                                      top: -6,
                                      child: CircleAvatar(
                                        radius: 9,
                                        backgroundColor: Colors.red,
                                        child: Text(
                                          '$count',
                                          style: Theme.of(context).textTheme.labelMedium
                                        ),
                                      ),
                                    ),
                                ],
                              ),
                            ),
                          ),
                        );
                      }),
                    
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
                                    const PopupMenuItem(
                                      value: 'My Orders',
                                      child: Row(
                                        children: [
                                          Icon(Icons.list_alt,
                                              color: Colors.black),
                                          SizedBox(width: 8),
                                          Text("My Orders"),
                                        ],
                                      ),
                                    ),
                                    const PopupMenuItem(
                                      value: 'Logout',
                                      child: Row(
                                        children: [
                                          Icon(Icons.logout,
                                              color: Colors.black),
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
                                        backgroundImage: controller
                                                    .user.value?.photoURL !=
                                                null
                                            ? CachedNetworkImageProvider(
                                                controller
                                                    .user.value!.photoURL!)
                                            : null,
                                        radius: 18,
                                        child: controller
                                                    .user.value?.photoURL ==
                                                null
                                            ? const Icon(Icons.person,
                                                size: 20, color: Colors.white)
                                            : null,
                                      );
                                    }),
                                  ),
                                )
                              : navButtonWithIconAndText(
                                  icon: Icons.person,
                                  onPressed: () {
                                    AuthController.instance.signInWithGoogle();
                                  },
                                  index: 5,
                                  fontSize: fontSize,
                                );
                        },
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: margin),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                navTextButton('Cotton Sarees', () {}),
                navTextButton('Silk Sarees', () {}),
                navTextButton('Fancy Sarees', () {}),
                navTextButton('Salwar Suits', () {}),
                navTextButton('Lehangas', () {}),
                navTextButton('New Arrivals', () {}),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget navButtonWithIconAndText({
    String label = '',
    required IconData icon,
    required VoidCallback onPressed,
    required int index,
    required double fontSize,
  }) {
    final dark = SNHelperFunctions.isDarkMode(context);
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      onEnter: (_) => _toggleHover(true, index),
      onExit: (_) => _toggleHover(false, index),
      child: GestureDetector(
        onTap: onPressed,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12.0),
          child: Row(
            children: [
              if (label.isNotEmpty)
                Text(
                  label,
                  style: TextStyle(
                    fontSize: fontSize,
                    color: isHoveredList[index]
                        ? const Color.fromARGB(255, 233, 156, 13)
                        : (dark ? Colors.white : Colors.black),
                  ),
                ),
              Icon(
                icon,
                size: SNSizes.iconMd,
                color: isHoveredList[index]
                    ? const Color.fromARGB(255, 233, 156, 13)
                    : (dark ? Colors.white : Colors.black),
              ),
              const SizedBox(width: 6),
            ],
          ),
        ),
      ),
    );
  }

  Widget navLogo(double logoSize) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          'Sri Nivi Boutique',
          style: Theme.of(context).textTheme.headlineMedium,
        ),
      ],
    );
  }

  Widget navTextButton(String title, VoidCallback onTap) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: onTap,
        child: Text(
          title,
          style: Theme.of(context).textTheme.bodyMedium,
        ),
      ),
    );
  }
}
