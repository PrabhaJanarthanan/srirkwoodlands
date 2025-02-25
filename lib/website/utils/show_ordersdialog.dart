import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:profinix_app/website/controller/order_controller.dart';

class MyOrdersPage extends StatelessWidget {
  const MyOrdersPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final orderController = Get.find<OrderController>();
    orderController.fetchOrders();

    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage("assets/rkbackgroundbrown.png"),
          fit: BoxFit.cover,
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          title: const Text("My Orders"),
          backgroundColor: Colors.white,
        ),
        body: Padding(
          padding: const EdgeInsets.all(12),
          child: GetBuilder<OrderController>(
            builder: (controller) {
              if (controller.orders.isEmpty) {
                return const Center(
                  child: Text(
                    "No orders placed yet.",
                    style: TextStyle(fontSize: 18, color: Colors.white),
                  ),
                );
              }

              return ListView.builder(
                itemCount: controller.orders.length,
                itemBuilder: (context, index) {
                  final order = controller.orders[index];

                  /// Calculate Total Amount for Order
                  double totalAmount = order.cartItems.fold(0, (sum, product) {
                    return sum + (product["price"] * product["quantity"]);
                  });

                  return Card(
                    elevation: 3,
                    margin: const EdgeInsets.symmetric(vertical: 10),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(12),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          /// Order ID
                          Text(
                            "Order ID: ${order.orderId}",
                            style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),

                          /// Order Status
                          Text(
                            "Status: ${order.status}", // Assuming `status` field exists
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                              color: order.status == "Delivered"
                                  ? Colors.green
                                  : Colors.orange,
                            ),
                          ),
                          const Divider(),

                          /// Product List
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: order.cartItems.map<Widget>((product) {
                              return Padding(
                                padding: const EdgeInsets.only(bottom: 10),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Product: ${product["name"]}",
                                      style: const TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                    Text(
                                      "Price: ₹${product["price"]}",
                                      style: const TextStyle(
                                        fontSize: 14,
                                        color: Colors.green,
                                      ),
                                    ),
                                    Text(
                                      "Quantity: ${product["quantity"]}",
                                      style: const TextStyle(
                                        fontSize: 14,
                                        color: Colors.blueGrey,
                                      ),
                                    ),
                                    const Divider(),
                                  ],
                                ),
                              );
                            }).toList(),
                          ),

                          /// Total Amount
                          Text(
                            "Total Amount: ₹$totalAmount",
                            style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Colors.red,
                            ),
                          ),

                          /// Order Date
                          Text(
                            "Order Date: ${DateFormat('dd MMM yyyy, hh:mm a').format(order.orderDate)}",
                            style: const TextStyle(
                              fontSize: 14,
                              color: Colors.grey,
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              );
            },
          ),
        ),
      ),
    );
  }
}
