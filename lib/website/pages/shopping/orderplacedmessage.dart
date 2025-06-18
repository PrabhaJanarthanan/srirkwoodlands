import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import 'cartcontroller.dart';

class MessagePage extends StatelessWidget {
   MessagePage({super.key}){
       Future.microtask(() {
      final CartController cartController = Get.find();
      cartController.clearCart();
    });
  }
   
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:  Text('Order Confirmation',
            style: Theme.of(context).textTheme.headlineSmall, ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.check_circle, color: Colors.green, size: 80),
            const SizedBox(height: 20),
             Text(
              'Your order has been placed successfully!',
              style: Theme.of(context).textTheme.headlineMedium,
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 10),
             Text(
              'Thank you for shopping with us.',
              style: Theme.of(context).textTheme.bodyLarge,
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 30),
            ElevatedButton(
              onPressed: () {
                Get.toNamed('/homepage'); // Go back to the previous page
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Color.fromARGB(255, 233, 156, 13),
                minimumSize: const Size(150, 45),
              ),
              child:  Text(
                'Back to Home',
                style: Theme.of(context).textTheme.bodyLarge,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
