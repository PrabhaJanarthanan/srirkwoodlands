import 'package:flutter/material.dart';
import 'package:profinix_app/website/utils/constants.dart';
import 'package:profinix_app/website/utils/snslinks.dart';
import 'dart:js' as js;
import 'package:profinix_app/website/widgets/basewidgets.dart';

class PricingContactPage extends StatelessWidget {
  const PricingContactPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final isTabletOrSmaller = constraints.maxWidth < 1024;
        final double padding = isTabletOrSmaller ? 16 : 32;
        final double fontSize = isTabletOrSmaller ? 16 : 20;
        final double headingFontSize = isTabletOrSmaller ? 28 : 35;

        return SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.all(padding),
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage(
                    'assets/background/frontbg.jpg'), // Your image path here
                fit: BoxFit.cover,
              ),

              //color: WebColors.primary,
            ),
            child: Column(
              children: [
                const SizedBox(height: 30),
                ShaderMask(
                  shaderCallback: (bounds) => const LinearGradient(
                    colors: [
                      Colors.pinkAccent,
                      Colors.blueAccent,
                    ],
                    begin: Alignment.bottomLeft,
                    end: Alignment.topRight,
                  ).createShader(bounds),
                  child: Text(
                    "Contact Us",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: headingFontSize,
                      color: Colors.white,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                const SizedBox(height: 50),
                Flex(
                  direction:
                      isTabletOrSmaller ? Axis.vertical : Axis.horizontal,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          SizedBox(height: isTabletOrSmaller ? 20 : 10),
                          Text(
                            "Profinix Technologies, \n118, EVN Road, \nMunicipal Colony, \nEdayankattuvalasu, \nErode, \nTamilnadu-638001, \nIndia",
                            style: TextStyle(
                              fontSize: fontSize,
                              fontWeight: FontWeight.normal,
                              color: Colors.white,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(width: 20, height: 20),
                    Expanded(
                      child: Container(
                        padding: const EdgeInsets.all(8),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Text(
                              '+91 9043249455, \n support@profinix.tech',
                              style: TextStyle(
                                fontSize: fontSize,
                                color: Colors.white,
                                fontWeight: FontWeight.normal,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 30),
                const Divider(
                  color: Colors.pinkAccent,
                ),
                const SizedBox(height: 25),
                Wrap(
                  spacing: 12,
                  runSpacing: 12,
                  alignment: WrapAlignment.center,
                  children: [
                    InkWell(
                      onTap: () {
                        js.context.callMethod('open', [SnsLinks.facebook]);
                      },
                      child: Image.asset(fb, width: 35),
                    ),
                    InkWell(
                      onTap: () {
                        js.context.callMethod('open', [SnsLinks.instagram]);
                      },
                      child: Image.asset(insta, width: 35),
                    ),
                    InkWell(
                      onTap: () {
                        js.context.callMethod('open', [SnsLinks.linkedin]);
                      },
                      child: Image.asset(linked, width: 35),
                    ),
                  ],
                ),
                const SizedBox(height: 10),
              ],
            ),
          ),
        );
      },
    );
  }
}
