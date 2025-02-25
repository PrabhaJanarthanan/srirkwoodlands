import 'package:flutter/material.dart';
import 'package:profinix_app/website/utils/constants.dart';
import 'package:profinix_app/website/utils/snslinks.dart';
import 'package:profinix_app/website/widgets/basewidgets.dart';

class ContactPageMobile extends StatelessWidget {
  const ContactPageMobile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        // width: w! / 1.1,
        // padding: const EdgeInsets.fromLTRB(15, 20, 15, 40),
        decoration: BoxDecoration(
          //color: WebColors.primary,
          borderRadius: BorderRadius.circular(0),
        ),

        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(10),
              child: ShaderMask(
                shaderCallback: (bounds) => const LinearGradient(
                  colors: [
                    Color.fromARGB(255, 233, 156, 13),
                    Color.fromARGB(255, 245, 208, 85),
                  ],
                  begin: Alignment.bottomLeft,
                  end: Alignment.topRight,
                ).createShader(bounds),
                child: const Text(
                  "Contact Us",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 22,
                    color: Colors.white,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
            const SizedBox(height: 20),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 10),
                const Text(
                  "Sri RK Woodlands, \nNo:178, Erode Road, \nKrishnapuram, \nErode, \nTamilnadu-638455, \nIndia",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.normal,
                    color: Colors.white,
                  ),
                  textAlign: TextAlign.start,
                ),
                const SizedBox(height: 20),
                Container(
                  //color: Colors.grey,
                  padding: const EdgeInsets.all(8),
                  child: Column(
                    children: [
                      const Text(
                        'Call: +91 9791296517',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      Text(
                        'Email: srirkwoodlands@gmail.com',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 30),
            const Divider(
              height: 5,
              color: Colors.white,
            ),
            const SizedBox(height: 25),
            // Wrap(
            //   spacing: 12,
            //   runSpacing: 12,
            //   alignment: WrapAlignment.center,
            //   children: [
            //     InkWell(
            //       onTap: () {
            //         js.context.callMethod('open', [SnsLinks.facebook]);
            //       },
            //       child: Image.asset(fb, width: 35),
            //     ),
            //     const SizedBox(width: 10),
            //     InkWell(
            //       onTap: () {
            //         js.context.callMethod('open', [SnsLinks.instagram]);
            //       },
            //       child: Image.asset(insta, width: 35),
            //     ),
            //     const SizedBox(width: 10),
            //     InkWell(
            //       onTap: () {
            //         js.context.callMethod('open', [SnsLinks.linkedin]);
            //       },
            //       child: Image.asset(linked, width: 35),
            //     ),
            //   ],
            // ),
          ],
        ),
      ),
    );
  }
}
