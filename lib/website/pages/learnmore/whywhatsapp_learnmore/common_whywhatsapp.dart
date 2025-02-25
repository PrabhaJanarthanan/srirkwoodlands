import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:profinix_app/website/widgets/basewidgets.dart';

Widget CommonPageWhyWhatsapp(
    String s1, String s2, image, bool imageLeft, String routeName) {
  try {
    final w = MediaQuery.of(Get.context!).size.width;
    final h = MediaQuery.of(Get.context!).size.height;

    //w = Get.context?.width;
    return Scaffold(
      body: SingleChildScrollView(
        child: Stack(
          //padding: EdgeInsets.symmetric(horizontal: w / 10, vertical: 30),
          children: [
            Positioned.fill(
              child: Image.asset(
                'assets/background/featuresbg.png',
                fit: BoxFit.cover,
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: w / 10, vertical: 30),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  imageLeft
                      ? Expanded(
                          child: Container(
                            height: 530,
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: Colors.pink,
                                width: 2,
                              ),
                              image: DecorationImage(
                                  image: AssetImage(image),
                                  fit: BoxFit.contain),
                            ),
                          ),
                        )
                      : const SizedBox(),
                  const SizedBox(width: 30),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: imageLeft
                          ? CrossAxisAlignment.end
                          : CrossAxisAlignment.start,
                      children: [
                        const SizedBox(height: 10),
                        ProText(
                          s1,
                          textAlign: TextAlign.start,
                          style: TextStyle(
                              decoration: TextDecoration.none,
                              color: Colors.white,
                              fontSize: w / 24 < 30 ? 30 : w / 24,
                              //fontSize: 20,
                              height: 1.2,
                              fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(height: 20),
                        ProText(
                          s2,
                          textAlign:
                              imageLeft ? TextAlign.right : TextAlign.left,
                          style: const TextStyle(
                            decoration: TextDecoration.none,
                            color: Colors.white,
                            //fontSize: w! / 20,
                            fontSize: 18,
                            height: 1.6,

                            //fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 10),
                      ],
                    ),
                  ),
                  const SizedBox(width: 30),
                  !imageLeft
                      ? Expanded(
                          child: Container(
                          height: 530,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage(image), fit: BoxFit.contain),
                          ),
                        ))
                      : Container()
                ],
              ),
            ),
          ],
        ),
      ),
    );
  } catch (e) {
    print(e);
    return Container(child: Text(e.toString()));
  }
}

// Widget CommonMobile(String s1, s2, s3, image, bool imageLeft) {
//   return SingleChildScrollView(
//     child: Container(
//       padding: EdgeInsets.symmetric(horizontal: w! / 10, vertical: 30),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.center,
//         children: [
//           Container(
//             height: 200,
//             decoration: BoxDecoration(
//               image: DecorationImage(
//                   image: AssetImage(image), fit: BoxFit.contain),
//             ),
//           ),
//           const SizedBox(height: 20),
//           ProText(
//             s1.toUpperCase(),
//             style: const TextStyle(
//               color: Colors.pink,
//               fontSize: 20,
//               fontWeight: FontWeight.bold,
//             ),
//           ),
//           const SizedBox(height: 10),
//           ProText(
//             s2,
//             textAlign: TextAlign.start,
//             style: TextStyle(
//                 color: Colors.white,
//                 fontSize: w! / 10,
//                 height: 1.1,
//                 fontWeight: FontWeight.bold),
//           ),
//           const SizedBox(
//             height: 10,
//           ),
//           ProText(
//             s3,
//             textAlign: TextAlign.start,
//             style: const TextStyle(
//               color: Colors.white,
//               fontSize: 15,
//             ),
//           ),
//           const SizedBox(
//             height: 20,
//           ),
//           TextButton.icon(
//             onPressed: () {},
//             icon: const Icon(
//               Icons.arrow_forward_ios,
//               size: 20,
//               color: Colors.pink,
//             ),
//             label: const ProText(
//               'Learn more',
//               style: TextStyle(
//                 color: Colors.pink,
//                 fontSize: 18,
//                 fontWeight: FontWeight.bold,
//               ),
//             ),
//           ),
//           const SizedBox(height: 10),
//           const Divider(
//             height: 5,
//             color: Colors.pinkAccent,
//           ),
//         ],
//       ),
//     ),
//   );
// }

// Widget CommonTablet(
//     String s1, String s2, String s3, String image, bool imageLeft) {
//   final w = MediaQuery.of(Get.context!).size.width;

//   return SingleChildScrollView(
//     child: Container(
//       padding: EdgeInsets.symmetric(horizontal: w / 10, vertical: 30),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.center,
//         children: [
//           Container(
//             height: 300,
//             decoration: BoxDecoration(
//               image: DecorationImage(
//                   image: AssetImage(image), fit: BoxFit.contain),
//             ),
//           ),
//           const SizedBox(height: 20),
//           ProText(
//             s1.toUpperCase(),
//             style: TextStyle(
//               color: WebColors.primary,
//               fontSize: 16,
//               fontWeight: FontWeight.bold,
//             ),
//           ),
//           const SizedBox(height: 10),
//           ProText(
//             s2,
//             textAlign: TextAlign.start,
//             style: const TextStyle(
//               color: Colors.white,
//               fontSize: 40,
//               //fontSize: w / 15,
//               height: 1.2,
//               fontWeight: FontWeight.bold,
//             ),
//           ),
//           const SizedBox(height: 10),
//           ProText(
//             s3,
//             textAlign: TextAlign.start,
//             style: const TextStyle(
//               color: Colors.white,
//               fontSize: 16,
//             ),
//           ),
//           TextButton.icon(
//             onPressed: () {},
//             icon: Icon(
//               Icons.arrow_forward_ios,
//               size: 15,
//               color: WebColors.primary,
//             ),
//             label: ProText(
//               'Learn more',
//               style: TextStyle(
//                 color: WebColors.primary,
//                 fontSize: 15,
//               ),
//             ),
//           ),
//         ],
//       ),
//     ),
//   );
// }
