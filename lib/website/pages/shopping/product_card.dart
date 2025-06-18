import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:profinix_app/website/pages/shopping/cartcontroller.dart';
import 'package:profinix_app/website/utils/helpers/helper_functions.dart';

import '../../controller/wishlist_controller.dart';
import '../../utils/constants/colors.dart';
import '../../utils/constants/sizes.dart';

class ProductCard extends StatelessWidget {
  final String imagePath;
  final String productName;
  final String productId;
  final double price;
  final VoidCallback onAddToCart;

  const ProductCard({
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

    return Container(
      height: 450,
      width: 350,
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: dark ? SNColors.black : Colors.white,
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
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          GestureDetector(
            onTap: (){
              showDialog(context: context, 
              builder: (context) => Dialog(
                //backgroundColor: Colors.white,
                child: InteractiveViewer(
                  minScale: 1,
                  maxScale: 5,
                  
                  child: GestureDetector(
                    onTap: () => Navigator.pop(context),
                    child: Image.asset(imagePath, fit: BoxFit.contain),
                  )),
              ));
            },
            child: Image.asset(imagePath, fit: BoxFit.cover)),
          const SizedBox(height: 10),


          //Product name and add to cart button
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                productName,
                style: Theme.of(context).textTheme.labelMedium,
                    //overflow: TextOverflow.ellipsis,
              ),
              SizedBox(width: SNSizes.spaceBtwSections*2),
              
          Row(
            children: [
                  Obx(() {
              final isInWishlist = wishlistController.isInWishlist(productId);
              return IconButton(
                onPressed: () {
                  if (isInWishlist) {
                    wishlistController.removeFromWishlist(productId);
                  } else {
                    wishlistController.addToWishlist({
                      'id': productId,
                      'imagePath': imagePath,
                      'name': productName,
                      'price': price,
                    });
                  }
                },
                icon: Icon(
                  isInWishlist ? Icons.favorite : Icons.favorite_border,
                  size: SNSizes.iconSm,
                  color: isInWishlist ? Colors.red : (dark ? SNColors.white : SNColors.black),
                ),
              );
            }),

              IconButton(
                onPressed: () {
                  cartController.addItemToCart({
                    'imagePath': imagePath,
                    'name': productName,
                    'price': price,
                    'quantity': 1,
                    'category': 'default',
                  });
                },
                      
                icon:Icon(Icons.add_shopping_cart, 
                size: SNSizes.iconSm,
                color: dark ? SNColors.white : SNColors.black, 
                ),
                     
              ),
            ],
          ),
      ],
          ),
         // const SizedBox(height: 5),

          //Price

          Text('₹${price.toStringAsFixed(2)}',
              style: Theme.of(context).textTheme.labelMedium?.copyWith(
                color: dark? SNColors.buttonPrimary:SNColors.black
              ),),

         // const SizedBox(height: 10),
          Obx(() {

            
            var currentItem = cartController.cartItems.firstWhere(
                (item) => item['name'] == productName,
                orElse: () => {});
            int quantity =
                currentItem.isNotEmpty ? currentItem['quantity'] ?? 0 : 0;

            return const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                
              ],
            );
          }),
       
        ],
      ),
    );
  }
}
