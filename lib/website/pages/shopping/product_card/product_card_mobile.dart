import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:profinix_app/website/pages/shopping/cartcontroller.dart';
import 'package:profinix_app/website/utils/helpers/helper_functions.dart';

import '../../../controller/wishlist_controller.dart';
import '../../../utils/constants/colors.dart';

class ProductCardMobile extends StatelessWidget {
  final String imagePath;
  final String productName;
  final String productId;
  final double price;
  final VoidCallback onAddToCart;

  const ProductCardMobile({
    Key? key,
    required this.imagePath,
    required this.productName,
    required this.productId,
    required this.price,
    required this.onAddToCart,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final CartController cartController = Get.put(CartController());
    final WishlistController wishlistController = Get.put(WishlistController());
    final dark = SNHelperFunctions.isDarkMode(context);
    final screenWidth = MediaQuery.of(context).size.width;

    return ConstrainedBox(
      constraints: const BoxConstraints(
        minHeight: 250,
        maxHeight: 350,
      ),
      child: Container(
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: dark ? SNColors.black : Colors.white,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.05),
              blurRadius: 8,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            GestureDetector(
              onTap: () {
                showDialog(
                  context: context,
                  builder: (_) => Dialog(
                    child: InteractiveViewer(
                      minScale: 1,
                      maxScale: 5,
                      child: GestureDetector(
                        onTap: () => Navigator.pop(context),
                        child: Image.asset(imagePath, fit: BoxFit.contain),
                      ),
                    ),
                  ),
                );
              },
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.asset(
                  imagePath,
                  width: screenWidth * 0.8,
                  height: 150, // Fixed height
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const SizedBox(height: 10),
            Text(
              productName,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: Theme.of(context).textTheme.titleMedium,
            ),
            const SizedBox(height: 4),
            Text(
              '₹${price.toStringAsFixed(2)}',
              style: Theme.of(context).textTheme.titleSmall?.copyWith(
                    color: SNColors.black,
                  ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Obx(() {
                  final isInWishlist =
                      wishlistController.isInWishlist(productId);
                  return IconButton(
                    icon: Icon(
                      isInWishlist
                          ? Icons.favorite
                          : Icons.favorite_border,
                      color: isInWishlist ? Colors.red : SNColors.grey,
                    ),
                    onPressed: () {
                      isInWishlist
                          ? wishlistController.removeFromWishlist(productId)
                          : wishlistController.addToWishlist({
                              'id': productId,
                              'imagePath': imagePath,
                              'name': productName,
                              'price': price,
                            });
                    },
                  );
                }),
                IconButton(
                  icon: const Icon(Icons.add_shopping_cart),
                  onPressed: () {
                    cartController.addItemToCart({
                      'imagePath': imagePath,
                      'name': productName,
                      'price': price,
                      'quantity': 1,
                      'category': 'default',
                    });
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
