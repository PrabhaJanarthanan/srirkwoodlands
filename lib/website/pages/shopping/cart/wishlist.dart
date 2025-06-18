import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controller/wishlist_controller.dart';
import '../cartcontroller.dart';

class WishlistScreen extends StatelessWidget {
  const WishlistScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final WishlistController wishlistController = Get.find();
    final CartController cartController = Get.put(CartController());

    return Scaffold(
      appBar: AppBar(
        title: const Text("My Wishlist"),
      ),

      body: Obx(() {
        final items = wishlistController.wishlistItems;
        if (items.isEmpty) {
          return const Center(
            child: Text("Your wishlist is empty."),
          );
        }

        return ListView.builder(
          padding: const EdgeInsets.all(16),
          itemCount: items.length,
          itemBuilder: (context, index) {
            final item = items[index];
            return Card(
              elevation: 4,
              margin: const EdgeInsets.only(bottom: 12),
              child: ListTile(
                leading: Image.asset(
                  item['imagePath'],
                  width: 60,
                  height: 60,
                  fit: BoxFit.cover,
                ),
                title: Text(item['name']),
                subtitle: Text("₹${item['price']}"),
                //Cart and remove icons
                trailing: Row(
                   mainAxisSize: MainAxisSize.min,
                  children: [
                    IconButton(
                      icon: const Icon(Icons.delete),
                      onPressed: () {
                          wishlistController.wishlistItems.removeAt(index);
                        Get.snackbar("Wishlist", "${item['name']} removed.");
                      },
                    ),
                      IconButton(
                      icon: const Icon(Icons.shopping_cart),
                      onPressed: () {
                        cartController.addItemToCart({
                          'imagePath': item['imagePath'],
                          'name': item['name'],
                          'price': item['price'],
                          'quantity': 1,
                          'category': 'default',
                        });

                        wishlistController.wishlistItems.removeAt(index);
                        Get.snackbar("Cart", "${item['name']} moved to cart.");
                      },
                    ),
                  ],
                ),
              ),
            );
          },
        );
      }),
    );
  }
}
