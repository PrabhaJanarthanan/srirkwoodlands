import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:profinix_app/website/controller/order_controller.dart';
import 'package:profinix_app/website/pages/shopping/cartcontroller.dart';
import 'package:profinix_app/website/pages/shopping/orderplacedmessage.dart';

class OrderConfirmationPage extends StatefulWidget {
  final String firstName;
  final String lastName;
  final String phone;
  final String email;
  final String addressLine1;
  // final String addressLine2;
  final String state;
  final String country;
  final String postalCode;
  final String businessName;
  final String gstNumber;

  OrderConfirmationPage({
    required this.firstName,
    required this.lastName,
    required this.phone,
    required this.email,
    required this.addressLine1,
    //required this.addressLine2,
    required this.state,
    required this.country,
    required this.postalCode,
    required this.businessName,
    required this.gstNumber,
  });

  @override
  _OrderConfirmationPageState createState() => _OrderConfirmationPageState();
}

class _OrderConfirmationPageState extends State<OrderConfirmationPage> {
  final CartController cartController = Get.find();
  double shippingCharges = 100.0;
  double gstRate = 12.0;

  @override
  void dispose() {
    super.dispose();
  }

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
            title: const Text('Confirm Your Order',
                style: TextStyle(color: Colors.white)),
            backgroundColor: Colors.transparent),
        body: Padding(
          padding: const EdgeInsets.all(20),
          child: Center(
            child: Container(
              padding: const EdgeInsets.all(20),
              height: 900, // Adjusted height to accommodate more fields
              width: 800,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
                boxShadow: const [
                  // BoxShadow(
                  //   color: Color.fromARGB(255, 233, 156, 13),
                  //   blurRadius: 10,
                  //   offset: Offset(0, 4),
                  // ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Company Details (Sticky Header)
                  Container(
                    padding: const EdgeInsets.symmetric(
                        vertical: 10, horizontal: 20),
                    child: const Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text('Sri RK Woodlands',
                            style: TextStyle(
                                fontSize: 30, fontWeight: FontWeight.bold)),
                        SizedBox(height: 5),
                        Text(
                            'Address: 178, Erode Road, Krishnapuram, Erode, Tamilnadu',
                            style: TextStyle(fontSize: 14)),
                        SizedBox(height: 5),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Text('Phone: +91 97912 96517',
                                style: TextStyle(fontSize: 14)),
                            const Divider(height: 5),
                            Text('GSTIN: 33AHGPA3900N1ZO',
                                style: TextStyle(fontSize: 14)),
                            SizedBox(width: 5),
                            Text('PAN: AHGPA3900N',
                                style: TextStyle(fontSize: 14)),
                          ],
                        ),
                        Divider(height: 5),
                      ],
                    ),
                  ),

                  Expanded(
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text('${widget.firstName} ${widget.lastName}',
                                  style: const TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold)),
                              // const SizedBox(height: 5),
                              Text(widget.email,
                                  style: const TextStyle(fontSize: 14)),
                              Text('Mob: ${widget.phone}',
                                  style: const TextStyle(fontSize: 14)),
                              Text(widget.addressLine1,
                                  style: const TextStyle(fontSize: 14)),
                              Text(
                                  '${widget.state}, ${widget.country} - ${widget.postalCode}',
                                  style: const TextStyle(fontSize: 14)),
                              Text('${widget.businessName}',
                                  style: const TextStyle(fontSize: 14)),
                              Text('GST No: ${widget.gstNumber}',
                                  style: const TextStyle(fontSize: 14)),
                              const Divider(height: 5),
                              const Text('Order Summary:',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18)),
                            ],
                          ),

                          // Invoice and Order Summary (with GST and Shipping Charges)
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
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                ],
                              )),

                          const SizedBox(height: 10),

                          ElevatedButton(
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
                              backgroundColor:
                                  Color.fromARGB(255, 233, 156, 13),
                              minimumSize: const Size(double.infinity, 50),
                            ),
                            child: Obx(() => cartController.isLoading.value
                                ? const CircularProgressIndicator(
                                    color: Colors.white) // Show Loader
                                : const Text(
                                    'Place your Order',
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 16),
                                  )),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
