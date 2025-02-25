// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:profinix_app/website/utils/colors.dart';
// import 'package:profinix_app/website/utils/constants.dart';
// import 'package:profinix_app/website/widgets/basewidgets.dart';

// class PricingpageNavbar extends GetResponsiveView {
//   final VoidCallback scrollToHome;
//   final VoidCallback scrollToContact;
//   final VoidCallback requestDemo;

//   PricingpageNavbar({
//     Key? key,
//     required this.scrollToHome,
//     required this.scrollToContact,
//     required this.requestDemo,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext) {
//     return Row(
//       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//       children: [
//         Row(
//           children: [
//             Image.asset(logo, height: 50),
//             const SizedBox(width: 10),
//             const ProText(
//               'Profinix Technologies',
//               style: TextStyle(
//                 fontSize: 24,
//                 color: Colors.white,
//                 fontWeight: FontWeight.bold,
//               ),
//             ),
//           ],
//         ),
//         Row(
//           children: [
//             TextButton(
//               onPressed: scrollToHome,
//               child: const ProText(
//                 'Home',
//                 style: TextStyle(
//                     fontSize: 25,
//                     color: Colors.white,
//                     fontWeight: FontWeight.bold),
//               ),
//             ),
//             const SizedBox(width: 20),
//             TextButton(
//               onPressed: scrollToContact,
//               child: const ProText(
//                 'Contact Us',
//                 style: TextStyle(
//                     fontSize: 25,
//                     color: Colors.white,
//                     fontWeight: FontWeight.bold),
//               ),
//             ),
//             const SizedBox(width: 20),
//             ElevatedButton(
//               style:
//                   ElevatedButton.styleFrom(backgroundColor: Colors.transparent),
//               onPressed: requestDemo,
//               child: const ProText(
//                 'Request Demo',
//                 style: TextStyle(
//                     fontSize: 16,
//                     color: Colors.white,
//                     fontWeight: FontWeight.normal),
//               ),
//             ),
//           ],
//         )
//       ],
//     );
//   }
// }
