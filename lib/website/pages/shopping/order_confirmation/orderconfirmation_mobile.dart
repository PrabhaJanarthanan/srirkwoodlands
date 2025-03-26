import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:profinix_app/website/pages/shopping/orderplacedmessage.dart';

import '../cartcontroller.dart';

class OrderConfirmationMobile extends StatefulWidget {
  final String firstName;
  final String lastName;
  final String phone;
  final String email;
  final String addressLine1;
  final String state;
  final String country;
  final String postalCode;
  final String businessName;
  final String gstNumber;

  OrderConfirmationMobile({
    required this.firstName,
    required this.lastName,
    required this.phone,
    required this.email,
    required this.addressLine1,
    required this.state,
    required this.country,
    required this.postalCode,
    required this.businessName,
    required this.gstNumber,
  });

  @override
  _OrderConfirmationMobileState createState() => _OrderConfirmationMobileState();
}

class _OrderConfirmationMobileState extends State<OrderConfirmationMobile> {
  final CartController cartController = Get.find();
  double shippingCharges = 100.0;
  double gstRate = 12.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.brown.shade100,
      appBar: AppBar(
        title: const Text(
          'Confirm Your Order',
          style: TextStyle(color: Colors.white),
        ),
        iconTheme: const IconThemeData(color: Colors.white),
        backgroundColor: Colors.brown.shade700,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(12),
        child: Column(
          children: [
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(15),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.2),
                    blurRadius: 6,
                    spreadRadius: 2,
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Sri RK Woodlands',
                    style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 5),
                  const Text(
                    '178, Erode Road, Krishnapuram, Erode, Tamilnadu',
                    style: TextStyle(fontSize: 14),
                  ),
                  const SizedBox(height: 5),
                  const Text(
                    'Phone: +91 97912 96517  |  GSTIN: 33AHGPA3900N1ZO  |  PAN: AHGPA3900N',
                    style: TextStyle(fontSize: 14),
                  ),
                  const Divider(),

                  // Customer Details
                  Text(
                    '${widget.firstName} ${widget.lastName}',
                    style: const TextStyle(
                        fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  Text(widget.email, style: const TextStyle(fontSize: 14)),
                  Text('Mob: ${widget.phone}', style: const TextStyle(fontSize: 14)),
                  Text(widget.addressLine1, style: const TextStyle(fontSize: 14)),
                  Text(
                    '${widget.state}, ${widget.country} - ${widget.postalCode}',
                    style: const TextStyle(fontSize: 14),
                  ),
                  Text(widget.businessName, style: const TextStyle(fontSize: 14)),
                  Text('GST No: ${widget.gstNumber}', style: const TextStyle(fontSize: 14)),
                  const Divider(),

                  const Text(
                    'Order Summary:',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),

                  // Order List
                  Obx(() => Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Divider(),
                          ...cartController.cartItems.map((item) {
                            return ListTile(
                              title: Text(item['name']),
                              trailing: Text(
                                  '₹${(item['price'] * item['quantity']).toStringAsFixed(2)}'),
                            );
                          }).toList(),
                          ListTile(
                            title: const Text('CGST (9%)'),
                            trailing: Text(
                                '₹${cartController.calculateCGST().toStringAsFixed(2)}'),
                          ),
                          ListTile(
                            title: const Text('SGST (9%)'),
                            trailing: Text(
                                '₹${cartController.calculateSGST().toStringAsFixed(2)}'),
                          ),
                          ListTile(
                            title: const Text('Shipping Charges'),
                            trailing: Text(
                                '₹${cartController.shippingCharges.toStringAsFixed(2)}'),
                          ),
                          ListTile(
                            title: const Text('Total Amount'),
                            trailing: Text(
                              '₹${cartController.getTotalInvoiceAmount().toStringAsFixed(2)}',
                              style: const TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.bold),
                            ),
                          ),
                        ],
                      )),
                ],
              ),
            ),

            const SizedBox(height: 15),

            // Place Order Button
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () async {
                  cartController.isLoading.value = true;
                  await cartController.placeOrder();
                  cartController.isLoading.value = false;
                  await Future.delayed(const Duration(seconds: 2));

                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const MessagePage()),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.brown.shade900,
                  padding: const EdgeInsets.symmetric(vertical: 14),
                ),
                child: Obx(() => cartController.isLoading.value
                    ? const CircularProgressIndicator(color: Colors.white)
                    : const Text(
                        'Place your Order',
                        style: TextStyle(color: Colors.white, fontSize: 16),
                      )),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
