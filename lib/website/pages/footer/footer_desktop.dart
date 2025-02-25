import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:profinix_app/website/widgets/basewidgets.dart';

class FooterDesktop extends StatefulWidget {
  const FooterDesktop({super.key});

  @override
  State<FooterDesktop> createState() => _FooterDesktopState();
}

class _FooterDesktopState extends State<FooterDesktop> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          // image: DecorationImage(
          //   image: AssetImage('assets/background/commoncontainerback.png'),
          //   fit: BoxFit.cover,
          // ),
          ),
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 2),
      width: double.maxFinite,
      alignment: Alignment.center,
      //color: WebColors.primary,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Text(
            '© 1983 Sri RK Woodlands, Inc.',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w400,
              color: Colors.white,
            ),
          ),
          const SizedBox(height: 15),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            mainAxisSize: MainAxisSize.min,
            children: [
              InkWell(
                onTap: () {
                  Get.toNamed('/privacypolicy');
                },
                child: const Text(
                  'Privacy Policy',
                  style: TextStyle(
                    color: Colors.white,
                    decoration: TextDecoration.underline,
                    decorationColor: Color.fromARGB(255, 233, 156, 13),
                    fontSize: 16,
                  ),
                ),
              ),
              const SizedBox(width: 30),
              InkWell(
                onTap: () {
                  Get.toNamed('/termsandconditions');
                },
                child: const Text(
                  'Terms and Conditions',
                  style: TextStyle(
                    color: Colors.white,
                    decoration: TextDecoration.underline,
                    decorationColor: Color.fromARGB(255, 233, 156, 13),
                    fontSize: 16,
                  ),
                ),
              ),
              const SizedBox(width: 30),
              InkWell(
                onTap: () {
                  Get.toNamed('/returnsandrefund');
                },
                child: const Text(
                  'Refund Policy',
                  style: TextStyle(
                    color: Colors.white,
                    decoration: TextDecoration.underline,
                    decorationColor: Color.fromARGB(255, 233, 156, 13),
                    fontSize: 16,
                  ),
                ),
              ),
              const SizedBox(width: 30),
              InkWell(
                onTap: () {
                  Get.toNamed('/shippinganddelivery');
                },
                child: const Text(
                  'Shipping and Delivery Policy',
                  style: TextStyle(
                    color: Colors.white,
                    decoration: TextDecoration.underline,
                    decorationColor: Color.fromARGB(255, 233, 156, 13),
                    fontSize: 16,
                  ),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
