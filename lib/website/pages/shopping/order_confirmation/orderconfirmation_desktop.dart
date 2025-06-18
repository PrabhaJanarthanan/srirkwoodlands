import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:profinix_app/website/pages/shopping/cartcontroller.dart';
import 'package:profinix_app/website/pages/shopping/orderplacedmessage.dart';
import 'package:profinix_app/website/utils/constants/colors.dart';
import 'package:profinix_app/website/utils/helpers/helper_functions.dart';


class OrderConfirmationDesktop extends StatefulWidget {
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

  OrderConfirmationDesktop({
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
  _OrderConfirmationDesktopState createState() => _OrderConfirmationDesktopState();
}

class _OrderConfirmationDesktopState extends State<OrderConfirmationDesktop> {
  final CartController cartController = Get.find();
  double shippingCharges = 100.0;
  double gstRate = 12.0;

  @override
  void dispose() {
    super.dispose();
  }

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
            title:  Text('Confirm Your Order',
                style: Theme.of(context).textTheme.headlineSmall,
                ),
                 iconTheme:  IconThemeData(color: dark? SNColors.white : SNColors.black), 
            backgroundColor: Colors.transparent),
            
        body: Padding(
          padding: const EdgeInsets.all(20),
          child: Center(
            child: Container(
              padding: const EdgeInsets.all(20),
              height: 900, // Adjusted height to accommodate more fields
              width: 800,
              // decoration: BoxDecoration(
              //   color: Colors.white,
              //   borderRadius: BorderRadius.circular(20),
              //   boxShadow: const [
              //     // BoxShadow(
              //     //   color: Color.fromARGB(255, 233, 156, 13),
              //     //   blurRadius: 10,
              //     //   offset: Offset(0, 4),
              //     // ),
              //   ],
              // ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Company Details (Sticky Header)
                  Container(
                    padding: const EdgeInsets.symmetric(
                        vertical: 10, horizontal: 20),
                    child:  Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text('Sri Nivi Boutique',
                           style:  Theme.of(context).textTheme.headlineSmall),
                        SizedBox(height: 5),
                        Text(
                            'Address: 178, Erode Road, Krishnapuram, Erode, Tamilnadu',
                           style:  Theme.of(context).textTheme.labelMedium
                            ),
                        SizedBox(height: 5),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Text('Phone: +91 97912 96517',
                                style:  Theme.of(context).textTheme.labelMedium
                                ),
                            const Divider(height: 5),
                            Text('GSTIN: 33AHGPA3900N1ZO',
                                style:  Theme.of(context).textTheme.labelMedium),
                            SizedBox(width: 5),
                            Text('PAN: AHGPA3900N',
                                style:  Theme.of(context).textTheme.labelMedium),
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
                                 style:  Theme.of(context).textTheme.labelLarge
                                      ),
                              // const SizedBox(height: 5),
                              Text(widget.email,
                                 style:  Theme.of(context).textTheme.labelLarge
                                  ),
                              Text('Mob: ${widget.phone}',
                                  style:  Theme.of(context).textTheme.labelLarge
                                  ),
                              Text(widget.addressLine1,
                                 style:  Theme.of(context).textTheme.labelLarge
                                  ),
                              Text(
                                  '${widget.state}, ${widget.country} - ${widget.postalCode}',
                                  style:  Theme.of(context).textTheme.labelLarge
                                  ),
                              Text('${widget.businessName}',
                                  style:  Theme.of(context).textTheme.labelLarge
                                  ),
                              Text('GST No: ${widget.gstNumber}',
                                  style:  Theme.of(context).textTheme.labelLarge
                                  ),
                              const Divider(height: 5),
                               Text('Order Summary:',
                               style:  Theme.of(context).textTheme.labelLarge
                                      ),
                            ],
                          ),

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
                                    builder: (context) =>  MessagePage()),
                              );
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor:
                                  Color.fromARGB(255, 233, 156, 13),
                              minimumSize: const Size(double.infinity, 50),
                            ),
                            child: Obx(() => cartController.isLoading.value
                                ?  CircularProgressIndicator(
                                    color: dark ? SNColors.white : SNColors.black,) 
                                :  Text(
                                    'Place your Order',
                                    style:  Theme.of(context).textTheme.headlineSmall
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
