import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:profinix_app/website/pages/shopping/cartcontroller.dart';
import 'package:profinix_app/website/pages/shopping/order_confirmation/orderconfirmation_desktop.dart';
import 'package:profinix_app/website/utils/constants/sizes.dart';
import 'package:profinix_app/website/utils/helpers/helper_functions.dart';

import '../../../controller/auth_controller.dart';
import '../../../utils/constants/colors.dart';

class CheckoutDesktop extends StatelessWidget {
  final CartController cartController = Get.find();

  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();
  final TextEditingController addressLine1Controller = TextEditingController();
  final TextEditingController pincodeController = TextEditingController();
  final TextEditingController countryController = TextEditingController();
  final TextEditingController stateController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController businessNameController = TextEditingController();
  final TextEditingController gstNumberController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    final dark = SNHelperFunctions.isDarkMode(context);
    return Container(
      // decoration: const BoxDecoration(
      //   image: DecorationImage(
      //     image: AssetImage('assets/rkbackgroundbrown.png'),
      //     fit: BoxFit.cover,
      //   ),
      // ),
      child: Scaffold(
      //  backgroundColor: Colors.transparent,
        appBar: AppBar(
          title:  Text('Checkout Page',
              style: Theme.of(context).textTheme.headlineSmall),
              centerTitle: true,
               iconTheme:  IconThemeData(color: dark? SNColors.white : SNColors.black), 
               actions: [
    // Home Button before user icon
    IconButton(
      icon:  Icon(Icons.home, color: dark? SNColors.white : SNColors.black),
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
                      ? Icon(Icons.person, 
                      size: SNSizes.iconSm, 
                      color: dark ? SNColors.white : SNColors.black)
                      : null, // Default icon if no photo
                 // child: Icon(Icons.person, size: 20, color: Colors.white),
                ),
              ),
            )
          : IconButton(
              icon: Icon(Icons.login_sharp, color: dark ? SNColors.white : SNColors.black),
              onPressed: () async {
                bool isLoggedIn = await AuthController.instance.signInWithGoogle();
                if (isLoggedIn) {
                  Get.snackbar("Success", "Logged in successfully!",
                      backgroundColor: Colors.green,
                      colorText: Colors.white);
                }
              },
            );
    }),
  ],
            //   actions: [
            //      RawMaterialButton(onPressed: (){
            //   Get.toNamed('/');
            // }, child: const Icon(Icons.home, color: Colors.white,
            // shadows: [BoxShadow(spreadRadius: 0.4)],
            // size: 32),),
            //   ],
          backgroundColor: Colors.transparent,
        ),
        
        body: Padding(
          padding: const EdgeInsets.all(20),
          child: Center(
            child: Container(
              padding: const EdgeInsets.all(20),
              height: 900,
              width: 800,
              decoration: BoxDecoration(
                color: Colors.transparent,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                     Text('Billing Details',
                     style: Theme.of(context).textTheme.headlineSmall
                        ),
                    const SizedBox(height: 15),
                    Row(
                      children: [
                        Expanded(
                          child: TextFormField(
                            controller: firstNameController,
                            style: Theme.of(context).textTheme.labelMedium,
                            decoration:  InputDecoration(
                              labelText: 'Name *',
                              labelStyle: Theme.of(context).textTheme.labelMedium,
                              border: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(20)),
                              ),
                            ),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Name is required';
                              }
                              return null;
                            },
                          ),
                        ),
                        const SizedBox(width: 20),
                        Expanded(
                          child: TextFormField(
                            controller: emailController,
                            style: Theme.of(context).textTheme.labelMedium,
                            decoration:  InputDecoration(
                              labelText: 'Email *',
                              labelStyle: Theme.of(context).textTheme.labelMedium,
                              border: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(20)),
                              ),
                            ),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Email is required';
                              } else if (!RegExp(
                                      r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$')
                                  .hasMatch(value)) {
                                return 'Enter a valid email';
                              }
                              return null;
                            },
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 10),
                    Row(
                      children: [
                        Expanded(
                          child: TextFormField(
                            controller: businessNameController,
                            style: Theme.of(context).textTheme.labelMedium,
                            decoration:  InputDecoration(
                              labelText: 'Business Name (Optional)',
                              labelStyle:  Theme.of(context).textTheme.labelMedium,
                              border: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(20)),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(width: 10),
                        Expanded(
                          child: TextFormField(
                            controller: gstNumberController,
                            style: Theme.of(context).textTheme.labelMedium,
                            decoration:  InputDecoration(
                                labelText: 'GST Number (Optional)',
                                labelStyle:  Theme.of(context).textTheme.labelMedium,
                                border: OutlineInputBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(20)))),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 10),
                    Column(
                      children: [
                        TextFormField(
                          controller: addressLine1Controller,
                         style: Theme.of(context).textTheme.labelMedium,
                          decoration:  InputDecoration(
                            labelText: 'Address Line 1 *',
                            labelStyle:  Theme.of(context).textTheme.labelMedium,
                            border: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(20)),
                            ),
                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Address is required';
                            }
                            return null;
                          },
                        ),
                      ],
                    ),
                    const SizedBox(height: 10),
                    Row(
                      children: [
                        Expanded(
                          child: TextFormField(
                            controller: countryController,
                            style: Theme.of(context).textTheme.labelMedium,
                            decoration:  InputDecoration(
                              labelText: 'Country *',
                              labelStyle:  Theme.of(context).textTheme.labelMedium,
                              border: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(20)),
                              ),
                            ),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Country is required';
                              }
                              return null;
                            },
                          ),
                        ),
                        const SizedBox(width: 20),
                        Expanded(
                          child: TextFormField(
                            controller: stateController,
                            style: Theme.of(context).textTheme.labelMedium,
                            decoration:  InputDecoration(
                              labelText: 'State *',
                              labelStyle: Theme.of(context).textTheme.labelMedium,
                              border: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(20)),
                              ),
                            ),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'State is required';
                              }
                              return null;
                            },
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 10),
                    Row(
                      children: [
                        Expanded(
                          child: TextFormField(
                            controller: phoneController,
                            style: Theme.of(context).textTheme.labelMedium,
                            keyboardType: TextInputType.phone,
                            decoration:  InputDecoration(
                              labelText: 'Phone Number (+Country Code) *',
                              labelStyle:  Theme.of(context).textTheme.labelMedium,
                              border: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(20)),
                              ),
                            ),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Phone number is required';
                              }

                              String pattern = r'^\+\d{1,3}\d{7,12}$';
                              RegExp regex = RegExp(pattern);
                              if (!regex.hasMatch(value)) {
                                return 'Enter a valid phone number with country code (e.g. +919876543210)';
                              }

                              return null;
                            },
                          ),
                        ),
                        const SizedBox(width: 20),
                        Expanded(
                          child: TextFormField(
                            controller: pincodeController,
                            style: Theme.of(context).textTheme.labelMedium,
                            keyboardType: TextInputType.number,
                            decoration:  InputDecoration(
                              labelText: 'Postal Code *',
                              labelStyle:Theme.of(context).textTheme.labelMedium,
                              border: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(20)),
                              ),
                            ),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Postal code is required';
                              }
                              return null;
                            },
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 10),
                    const Divider(),
                    const SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Obx(() {
                          return Text(
                              'Total: ₹${cartController.totalPrice.toStringAsFixed(2)}',
                              style: Theme.of(context).textTheme.headlineSmall);
                        }),
                      ],
                    ),
                    const Spacer(),
                 
                    ElevatedButton(
                      onPressed: () {
                        if (!_formKey.currentState!.validate()) {
                          Get.snackbar(
                            'Error',
                            'Please fill in all Mandatory fields',
                            backgroundColor: Colors.red,
                            colorText: dark ? SNColors.white : SNColors.black,
                          );
                          return;
                        }

                        Get.to(() => OrderConfirmationDesktop(
                              firstName: firstNameController.text,
                              lastName: lastNameController.text,
                              addressLine1: addressLine1Controller.text,
                              postalCode: pincodeController.text,
                              country: countryController.text,
                              state: stateController.text,
                              phone: phoneController.text,
                              email: emailController.text,
                              businessName:
                                  businessNameController.text.isNotEmpty
                                      ? businessNameController.text
                                      : "N/A",
                              gstNumber: gstNumberController.text.isNotEmpty
                                  ? gstNumberController.text
                                  : "N/A",
                            ));
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color.fromARGB(255, 233, 156, 13),
                        minimumSize: const Size(double.infinity, 50),
                      ),
                      child:  Text(
                        'Proceed to Confirmation',
                        style: Theme.of(context).textTheme.headlineSmall
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
