import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:profinix_app/website/controller/auth_controller.dart';
import 'package:profinix_app/website/controller/wishlist_controller.dart';
import 'package:profinix_app/website/pages/shopping/cart/cart_page_mobile.dart';
import 'package:profinix_app/website/utils/constants.dart';
import 'package:profinix_app/website/utils/constants/colors.dart';
import 'package:profinix_app/website/utils/constants/sizes.dart';
import 'package:profinix_app/website/utils/helpers/helper_functions.dart';
import 'package:profinix_app/website/utils/show_ordersdialog.dart';

import '../../pages/shopping/cartcontroller.dart';

class MobileNavBar extends StatefulWidget {
  final VoidCallback scrollToContact;
  final VoidCallback scrollToFeatures;
  final VoidCallback scrollToHome;
  final Function(int) onNavItemTap;

  const MobileNavBar({
    Key? key,
    required this.scrollToContact,
    required this.scrollToFeatures,
    required this.scrollToHome,
    required this.onNavItemTap,
  }) : super(key: key);

  @override
  _MobileNavBarState createState() => _MobileNavBarState();
}

class _MobileNavBarState extends State<MobileNavBar> {
  bool _isExpanded = false;
  late List<bool> isHoveredList;
  final WishlistController wishlistController = Get.find();
   final CartController cartController = Get.put(CartController());

  @override
  void initState() {
    super.initState();
    isHoveredList = List.generate(5, (_) => false); // Adjusted to match index usage
  }

  void _toggleMenu() {
    setState(() {
      _isExpanded = !_isExpanded;
    });
  }

  void _toggleHover(bool isHovering, int index) {
    setState(() {
      isHoveredList[index] = isHovering;
    });
  }

  @override
  Widget build(BuildContext context) {
    final dark = SNHelperFunctions.isDarkMode(context);
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          decoration: const BoxDecoration(color: Colors.transparent),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  //navLogo(),
                  const SizedBox(width: 10),
                  Text(
                    'Sri Nivi Boutique',
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                ],
              ),
              Row(
                children: [
                  Obx(() {
                    final count = wishlistController.wishlistItems.length;
                    return MouseRegion(
                      cursor: SystemMouseCursors.click,
                      onEnter: (_) => _toggleHover(true, 3),
                      onExit: (_) => _toggleHover(false, 3),
                      child: GestureDetector(
                        onTap: () => Get.toNamed('/wishlist'),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 12.0),
                          child: Stack(
                            clipBehavior: Clip.none,
                            children: [
                              Icon(
                                Icons.favorite,
                                size: SNSizes.iconMd,
                                color: isHoveredList[3]
                                    ? const Color.fromARGB(255, 233, 156, 13)
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
                                      style: Theme.of(context)
                                          .textTheme
                                          .labelMedium!
                                          .copyWith(color: Colors.white),
                                    ),
                                  ),
                                ),
                            ],
                          ),
                        ),
                      ),
                    );
                  }),

                   Obx(() {
                        return MouseRegion(
                          cursor: SystemMouseCursors.click,
                          onEnter: (_) => _toggleHover(true, 2),
                          onExit: (_) => _toggleHover(false, 2),
                          child: GestureDetector(
                            onTap: () => Get.to(() => CartPageMobile()),
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
                  IconButton(
                    icon: Icon(
                      _isExpanded ? Icons.close : Icons.menu_rounded,
                      color: dark ? SNColors.white : SNColors.black,
                      size: SNSizes.iconMd,
                    ),
                    onPressed: _toggleMenu,
                  ),
                ],
              ),
            ],
          ),
        ),
        AnimatedContainer(
          duration: const Duration(milliseconds: 300),
          constraints: BoxConstraints(
            maxHeight: _isExpanded ? 250 : 0,
          ),
          child: Center(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  _buildNavTile(
                    icon: Icons.home,
                    label: 'Home',
                    index: 0,
                    onTap: () {
                      widget.onNavItemTap(3);
                      _toggleMenu();
                    },
                  ),
                  _buildNavTile(
                    icon: Icons.featured_play_list,
                    label: 'Features',
                    index: 1,
                    onTap: () {
                      widget.onNavItemTap(2);
                      _toggleMenu();
                    },
                  ),
                  _buildNavTile(
                    icon: Icons.connect_without_contact,
                    label: 'Contact Us',
                    index: 2,
                    onTap: () {
                      widget.onNavItemTap(0);
                      _toggleMenu();
                    },
                  ),
                  GetX<AuthController>(
                    builder: (controller) {
                      final user = controller.user.value;
                      final isLoggedIn = user != null && user.uid.isNotEmpty;
                      if (isLoggedIn) {
                        return PopupMenuButton<String>(
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
                                  Icon(Icons.list_alt,
                                      size: SNSizes.iconSm,
                                      color: dark
                                          ? SNColors.white
                                          : SNColors.black),
                                  const SizedBox(width: 8),
                                  Text(
                                    "My Orders",
                                    style:
                                        Theme.of(context).textTheme.bodyLarge,
                                  ),
                                ],
                              ),
                            ),
                            PopupMenuItem(
                              value: 'Logout',
                              child: Row(
                                children: [
                                  Icon(Icons.logout,
                                      size: SNSizes.iconSm,
                                      color: dark
                                          ? SNColors.white
                                          : SNColors.black),
                                  const SizedBox(width: 8),
                                  Text(
                                    "Logout",
                                    style:
                                        Theme.of(context).textTheme.bodyLarge,
                                  ),
                                ],
                              ),
                            ),
                          ],
                          child: Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 12.0),
                            child: CircleAvatar(
                              backgroundColor: Colors.grey[300],
                              backgroundImage: user.photoURL != null
                                  ? CachedNetworkImageProvider(user.photoURL!)
                                  : null,
                              radius: 18,
                              child: user.photoURL == null
                                  ? Icon(Icons.person,
                                      size: SNSizes.iconSm,
                                      color: dark
                                          ? SNColors.white
                                          : SNColors.black)
                                  : null,
                            ),
                          ),
                        );
                      } else {
                        return _buildNavTile(
                          icon: Icons.login_outlined,
                          label: 'Login',
                          index: 4,
                          onTap: () {
                            AuthController.instance.signInWithGoogle();
                            Navigator.pop(context);
                          },
                        );
                      }
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

  Widget _buildNavTile({
    required IconData icon,
    required String label,
    required int index,
    required VoidCallback onTap,
  }) {
    final dark = SNHelperFunctions.isDarkMode(context);
    return ListTile(
      title: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, size: SNSizes.iconSm, color: dark ? SNColors.white : SNColors.black),
          const SizedBox(width: 8),
          Text(
            label,
            style: Theme.of(context).textTheme.bodyLarge,
          ),
        ],
      ),
      onTap: onTap,
    );
  }

  Widget navLogo() {
    return Container(
      width: 50,
      height: 50,
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage(weblogo),
          fit: BoxFit.contain,
        ),
      ),
    );
  }
}
