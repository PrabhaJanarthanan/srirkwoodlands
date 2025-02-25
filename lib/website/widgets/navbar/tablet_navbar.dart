// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:profinix_app/website/utils/constants.dart';
// import 'package:profinix_app/website/utils/demorequest_sheet.dart';
// import 'package:profinix_app/website/widgets/basewidgets.dart';

// class TabletNavBar extends StatefulWidget {
//   final VoidCallback scrollToContact;
//   final VoidCallback scrollToFeatures;
//   final VoidCallback scrollToHome;

//   TabletNavBar({
//     super.key,
//     required this.scrollToContact,
//     required this.scrollToFeatures,
//     required this.scrollToHome,
//     required void Function(int index) onNavItemTap,
//     required GlobalKey<ScaffoldState> scaffoldKey,
//   });

//   @override
//   _TabletNavBarState createState() => _TabletNavBarState();
// }

// class _TabletNavBarState extends State<TabletNavBar>
//     with SingleTickerProviderStateMixin {
//   late List<bool> isHoveredList;
//   late AnimationController _animationController;
//   late Animation<double> _animation;
//   bool _isDropdownOpen = false;

//   @override
//   void initState() {
//     super.initState();
//     isHoveredList = List.filled(6, false);

//     _animationController = AnimationController(
//       duration: const Duration(milliseconds: 300),
//       vsync: this,
//     );
//     _animation = CurvedAnimation(
//       parent: _animationController,
//       curve: Curves.easeInOut,
//     );
//   }

//   @override
//   void dispose() {
//     _animationController.dispose();
//     super.dispose();
//   }

//   void _toggleHover(bool isHovering, int index) {
//     setState(() {
//       isHoveredList[index] = isHovering;
//     });
//   }

//   void _toggleDropdown(bool isHovering) {
//     setState(() {
//       _isDropdownOpen = isHovering;
//       if (_isDropdownOpen) {
//         _animationController.forward();
//       } else {
//         _animationController.reverse();
//       }
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       margin: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
//       height: 70,
//       decoration: const BoxDecoration(
//         color: Colors.transparent,
//       ),
//       child: ProRow(
//         mainAxisAlignment: MainAxisAlignment.spaceAround,
//         children: [
//           GestureDetector(
//             onTap: widget.scrollToHome,
//             child: ProContainer(
//               decoration: const BoxDecoration(
//                 image: DecorationImage(
//                   image: AssetImage(logo),
//                   fit: BoxFit.contain,
//                 ),
//               ),
//             ),
//           ),
//           navLogo(),
//           ProRow(
//             mainAxisAlignment: MainAxisAlignment.start,
//             children: [
//               navButton('Home', widget.scrollToHome, 0),
//               navButton('Features', widget.scrollToFeatures, 2),
//               navButton('Contact Us', widget.scrollToContact, 3),
//               navButton('Pricing', () {
//                 Get.toNamed('/pricing');
//               }, 5),
//             ],
//           ),
//           ProContainer(
//             decoration: BoxDecoration(
//               gradient: const LinearGradient(
//                 colors: [
//                   Colors.pinkAccent,
//                   Colors.blueAccent,
//                 ],
//                 begin: Alignment.bottomLeft,
//                 end: Alignment.topRight,
//               ),
//               borderRadius: BorderRadius.circular(20),
//             ),
//             height: 45,
//             child: ElevatedButton(
//               style: ElevatedButton.styleFrom(
//                 foregroundColor: Colors.white,
//                 backgroundColor: Colors.transparent,
//                 shadowColor: Colors.transparent,
//                 textStyle: const TextStyle(fontSize: 16),
//                 padding: const EdgeInsets.symmetric(horizontal: 20),
//                 shape: RoundedRectangleBorder(
//                   borderRadius: BorderRadius.circular(20),
//                 ),
//               ),
//               onPressed: () {
//                 showRequestDemoForm(context);
//               },
//               child: const ProText(
//                 'Demo',
//                 style: TextStyle(
//                   color: Colors.white,
//                   fontWeight: FontWeight.normal,
//                 ),
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }

//   Widget navButton(String text, VoidCallback onPressed, int index) {
//     return Padding(
//       padding: const EdgeInsets.symmetric(horizontal: 8.0),
//       child: MouseRegion(
//         onEnter: (_) => _toggleHover(true, index),
//         onExit: (_) => _toggleHover(false, index),
//         child: GestureDetector(
//           onTap: onPressed,
//           child: isHoveredList[index]
//               ? ShaderMask(
//                   shaderCallback: (Rect bounds) {
//                     return const LinearGradient(
//                       colors: <Color>[
//                         Colors.pinkAccent,
//                         Colors.blueAccent,
//                       ],
//                       begin: Alignment.topLeft,
//                       end: Alignment.bottomRight,
//                     ).createShader(bounds);
//                   },
//                   child: ProText(
//                     text,
//                     style: const TextStyle(
//                       fontSize: 16,
//                       fontWeight: FontWeight.normal,
//                       color: Colors.white,
//                     ),
//                   ),
//                 )
//               : ProText(
//                   text,
//                   style: const TextStyle(
//                     fontSize: 16,
//                     fontWeight: FontWeight.normal,
//                     color: Colors.white,
//                   ),
//                 ),
//         ),
//       ),
//     );
//   }

//   Widget navLogo() {
//     return ProRow(
//       mainAxisSize: MainAxisSize.min,
//       children: [
//         ProContainer(
//           width: 25,
//           height: 25,
//           decoration: const BoxDecoration(
//             image: DecorationImage(
//               image: AssetImage(weblogo),
//               fit: BoxFit.contain,
//             ),
//           ),
//         ),
//         const ProText(
//           'Profinix \nTechnologies',
//           style: TextStyle(
//             fontSize: 12,
//             color: Colors.white,
//             fontWeight: FontWeight.normal,
//           ),
//         ),
//       ],
//     );
//   }
// }
