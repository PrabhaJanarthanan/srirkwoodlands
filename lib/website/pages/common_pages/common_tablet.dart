import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:profinix_app/website/utils/constants.dart';
import 'package:profinix_app/website/widgets/basewidgets.dart';

Widget CommonTablet(String s1, s2, s3, image, bool imageLeft) {
  double width = w ?? Get.context?.width ?? 400;

  return SingleChildScrollView(
    child: Container(
      padding: EdgeInsets.symmetric(horizontal: width / 8, vertical: 40),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            height: 250,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(image),
                fit: BoxFit.contain,
              ),
              border: Border.all(color: Colors.pinkAccent),
              borderRadius: BorderRadius.circular(20),
            ),
          ),
          const SizedBox(height: 25),
          Text(
            s1.toUpperCase(),
            style: const TextStyle(
              color: Colors.pink,
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 15),
          Text(
            s2,
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.blueAccent,
              fontSize: width / 12,
              height: 1.2,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 15),
          Text(
            s3,
            textAlign: TextAlign.center,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 18,
            ),
          ),
          const SizedBox(height: 25),
          const Divider(
            height: 5,
            color: Colors.pinkAccent,
          ),
        ],
      ),
    ),
  );
}
