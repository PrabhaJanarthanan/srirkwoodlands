import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:profinix_app/website/pages/shopping/cartcontroller.dart';

class ProductCard extends StatelessWidget {
  final String imagePath;
  final String productName;
  final double price;
  final VoidCallback onAddToCart;

  const ProductCard({
    Key? key,
    required this.imagePath,
    required this.productName,
    required this.price,
    required this.onAddToCart,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final CartController cartController = Get.put(CartController());

    return Container(
      height: 300,
      //width: 250,
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withAlpha(20),
            blurRadius: 12,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          GestureDetector(
            onTap: (){
              showDialog(context: context, 
              builder: (context) => Dialog(
                backgroundColor: Colors.white,
                child: InteractiveViewer(
                  minScale: 1,
                  maxScale: 5,
                  
                  child: GestureDetector(
                    onTap: () => Navigator.pop(context),
                    child: Image.asset(imagePath, fit: BoxFit.contain),
                  )),
              ));
            },
            child: Image.asset(imagePath, height: 150, fit: BoxFit.cover)),
          const SizedBox(height: 10),
          Text(
            productName,
            style: const TextStyle(
                fontWeight: FontWeight.normal, fontSize: 16, color: Colors.black),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 5),
          Text('₹${price.toStringAsFixed(2)}',
              style: const TextStyle(fontSize: 16, color: Colors.green)),
          const SizedBox(height: 10),
          Obx(() {
            var currentItem = cartController.cartItems.firstWhere(
                (item) => item['name'] == productName,
                orElse: () => {});
            int quantity =
                currentItem.isNotEmpty ? currentItem['quantity'] ?? 0 : 0;

            return const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // IconButton(
                //   icon: Icon(Icons.remove,
                //       size: 20,
                //       color: quantity > 0 ? Colors.black : Colors.grey),
                //   onPressed: quantity > 0
                //       ? () {
                //           cartController.decrementItemQuantity({
                //             'name': productName,
                //             'price': price,
                //             'imagePath': imagePath,
                //             'category': 'default',
                //           });
                //         }
                //       : null,
                // ),
                // Text('$quantity', style: const TextStyle(fontSize: 16)),
                // IconButton(
                //   icon: Icon(Icons.add, size: 20, color: Colors.black),
                //   onPressed: () {
                //     cartController.incrementItemQuantity({
                //       'name': productName,
                //       'price': price,
                //       'imagePath': imagePath,
                //       'category': 'default',
                //     });
                //   },
                // ),
              ],
            );
          }),
          const SizedBox(height: 10),
          ElevatedButton(
            onPressed: () {
              cartController.addItemToCart({
                'imagePath': imagePath,
                'name': productName,
                'price': price,
                'quantity': 1,
                'category': 'default',
              });
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color.fromARGB(255, 233, 156, 13),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)),
            ),
            child: const Text('Add to Cart',
                style: TextStyle(color: Colors.white)),
          ),
        ],
      ),
    );
  }
}
