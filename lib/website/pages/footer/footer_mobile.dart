import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:profinix_app/website/utils/colors.dart';
import 'package:profinix_app/website/widgets/basewidgets.dart';

class FooterMobile extends StatefulWidget {
  const FooterMobile({super.key});

  @override
  State<FooterMobile> createState() => _FooterMobileState();
}

class _FooterMobileState extends State<FooterMobile> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
      width: double.maxFinite,
      alignment: Alignment.center,
      //color: WebColors.primary,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const ProText(
            "© 1982 Sri RK Woodlands, Inc.",
            style: TextStyle(
              fontWeight: FontWeight.w400,
              color: Colors.white,
            ),
          ),
          const SizedBox(height: 10),
          Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              InkWell(
                onTap: () {
                  Get.toNamed('/privacypolicy');
                },
                child: const ProText(
                  'Privacy Policy',
                  style: TextStyle(
                    color: Colors.white,
                    decoration: TextDecoration.underline,
                    decorationColor: Color.fromARGB(255, 233, 156, 13),
                    fontSize: 15,
                  ),
                ),
              ),
              const SizedBox(height: 10),
              InkWell(
                onTap: () {
                  Get.toNamed('/termsandconditions');
                },
                child: const ProText(
                  'Terms and Conditions',
                  style: TextStyle(
                    color: Colors.white,
                    decoration: TextDecoration.underline,
                    decorationColor: Color.fromARGB(255, 233, 156, 13),
                    fontSize: 15,
                  ),
                ),
              ),
              const SizedBox(height: 10),
              InkWell(
                onTap: () {
                  Get.toNamed('/returnsrefund');
                },
                child: const ProText(
                  'Refund Policy',
                  style: TextStyle(
                    color: Colors.white,
                    decoration: TextDecoration.underline,
                    decorationColor: Color.fromARGB(255, 233, 156, 13),
                    fontSize: 15,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
