import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:profinix_app/website/controller/auth_controller.dart';
import 'package:profinix_app/website/pages/models/order_model.dart';

class CartController extends GetxController {
  var cartItems = <Map<String, dynamic>>[].obs;
  var totalPrice = 0.0.obs;
  double shippingCharges = 100.0;
  double gstRate = 18.0;
  var isLoading = false.obs;
/*
  void placeOrder() async {
    isLoading.value = true;
    await Future.delayed(const Duration(seconds: 2));

    cartItems.clear();
    updateTotalPrice();
    //update();

    isLoading.value = false;
  }
*/

  void clearCart() {
  cartItems.clear();
  update(); // or use refresh() if you're using RxList
}
  void updateTotalPrice() {
    totalPrice.value = cartItems.fold(0.0, (sum, item) {
      return sum + (item['price'] * item['quantity']);
    });
  }

  double calculateCGST() {
    return getTotalBeforeGST() * 0.09;
  }

  double calculateSGST() {
    return getTotalBeforeGST() * 0.09;
  }

  double getTotalBeforeGST() {
    return cartItems.fold(
        0.0, (sum, item) => sum + (item['price'] * item['quantity']));
  }

  double getTotalInvoiceAmount() {
    return getTotalBeforeGST() +
        calculateCGST() +
        calculateSGST() +
        shippingCharges;
  }

  void addItemToCart(Map<String, dynamic> item) {
    var existingItem = cartItems.firstWhereOrNull(
      (cartItem) =>
          cartItem['name'] == item['name'] &&
          cartItem['category'] == item['category'],
    );

    if (existingItem != null) {
      existingItem['quantity'] += 1;
      cartItems.refresh();
    } else {
      item['quantity'] = 1;
      cartItems.add(item);
    }
    updateTotalPrice();
    //update();
  }

  void removeItemFromCart(Map<String, dynamic> item) {
    cartItems.removeWhere((cartItem) =>
        cartItem['name'] == item['name'] &&
        cartItem['category'] == item['category']);
    updateTotalPrice();
    //update();
  }

  void incrementItemQuantity(Map<String, dynamic> item) {
    var existingItem = cartItems.firstWhereOrNull(
      (cartItem) =>
          cartItem['name'] == item['name'] &&
          cartItem['category'] == item['category'],
    );

    if (existingItem != null) {
      existingItem['quantity'] += 1;
      cartItems.refresh();
      updateTotalPrice();
    }
  }

  void decrementItemQuantity(Map<String, dynamic> item) {
    var existingItem = cartItems.firstWhereOrNull(
      (cartItem) =>
          cartItem['name'] == item['name'] &&
          cartItem['category'] == item['category'],
    );

    if (existingItem != null) {
      existingItem['quantity'] -= 1;

      if (existingItem['quantity'] == 0) {
        cartItems.remove(existingItem);
      }
      cartItems.refresh();
      updateTotalPrice();
    }
  }

  double getTotalPrice() {
    return totalPrice.value;
  }

  int get cartItemCount {
    return cartItems.fold(0, (sum, item) => sum + (item['quantity'] as int));
  }

  Future<void> placeOrder() async {
    try {
      print("Placing Order...");

      String? userId = AuthController.instance.user.value?.uid;
      if (userId == null || userId.isEmpty) {
        print("Error: User ID is null or empty");
        return;
      }

      String orderId = FirebaseFirestore.instance
          .collection('users')
          .doc(userId)
          .collection('orders')
          .doc()
          .id;

      OrderModel order = OrderModel(
        orderId: orderId,
        cartItems: cartItems.value,
        status: 'Processing',
        orderDate: DateTime.now(),
      );

      await FirebaseFirestore.instance
          .collection('users')
          .doc(userId)
          .collection('orders')
          .doc(orderId)
          .set(order.toJson());

      print("Order successfully placed: $orderId");

      Get.snackbar("Success", "Order Placed Successfully",
          snackPosition: SnackPosition.BOTTOM);
    } catch (e) {
      print("Error placing order: $e");
      Get.snackbar("Error", e.toString(), snackPosition: SnackPosition.BOTTOM);
    }
  }
}
