import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:profinix_app/website/controller/auth_controller.dart';
import 'package:profinix_app/website/pages/shopping/cartcontroller.dart';
import 'package:profinix_app/website/pages/shopping/checkout/checkout_desktop.dart';

import '../../../utils/constants/colors.dart';
import '../../../utils/constants/sizes.dart';
import '../../../utils/helpers/helper_functions.dart';

class CartPageDesktop extends StatelessWidget {
  final CartController cartController = Get.find();

  @override
  Widget build(BuildContext context) {
    final dark = SNHelperFunctions.isDarkMode(context);
    return Container(
      // decoration: BoxDecoration(
      //   image: DecorationImage(
      //     image: const AssetImage('assets/rkbackgroundbrown.png'),
      //     fit: BoxFit.cover,
      //   ),
      // ),
      child: Scaffold(
       // backgroundColor: Colors.transparent,
        appBar: AppBar(
          title:  Text(
            'Your Cart',
            style: Theme.of(context).textTheme.headlineSmall,
          ),
           iconTheme:  IconThemeData(color: dark?SNColors.white : SNColors.blackContainer), 
         // backgroundColor: Colors.transparent,
          actions: [
                // Home Button before user icon
    IconButton(
      icon:  Icon(Icons.home, color: dark?SNColors.white : SNColors.blackContainer),
      onPressed: () {
        // Navigate to Home page when tapped
        Get.toNamed('/home'); // Update with your home route if needed
      },
    ),
            Obx(() {
              final user = AuthController.instance.user.value;
              return user != null
                  ? Padding(
                      padding: const EdgeInsets.only(right: 10),
                      child: GestureDetector(
                        onTap: () {
                          // Logout confirmation
                          Get.defaultDialog(
                            title: "Logout",
                            middleText: "Are you sure you want to logout?",
                            textConfirm: "Logout",
                            textCancel: "Cancel",
                            confirmTextColor: dark?SNColors.white : SNColors.blackContainer,
                            buttonColor: Colors.red,
                            onConfirm: () {
                              AuthController.instance.signOut();
                              Get.back(); // Close dialog
                            },
                          );
                        },
                        child: CircleAvatar(
                             backgroundImage: user.photoURL != null
                      ? NetworkImage(user.photoURL!)
                      : null, // Display user photo if available
                  child: user.photoURL == null
                      ? Icon(Icons.person, size: 20, color: dark?SNColors.white : SNColors.blackContainer)
                      : null, // Default icon if no photo
                        //  child:
                              //Icon(Icons.person, size: 20, color: Colors.white),
                        ),
                      ),
                    )
                  : IconButton(
                      icon: Icon(Icons.login_sharp, color: dark?SNColors.white : SNColors.blackContainer),
                      onPressed: () async {
                        bool isLoggedIn =
                            await AuthController.instance.signInWithGoogle();
                        if (isLoggedIn) {
                          Get.snackbar("Success", "Logged in successfully!",
                              backgroundColor: Colors.green,
                              colorText: Colors.white);
                        }
                      },
                    );
            }),
          ],
        ),
        body: Center(
          child: Container(
            height: 500,
            width: 800,
            decoration: BoxDecoration(
              color: Colors.transparent,
              borderRadius: BorderRadius.circular(20),
     
            ),
            child: Column(
              children: [
                Expanded(
                  flex: 1,
                  child: Obx(() {
                    return cartController.cartItems.isEmpty
                        ? const Center(child: Text('Your cart is empty.'))
                        : ListView.builder(
                            itemCount: cartController.cartItems.length,
                            itemBuilder: (context, index) {
                              final item = cartController.cartItems[index];
                              return ListTile(
                                leading: Image.asset(item['imagePath'],
                                    width: 30, height: 30, fit: BoxFit.cover),
                                title: Text(
                                  item['name'],
                                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                                    color: dark?SNColors.white : SNColors.blackContainer
                                  )
                                ),
                                subtitle: Row(
                                  children: [
                                    const SizedBox(width: 10),
                                    Text(
                                      '₹${item['price']} x ',
                                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                                    color: dark?SNColors.white : SNColors.blackContainer
                                  )
                                    ),
                                    Text(
                                      '${item['quantity']}',
                                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                                    color: dark?SNColors.white : SNColors.blackContainer
                                  )
                                    ),
                                  ],
                                ),
                                trailing: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    // Decrease Button
                                    IconButton(
                                      icon:  Icon(Icons.remove,
                                      size: SNSizes.iconSm,
                                          color: dark?SNColors.white : SNColors.blackContainer),
                                      onPressed: item['quantity'] > 1
                                          ? () {
                                              cartController
                                                  .decrementItemQuantity(item);
                                            }
                                          : null,
                                    ),
                                    // Price with quantity
                                    Text(
                                      '₹${(item['quantity'] * item['price']).toStringAsFixed(2)}',
                                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                                    color: dark?SNColors.white : SNColors.blackContainer
                                  )
                                    ),
                                    // Increase Button
                                    IconButton(
                                      icon:  Icon(
                                        Icons.add,
                                        size: SNSizes.iconSm,
                                        color: dark?SNColors.white : SNColors.blackContainer
                                      ),
                                      onPressed: () {
                                        cartController
                                            .incrementItemQuantity(item);
                                      },
                                    ),
                                    // Delete Button
                                    IconButton(
                                      icon:  Icon(Icons.delete,
                                          color: Colors.red,
                                          size: SNSizes.iconSm,),
                                      onPressed: () {
                                        cartController.removeItemFromCart(item);
                                      },
                                    ),
                                  ],
                                ),
                              );
                            },
                          );
                  }),
                ),
                 Divider(
                  // Added Divider
                  color:  dark?SNColors.white : SNColors.blackContainer,
                  thickness: 1,
                  indent: 20,
                  endIndent: 20,
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 40, vertical: 50),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Obx(() {
                        return Text(
                          'Total: ₹${cartController.totalPrice.value.toStringAsFixed(2)}',
                              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                                    color: dark?SNColors.white : SNColors.blackContainer
                                  )
                        );
                      }),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        bottomNavigationBar: Padding(
          padding:
              const EdgeInsets.all(8), // Reduced padding for smaller button
          child: Container(
              width: 200,
              child: ElevatedButton(
                onPressed: () {
                  if (!AuthController.instance.isUserLoggedIn()) {
                    // Show login prompt before checkout
                    Get.defaultDialog(
                      title: "Login Required",
                      middleText: "Please log in to proceed to checkout.",
                      textConfirm: "Login",
                      textCancel: "Cancel",
                      confirmTextColor: Colors.white,
                      buttonColor: Color.fromARGB(255, 233, 156, 13),
                      onConfirm: () async {
                        Get.back(); // Close dialog
                        bool isLoggedIn =
                            await AuthController.instance.signInWithGoogle();
                        if (isLoggedIn) {
                          Get.to(() => CheckoutDesktop());
                        }
                      },
                      onCancel: () {
                        Get.back(); // Close dialog, stay on shopping page
                      },
                    );
                  } else {
                    Get.to(() => CheckoutDesktop());
                  }
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color.fromARGB(255, 233, 156, 13),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                  textStyle: const TextStyle(
                    fontSize: 16,
                  ),
                ),
                child:  Text(
                  'Checkout',
                  style: Theme.of(context).textTheme.titleMedium,
                ),
              )


              ),
        ),
      ),
    );
  }
}
