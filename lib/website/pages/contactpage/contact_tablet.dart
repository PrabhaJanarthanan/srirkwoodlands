import 'package:flutter/material.dart';
import 'package:profinix_app/website/utils/constants.dart';
import 'package:profinix_app/website/utils/snslinks.dart';
import 'dart:js' as js;
import 'package:profinix_app/website/widgets/basewidgets.dart';

class ContactPageTablet extends StatelessWidget {
  const ContactPageTablet({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 30),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(15),
              child: ShaderMask(
                shaderCallback: (bounds) => const LinearGradient(
                  colors: [
                    Colors.pinkAccent,
                    Colors.blueAccent,
                  ],
                  begin: Alignment.bottomLeft,
                  end: Alignment.topRight,
                ).createShader(bounds),
                child: const Text(
                  "Contact Us",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 26, // Increased font size for tablet
                    color: Colors.white,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
            const SizedBox(height: 25),
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Text(
                  "Profinix Technologies, \nNo:118, EVN Road, \nMunicipal Colony, \nEdayankattuvalasu, \nErode-638001, \nTamilnadu, \nIndia",
                  style: TextStyle(
                    fontSize: 18, // Slightly larger font size
                    fontWeight: FontWeight.normal,
                    color: Colors.white,
                  ),
                  textAlign: TextAlign.start,
                ),
                const SizedBox(height: 25),
                Container(
                  padding: EdgeInsets.only(left: 300),
                  child: const Text(
                    'Call: +91 9043249455 \nsupport@profinix.tech',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.normal,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 35),
            const Divider(
              height: 5,
              color: Colors.pinkAccent,
            ),
            const SizedBox(height: 30),
            Wrap(
              spacing: 15,
              runSpacing: 15,
              alignment: WrapAlignment.center,
              children: [
                InkWell(
                  onTap: () {
                    js.context.callMethod('open', [SnsLinks.facebook]);
                  },
                  child: Image.asset(fb, width: 45), // Increased size for icons
                ),
                InkWell(
                  onTap: () {
                    js.context.callMethod('open', [SnsLinks.instagram]);
                  },
                  child: Image.asset(insta, width: 45),
                ),
                InkWell(
                  onTap: () {
                    js.context.callMethod('open', [SnsLinks.linkedin]);
                  },
                  child: Image.asset(linked, width: 45),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
