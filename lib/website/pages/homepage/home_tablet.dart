// import 'package:flutter/material.dart';
// import 'package:profinix_app/website/pages/discoverthebeauty/discoverthebeauty_tablet.dart';
// import 'package:profinix_app/website/pages/contactpage/contact_tablet.dart';
// import 'package:profinix_app/website/pages/features/features_tablet.dart';
// import 'package:profinix_app/website/pages/footer/footer_tablet.dart';
// import 'package:profinix_app/website/pages/frontpage/front_tablet.dart';
// import 'package:profinix_app/website/pages/mainfeatures/mainfeatures_section.dart';
// import 'package:profinix_app/website/pages/whychoose/whychoose_tablet.dart';
// import 'package:profinix_app/website/pages/woodtype/woodtype_tablet.dart';
// import 'package:profinix_app/website/widgets/navbar/tablet_navbar.dart';
// import 'package:url_launcher/url_launcher.dart';

// class HomePageTablet extends StatefulWidget {
//   final ScrollController scrollController;
//   final GlobalKey contactKey;
//   final GlobalKey featuresKey;
//   final GlobalKey homeKey;
//   final VoidCallback scrollToContact;
//   final VoidCallback scrollToFeatures;
//   final VoidCallback scrollToHome;
//   // final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

//   const HomePageTablet({
//     required this.scrollController,
//     required this.contactKey,
//     required this.featuresKey,
//     required this.homeKey,
//     required this.scrollToContact,
//     required this.scrollToFeatures,
//     required this.scrollToHome,
//     super.key,
//   });

//   @override
//   _HomePageTabletState createState() => _HomePageTabletState();
// }

// class _HomePageTabletState extends State<HomePageTablet>
//     with SingleTickerProviderStateMixin {
//   late AnimationController _controller;
//   late Animation<double> _whatsappScaleAnimation;
//   bool _isHomeFabVisible = false;

//   @override
//   void initState() {
//     super.initState();
//     _controller = AnimationController(
//       vsync: this,
//       duration: const Duration(milliseconds: 600),
//     );
//     _whatsappScaleAnimation = Tween<double>(begin: 0.8, end: 1.0).animate(
//       CurvedAnimation(parent: _controller, curve: Curves.easeInOut),
//     );
//     _controller.repeat(reverse: true);

//     widget.scrollController.addListener(() {
//       if (widget.scrollController.position.pixels > 100) {
//         if (!_isHomeFabVisible) {
//           setState(() {
//             _isHomeFabVisible = true;
//           });
//         }
//       } else {
//         if (_isHomeFabVisible) {
//           setState(() {
//             _isHomeFabVisible = false;
//           });
//         }
//       }
//     });
//   }

//   @override
//   void dispose() {
//     widget.scrollController.removeListener(() {});
//     _controller.dispose();
//     super.dispose();
//   }

//   void _openWhatsApp() async {
//     final String whatsappNumber = "+919043249455";
//     final String message = 'Hello, I Need Assistance';
//     final Uri whatsappUri = Uri.parse(
//       "https://wa.me/$whatsappNumber?text=${Uri.encodeComponent(message)}",
//     );
//     if (await canLaunchUrl(whatsappUri)) {
//       await launchUrl(whatsappUri);
//     } else {
//       debugPrint("Could not open Whatsapp.");
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
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
//               Container(
//                 color: Colors.transparent, // Background color for navbar
//                 child: TabletNavBar(
//                   scaffoldKey: GlobalKey<ScaffoldState>(),
//                   scrollToContact: widget.scrollToContact,
//                   scrollToFeatures: widget.scrollToFeatures,
//                   scrollToHome: widget.scrollToHome,
//                   onNavItemTap: (index) {
//                     // Handle navigation based on the index
//                     switch (index) {
//                       case 0:
//                         widget.scrollToHome();
//                         break;
//                       case 1:
//                         widget.scrollToFeatures();
//                         break;
//                       case 2:
//                         widget.scrollToContact();
//                         break;
//                     }
//                   },
//                 ),
//               ),
//               Expanded(
//                 child: SingleChildScrollView(
//                   controller: widget.scrollController,
//                   child: Column(
//                     children: [
//                       FrontTablet(
//                         key: widget.homeKey,
//                         scrollToContact: widget.scrollToContact,
//                         scrollToFeatures: widget.scrollToFeatures,
//                         scrollToHome: widget.scrollToHome,
//                       ),
//                       FeaturesTablet(),
//                       WhywhatsappTablet(),
//                       const SizedBox(height: 60),
//                       const AistudioTablet(),
//                       MainfeaturesSection(
//                         key: widget.featuresKey,
//                       ),
//                       const WorldwideTablet(),
//                       ContactPageTablet(
//                         key: widget.contactKey,
//                       ),
//                       const FooterTablet(),
//                     ],
//                   ),
//                 ),
//               ),
//             ],
//           ),
//         ],
//       ),
//       floatingActionButton: Stack(
//         children: [
//           AnimatedPositioned(
//             duration: const Duration(milliseconds: 500),
//             curve: Curves.easeInOut,
//             right: _isHomeFabVisible ? 1.0 : -90,
//             bottom: 100,
//             child: AnimatedOpacity(
//               duration: const Duration(milliseconds: 200),
//               opacity: _isHomeFabVisible ? 1.0 : 0.0,
//               child: RawMaterialButton(
//                 shape: const RoundedRectangleBorder(
//                   borderRadius: BorderRadius.only(
//                     topLeft: Radius.circular(20),
//                     //bottomLeft: Radius.circular(20),
//                   ),
//                 ),
//                 onPressed: widget.scrollToHome,
//                 fillColor: Colors.pinkAccent,
//                 child: const Icon(
//                   Icons.keyboard_double_arrow_up,
//                   size: 30,
//                   //color: Colors.white,
//                 ),
//               ),
//             ),
//           ),
//           Positioned(
//             right: 10,
//             bottom: 10,
//             child: ScaleTransition(
//               scale: Tween(begin: 1.0, end: 1.2).animate(
//                 CurvedAnimation(
//                   parent: _controller,
//                   curve: Curves.easeInOut,
//                 ),
//               ),
//               child: RawMaterialButton(
//                 onPressed: _openWhatsApp,
//                 elevation: 2.0,
//                 fillColor: Colors.transparent,
//                 shape: const CircleBorder(),
//                 child: Image.asset(
//                   'assets/logo/whatsappicon.png',
//                   width: 50,
//                   height: 80,
//                 ),
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
