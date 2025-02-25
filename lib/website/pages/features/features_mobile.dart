import 'package:flutter/material.dart';
//import 'package:get/get.dart';
import 'package:profinix_app/website/utils/colors.dart';
import 'package:profinix_app/website/utils/features_contents.dart';
import 'package:profinix_app/website/widgets/basewidgets.dart';

class FeaturesMobile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ProColumn(
      children: [
        const Padding(
          padding: EdgeInsets.symmetric(vertical: 20),
          child: Text(
            'Features',
            style: TextStyle(
              fontSize: 26,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
        ),
        for (int i = 0; i < featurescontents.length; i++)
          ProContainer(
            margin: const EdgeInsets.only(bottom: 20.0),
            padding: const EdgeInsets.all(10.0),
            width: double.infinity,
            decoration: BoxDecoration(
              // image: DecorationImage(
              //     image: AssetImage('assets/background/featuresbg.png')),
              //color: Colors.white,
              borderRadius: BorderRadius.circular(15),
              border: Border.all(
                color: Colors.white,
                //color: WebColors.primary,
                width: 1,
              ),
            ),
            child: ProColumn(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                ProRow(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      padding: const EdgeInsets.all(8.0),
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.transparent,
                      ),
                      child: Image.asset(
                        featurescontents[i]["img"],
                        width: 60.0,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                Text(
                  featurescontents[i]["title"],
                  style: const TextStyle(
                    fontWeight: FontWeight.normal,
                    color: Colors.white,
                    fontSize: 20,
                  ),
                ),
                const SizedBox(height: 5),
                Text(
                  featurescontents[i]["description"],
                  overflow: TextOverflow.clip,
                  style: const TextStyle(
                    fontSize: 14,
                    // fontWeight: FontWeight.normal,
                    color: Colors.white,
                  ),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
      ],
    );
  }
}
