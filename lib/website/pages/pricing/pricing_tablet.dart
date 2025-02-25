// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:profinix_app/website/widgets/basewidgets.dart';
// import 'package:profinix_app/website/widgets/navbar/navbar.dart';
// import 'package:profinix_app/website/widgets/navbar/tablet_navbar.dart';

// class PricingTablet extends StatefulWidget {
//   @override
//   _PricingTabletState createState() => _PricingTabletState();
// }

// class _PricingTabletState extends State<PricingTablet> {
//   int _selectedIndex = 0;
//   final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
//   final ScrollController _scrollController = ScrollController();

//   void _onNavItemTap(int index) {
//     switch (index) {
//       case 0:
//         _navigateToHome();
//         break;
//       case 1:
//         _navigateToMainfeatures();
//         break;
//       case 2:
//         _navigateToContact();
//         break;
//     }
//   }

//   void _navigateToHome() {
//     Get.toNamed('/');
//   }

//   void _navigateToMainfeatures() {
//     Get.toNamed('/features');
//   }

//   void _navigateToContact() {
//     Get.toNamed('/contactpage');
//   }

//   void _scrollLeft() {
//     _scrollController.animateTo(
//       _scrollController.offset - _getContainerWidth() - 10,
//       duration: const Duration(milliseconds: 300),
//       curve: Curves.easeOut,
//     );
//   }

//   void _scrollRight() {
//     _scrollController.animateTo(
//       _scrollController.offset + _getContainerWidth() + 10,
//       duration: const Duration(milliseconds: 300),
//       curve: Curves.easeOut,
//     );
//   }

//   double _getContainerWidth() {
//     return 250; // Adjusted for tablet screen size
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       key: _scaffoldKey,
//       body: Stack(
//         children: [
//           Positioned.fill(
//             child: Image.asset(
//               'assets/background/frontbg.png',
//               fit: BoxFit.cover,
//             ),
//           ),
//           Column(
//             children: [
//               TabletNavBar(
//                 scrollToContact: _navigateToContact,
//                 scrollToFeatures: _navigateToMainfeatures,
//                 scrollToHome: _navigateToHome,
//                 onNavItemTap: _onNavItemTap,
//                 scaffoldKey: _scaffoldKey,
//               ),
//               Expanded(
//                 child: SingleChildScrollView(
//                   padding:
//                       const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.center,
//                     children: [
//                       const ProText(
//                         '"Experience seamless communication with our affordable and flexible pricing plans!"',
//                         textAlign: TextAlign.center,
//                         style: TextStyle(
//                           fontSize: 24, // Adjusted font size for tablets
//                           fontWeight: FontWeight.bold,
//                           color: Colors.white,
//                         ),
//                       ),
//                       const SizedBox(height: 20),
//                       const ProText(
//                         "Choose the right plan for your business. Whether you need direct agent communication, CRM services, or professional support, we have a flexible pricing model tailored to your needs. Explore the options below!",
//                         textAlign: TextAlign.center,
//                         style: TextStyle(
//                           fontSize: 16,
//                           fontWeight: FontWeight.w500,
//                           color: Colors.white,
//                         ),
//                       ),
//                       const SizedBox(height: 20),
//                       _buildPlanDescriptions(),
//                       const SizedBox(height: 20),
//                       Row(
//                         mainAxisAlignment: MainAxisAlignment.center,
//                         children: [
//                           IconButton(
//                             icon: const Icon(
//                               Icons.keyboard_double_arrow_left_outlined,
//                               size: 40,
//                               color: Colors.pinkAccent,
//                             ),
//                             onPressed: _scrollLeft,
//                           ),
//                           Expanded(
//                             child: SingleChildScrollView(
//                               controller: _scrollController,
//                               scrollDirection: Axis.horizontal,
//                               child: Row(
//                                 children: [
//                                   _buildPricingContainer(
//                                       'assets/pricing/agentdirectcrm.png'),
//                                   const SizedBox(width: 10),
//                                   _buildPricingContainer(
//                                       'assets/pricing/agentdirectbs.png'),
//                                   const SizedBox(width: 10),
//                                   _buildPricingContainer(
//                                       'assets/pricing/customerdirectcrm.png'),
//                                   const SizedBox(width: 10),
//                                   _buildPricingContainer(
//                                       'assets/pricing/customerdirectbs.png'),
//                                   const SizedBox(width: 10),
//                                   _buildPricingContainer(
//                                       'assets/pricing/postservicecrm.png'),
//                                   const SizedBox(width: 10),
//                                   _buildPricingContainer(
//                                       'assets/pricing/proservicebs.png'),
//                                   const SizedBox(width: 10),
//                                   _buildPricingContainer(
//                                       'assets/pricing/agentservicecrm.png'),
//                                   const SizedBox(width: 10),
//                                   _buildPricingContainer(
//                                       'assets/pricing/agentservicebs.png'),
//                                 ],
//                               ),
//                             ),
//                           ),
//                           IconButton(
//                             icon: const Icon(
//                               Icons.keyboard_double_arrow_right_outlined,
//                               size: 40,
//                               color: Colors.pinkAccent,
//                             ),
//                             onPressed: _scrollRight,
//                           ),
//                         ],
//                       )
//                     ],
//                   ),
//                 ),
//               ),
//             ],
//           ),
//         ],
//       ),
//     );
//   }

//   Widget _buildPricingContainer(String imagePath) {
//     return Column(
//       children: [
//         Image.asset(
//           imagePath,
//           height: 400, // Adjusted for tablet screen size
//           width: 400,
//           fit: BoxFit.contain,
//         ),
//         const SizedBox(height: 10),
//       ],
//     );
//   }

//   Widget _buildPlanDescriptions() {
//     return Column(
//       children: const [
//         ProText(
//           "1. *Agent Direct Plans*: Get the flexibility of managing communication directly with agents. Choose between CRM and Business Services based on your specific needs.",
//           textAlign: TextAlign.center,
//           style: TextStyle(
//             fontSize: 16,
//             fontWeight: FontWeight.w400,
//             color: Colors.white,
//           ),
//         ),
//         SizedBox(height: 15),
//         ProText(
//           "2. *Customer Direct Plans*: Empower your customers to engage with your services directly through CRM or Business Services, designed for a streamlined experience.",
//           textAlign: TextAlign.center,
//           style: TextStyle(
//             fontSize: 16,
//             fontWeight: FontWeight.w400,
//             color: Colors.white,
//           ),
//         ),
//         SizedBox(height: 15),
//         ProText(
//           "3. *Pro Services*: Unlock advanced features that come with professional services to take your communication to the next level with customized CRM and Business Services.",
//           textAlign: TextAlign.center,
//           style: TextStyle(
//             fontSize: 16,
//             fontWeight: FontWeight.w400,
//             color: Colors.white,
//           ),
//         ),
//         SizedBox(height: 15),
//         ProText(
//           "4. *Agent Service Plans*: Ideal for agencies that need a comprehensive solution for CRM and Business Services. Your agents can easily manage customer interactions and business needs.",
//           textAlign: TextAlign.center,
//           style: TextStyle(
//             fontSize: 16,
//             fontWeight: FontWeight.w400,
//             color: Colors.white,
//           ),
//         ),
//       ],
//     );
//   }
// }
