import 'package:flutter/material.dart';
import 'package:profinix_app/website/utils/constants.dart';
import 'package:profinix_app/website/widgets/basewidgets.dart';

Widget CommonMobile(String s1, s2, s3, image, bool imageLeft) {
  return SingleChildScrollView(
    child: Container(
      padding: EdgeInsets.symmetric(horizontal: w! / 10, vertical: 30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            height: 200,
            decoration: BoxDecoration(
              image:
                  DecorationImage(image: AssetImage(image), fit: BoxFit.cover),
              border: Border.all(color: Colors.white),
              borderRadius: BorderRadius.circular(20),
            ),
          ),
          // const SizedBox(height: 20),
          // Text(
          //   s1.toUpperCase(),
          //   style: const TextStyle(
          //     color: Colors.pink,
          //     fontSize: 20,
          //     fontWeight: FontWeight.bold,
          //   ),
          // ),
          const SizedBox(height: 10),
          Text(
            s2,
            textAlign: TextAlign.center,
            style: const TextStyle(
                color: Colors.white,
                fontSize: 20,
                height: 1.3,
                fontWeight: FontWeight.normal),
          ),
          const SizedBox(height: 10),
          Text(
            s3,
            textAlign: TextAlign.center,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 18,
            ),
          ),
          const SizedBox(height: 20),

          const Divider(
            height: 5,
            color: Color.fromARGB(255, 233, 156, 13),
          ),
        ],
      ),
    ),
  );
}
