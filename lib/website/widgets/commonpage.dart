// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:profinix_app/website/utils/constants.dart';
// import 'package:profinix_app/website/widgets/basewidgets.dart';

// Widget CommonDesktop(String s1, s2, s3, String? image, bool imageLeft,
//     {bool addData = false}) {
//   try {
//     w = Get.context?.width;
//     return Container(
//       padding: EdgeInsets.symmetric(horizontal: w! / 15, vertical: 10),
//       child: Row(
//         children: [
//           imageLeft
//               ? Expanded(
//                   child: Container(
//                     height: 530,
//                     decoration: BoxDecoration(
//                       border: Border.all(
//                         color: Colors.pink,
//                         width: 2,
//                       ),
//                       borderRadius: BorderRadius.circular(20),
//                       image: image != null
//                           ? DecorationImage(
//                               image: AssetImage(image), fit: BoxFit.contain)
//                           : null,
//                     ),
//                   ),
//                 )
//               : Container(),
//           const SizedBox(width: 30),
//           Expanded(
//             child: Column(
//               crossAxisAlignment:
//                   imageLeft ? CrossAxisAlignment.end : CrossAxisAlignment.start,
//               children: [
//                 ProText(
//                   s1.toUpperCase(),
//                   style: const TextStyle(
//                     color: Colors.pink,
//                     fontSize: 20,
//                     fontWeight: FontWeight.bold,
//                   ),
//                 ),
//                 const SizedBox(height: 10),
//                 ProText(
//                   s2,
//                   textAlign: TextAlign.start,
//                   style: TextStyle(
//                       color: Colors.white,
//                       fontSize: w! / 20,
//                       height: 1.2,
//                       fontWeight: FontWeight.bold),
//                 ),
//                 const SizedBox(height: 10),
//                 ProText(
//                   s3,
//                   textAlign: imageLeft ? TextAlign.right : TextAlign.left,
//                   style: const TextStyle(
//                     color: Colors.white,
//                     fontSize: 20,
//                     height: 1.3,
//                   ),
//                 ),
//                 const SizedBox(height: 20),

//                 // Adding the list of benefits if addData is true
//                 if (addData)
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     children: [
//                       Expanded(
//                         child: Column(
//                           crossAxisAlignment: CrossAxisAlignment.start,
//                           children: [
//                             _buildBulletPoint("Direct Communication"),
//                             _buildBulletPoint("High Engagement Rate"),
//                             _buildBulletPoint("Global Reach"),
//                             _buildBulletPoint("Automated Messaging"),
//                             _buildBulletPoint("Increased Customer Trust"),
//                           ],
//                         ),
//                       ),
//                       const SizedBox(width: 10),
//                       Expanded(
//                         child: Column(
//                           crossAxisAlignment: CrossAxisAlignment.start,
//                           children: [
//                             _buildBulletPoint("Cost-Effective Marketing"),
//                             _buildBulletPoint("Personalized Experience"),
//                             _buildBulletPoint("Rich Media Support"),
//                             _buildBulletPoint("Two-way Communication"),
//                             _buildBulletPoint("Customer Feedback & Survey")
//                           ],
//                         ),
//                       ),
//                     ],
//                   ),
//               ],
//             ),
//           ),
//           const SizedBox(width: 60),
//           !imageLeft
//               ? Expanded(
//                   child: Container(
//                     height: 630,
//                     decoration: BoxDecoration(
//                       border: Border.all(
//                         color: Colors.pinkAccent,
//                         width: 2,
//                       ),
//                       borderRadius: BorderRadius.circular(20),
//                       //color: Colors.grey.shade300,
//                       image: image != null
//                           ? DecorationImage(
//                               image: AssetImage(image), fit: BoxFit.contain)
//                           : null,
//                     ),
//                   ),
//                 )
//               : Container()
//         ],
//       ),
//     );
//   } catch (e) {
//     print(e);
//     return Container(child: Text(e.toString()));
//   }
// }

// // Helper function to create bullet points
// Widget _buildBulletPoint(String text) {
//   return Row(
//     children: [
//       Icon(Icons.check, size: 16, color: Colors.pinkAccent),
//       const SizedBox(width: 8),
//       ProText(
//         text,
//         style: const TextStyle(
//           color: Colors.white,
//           fontSize: 16,
//         ),
//       ),
//     ],
//   );
// }

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
//               border: Border.all(color: Colors.pinkAccent),
//               borderRadius: BorderRadius.circular(20),
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
//             style: const TextStyle(
//                 color: Colors.white,
//                 fontSize: 16,
//                 // fontSize: w! / 10,
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

// Widget CommonTablet(String s1, s2, s3, image, bool imageLeft) {
//   double width =
//       w ?? Get.context?.width ?? 400; // Provide a default width if null

//   return SingleChildScrollView(
//     child: Container(
//       padding: EdgeInsets.symmetric(horizontal: width / 8, vertical: 40),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.center,
//         children: [
//           Container(
//             height: 250,
//             decoration: BoxDecoration(
//               image: DecorationImage(
//                 image: AssetImage(image),
//                 fit: BoxFit.contain,
//               ),
//               border: Border.all(color: Colors.pinkAccent),
//               borderRadius: BorderRadius.circular(20),
//             ),
//           ),
//           const SizedBox(height: 25),
//           ProText(
//             s1.toUpperCase(),
//             style: const TextStyle(
//               color: Colors.pink,
//               fontSize: 24,
//               fontWeight: FontWeight.bold,
//             ),
//           ),
//           const SizedBox(height: 15),
//           ProText(
//             s2,
//             textAlign: TextAlign.start,
//             style: TextStyle(
//               color: Colors.blueAccent,
//               fontSize: width / 12,
//               height: 1.2,
//               fontWeight: FontWeight.bold,
//             ),
//           ),
//           const SizedBox(height: 15),
//           ProText(
//             s3,
//             textAlign: TextAlign.start,
//             style: const TextStyle(
//               color: Colors.white,
//               fontSize: 18,
//             ),
//           ),
//           const SizedBox(height: 25),
//           const Divider(
//             height: 5,
//             color: Colors.pinkAccent,
//           ),
//         ],
//       ),
//     ),
//   );
// }
