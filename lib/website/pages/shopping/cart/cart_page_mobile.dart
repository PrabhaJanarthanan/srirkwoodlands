import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:profinix_app/website/controller/auth_controller.dart';
import 'package:profinix_app/website/pages/shopping/cartcontroller.dart';
import 'package:profinix_app/website/pages/shopping/checkout/checkout_desktop.dart';
import 'package:profinix_app/website/pages/shopping/checkout/checkout_mobile.dart';

class CartPageMobile extends StatelessWidget {
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
          title: const Text('Your Cart', style: TextStyle(color: Colors.white)),
          iconTheme: const IconThemeData(color: Colors.white),
          backgroundColor: Colors.transparent,
          actions: [
            IconButton(
              icon: const Icon(Icons.home, color: Colors.white),
              onPressed: () => Get.toNamed('/home'),
            ),
            Obx(() {
              final user = AuthController.instance.user.value;
              return user != null
                  ? GestureDetector(
                      onTap: () {
                        Get.defaultDialog(
                          title: "Logout",
                          middleText: "Are you sure you want to logout?",
                          textConfirm: "Logout",
                          textCancel: "Cancel",
                          confirmTextColor: Colors.white,
                          buttonColor: Colors.red,
                          onConfirm: () {
                            AuthController.instance.signOut();
                            Get.back();
                          },
                        );
                      },
                      child: Padding(
                        padding: const EdgeInsets.only(right: 10),
                        child: CircleAvatar(
                          backgroundImage: user.photoURL != null
                              ? NetworkImage(user.photoURL!)
                              : null,
                          child: user.photoURL == null
                              ? Icon(Icons.person, size: 20, color: Colors.white)
                              : null,
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
            width: double.infinity, // Mobile-friendly width
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            decoration: BoxDecoration(
              color: Colors.transparent,
              borderRadius: BorderRadius.circular(15),
            ),
            child: Column(
              children: [
                Expanded(
                  child: Obx(() {
                    return cartController.cartItems.isEmpty
                        ? const Center(
                            child: Text(
                              'Your cart is empty.',
                              style: TextStyle(color: Colors.white),
                            ),
                          )
                        : ListView.builder(
                            itemCount: cartController.cartItems.length,
                            itemBuilder: (context, index) {
                              final item = cartController.cartItems[index];
                              return Card(
                                color: Colors.black.withOpacity(0.3),
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10)),
                                child: ListTile(
                                  contentPadding: EdgeInsets.all(10),
                                  leading: Image.asset(
                                    item['imagePath'],
                                    width: 40,
                                    height: 40,
                                    fit: BoxFit.cover,
                                  ),
                                  title: Text(
                                    item['name'],
                                    style: const TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 16),
                                  ),
                                  subtitle: Text(
                                    '₹${item['price']} x ${item['quantity']}',
                                    style: const TextStyle(
                                        fontSize: 14, color: Colors.white70),
                                  ),
                                  trailing: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
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
                                      Text(
                                        '₹${(item['quantity'] * item['price']).toStringAsFixed(2)}',
                                        style: const TextStyle(
                                          color: Colors.green,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 14,
                                        ),
                                      ),
                                      IconButton(
                                        icon: const Icon(Icons.add,
                                            color: Colors.white),
                                        onPressed: () {
                                          cartController
                                              .incrementItemQuantity(item);
                                        },
                                      ),
                                      IconButton(
                                        icon: const Icon(Icons.delete,
                                            color: Colors.red),
                                        onPressed: () {
                                          cartController
                                              .removeItemFromCart(item);
                                        },
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            },
                          );
                  }),
                ),
                const Divider(color: Colors.white, thickness: 1),
                Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 20, vertical: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'Total:',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.bold),
                      ),
                      Obx(() {
                        return Text(
                          '₹${cartController.totalPrice.value.toStringAsFixed(2)}',
                          style: const TextStyle(
                              color: Colors.green,
                              fontSize: 16,
                              fontWeight: FontWeight.bold),
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
          padding: const EdgeInsets.all(10),
          child: SizedBox(
            width: double.infinity,
            height: 50,
            child: ElevatedButton(
              onPressed: () {
                if (!AuthController.instance.isUserLoggedIn()) {
                  Get.defaultDialog(
                    title: "Login Required",
                    middleText: "Please log in to proceed to checkout.",
                    textConfirm: "Login",
                    textCancel: "Cancel",
                    confirmTextColor: Colors.white,
                    buttonColor: Colors.orange,
                    onConfirm: () async {
                      Get.back();
                      bool isLoggedIn =
                          await AuthController.instance.signInWithGoogle();
                      if (isLoggedIn) {
                        Get.to(() => CheckoutMobile());
                      }
                    },
                    onCancel: () {
                      Get.back();
                    },
                  );
                } else {
                  Get.to(() => CheckoutMobile());
                }
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.orange,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)),
                textStyle: const TextStyle(fontSize: 18),
              ),
              child: const Text('Checkout', style: TextStyle(color: Colors.white)),
            ),
          ),
        ),
      ),
    );
  }
}
