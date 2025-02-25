import 'package:firebase_core/firebase_core.dart';
import 'package:get/get.dart';
import 'package:profinix_app/website/controller/auth_controller.dart';
import 'package:profinix_app/website/pages/models/order_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class OrderController extends GetxController {
  static OrderController instance = Get.find();

  @override
  void onInit() {
    super.onInit();
    fetchOrders();
  }

  RxList<OrderModel> orders = <OrderModel>[].obs;

  Future<void> fetchOrders() async {
    print("fetchOrders() called");
    final authController = Get.find<AuthController>();
    authController.user.listen((user) async {
      try {
        if (user == null) {
          print("Error: User not logged in!");
          return;
        }

        String userId = user.uid;

        QuerySnapshot orderSnapshot = await FirebaseFirestore.instance
            .collection('users')
            .doc(userId)
            .collection('orders')
            .orderBy('orderDate', descending: true)
            .get(); // 🔥

        orders.value = orderSnapshot.docs
            .map((e) => OrderModel.fromJson(e.data() as Map<String, dynamic>))
            .toList();

        print("Fetched ${orders.value.length} orders");
        orders.refresh(); // 🔥 Ensure UI updates
        update(); // 🔥 Notify GetX
      } catch (e) {
        print("Error fetching orders: $e");
        Get.snackbar("Error", "Failed to fetch orders",
            snackPosition: SnackPosition.BOTTOM);
      }
    });
  }
}
