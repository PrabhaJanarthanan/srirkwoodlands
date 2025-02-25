import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:profinix_app/website/utils/constants.dart';
import 'package:profinix_app/website/widgets/basewidgets.dart';

class OwnmanufacturerMobile extends StatelessWidget {
  OwnmanufacturerMobile({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double screenWidth = Get.width;

    return Container(
      height: 300,
      margin: EdgeInsets.symmetric(horizontal: screenWidth / 10, vertical: 20),
      child: Row(
        children: [
          Expanded(
            child: Container(
              //padding: const EdgeInsets.only(bottom: 20.0),
              child: const Column(
                spacing: 10,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Static Heading without Animation
                  Expanded(
                    flex: 1,
                    child: Center(
                      child: Text(
                        "In-House Manufacturing for Unmatched Quality",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 30,
                          fontWeight: FontWeight.normal,
                          //height: 1.3,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                  // Static Text below the Heading
                  Expanded(
                    flex: 2,
                    child: Column(
                      children: [
                        Text(
                          "At RK Woodlands, we craft every product with precision in our dedicated manufacturing unit. With advanced machinery and skilled craftsmanship, we ensure top-quality, customized wooden creations with timely delivery.",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        SizedBox(height: 10),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          Divider(
            height: 5,
            color: Colors.white,
          ),
        ],
      ),
    );
  }
}
