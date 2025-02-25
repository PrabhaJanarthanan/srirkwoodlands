import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:profinix_app/website/utils/constants.dart';
import 'package:profinix_app/website/widgets/basewidgets.dart';

class OwnmanufacturerDesktop extends StatelessWidget {
  OwnmanufacturerDesktop({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double screenWidth = Get.width;

    return Container(
      height: 400,
      margin: EdgeInsets.symmetric(horizontal: screenWidth / 10, vertical: 20),
      child: Row(
        children: [
          Expanded(
            child: Container(
              padding: const EdgeInsets.only(bottom: 20.0),
              child: const Column(
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
                          fontSize: 50,
                          fontWeight: FontWeight.bold,
                          height: 1.3,
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
                          "At RK Woodlands, we take pride in having our own dedicated manufacturing unit, where every product is crafted with precision and care. Equipped with state-of-the-art machinery and a skilled workforce, we ensure that we maintain the highest standards of quality control. From resizing and cutting to finishing, we offer customized solutions tailored to your needs. Our in-house manufacturing unit allows us to maintain full control over production, ensuring timely delivery and superior craftsmanship for the best wooden creations.",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 25,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        SizedBox(height: 25),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
