import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:profinix_app/website/controller/auth_controller.dart';
import 'package:profinix_app/website/pages/shopping/cartcontroller.dart';
import 'package:profinix_app/website/pages/shopping/checkout/checkout_desktop.dart';

class CartPageDesktop extends StatelessWidget {
  final CartController cartController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: const AssetImage('assets/rkbackgroundbrown.png'),
          fit: BoxFit.cover,
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          title: const Text(
            'Your Cart',
            style: TextStyle(color: Colors.white),
          ),
           iconTheme: const IconThemeData(color: Colors.white), 
          backgroundColor: Colors.transparent,
          actions: [
                // Home Button before user icon
    IconButton(
      icon: const Icon(Icons.home, color: Colors.white),
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
                            confirmTextColor: Colors.white,
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
                      ? Icon(Icons.person, size: 20, color: Colors.white)
                      : null, // Default icon if no photo
                        //  child:
                              //Icon(Icons.person, size: 20, color: Colors.white),
                        ),
                      ),
                    )
                  : IconButton(
                      icon: Icon(Icons.login_sharp, color: Colors.white),
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
                                  style: const TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.normal,
                                      fontSize: 20),
                                ),
                                subtitle: Row(
                                  children: [
                                    const SizedBox(width: 10),
                                    Text(
                                      '₹${item['price']} x ',
                                      style: const TextStyle(
                                          fontSize: 16, color: Colors.white60),
                                    ),
                                    Text(
                                      '${item['quantity']}',
                                      style: const TextStyle(
                                          fontSize: 16,
                                          color: Colors.white60,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ],
                                ),
                                trailing: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    // Decrease Button
                                    IconButton(
                                      icon: const Icon(Icons.remove,
                                          color: Colors.white),
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
                                      style: const TextStyle(
                                        color: Colors.green,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 16,
                                      ),
                                    ),
                                    // Increase Button
                                    IconButton(
                                      icon: const Icon(
                                        Icons.add,
                                        color: Colors.white,
                                      ),
                                      onPressed: () {
                                        cartController
                                            .incrementItemQuantity(item);
                                      },
                                    ),
                                    // Delete Button
                                    IconButton(
                                      icon: const Icon(Icons.delete,
                                          color: Colors.red),
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
                const Divider(
                  // Added Divider
                  color: Colors.white,
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
                          style: const TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.normal),
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
                child: const Text(
                  'Checkout',
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
              )


              ),
        ),
      ),
    );
  }
}
