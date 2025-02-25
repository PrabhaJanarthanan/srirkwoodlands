import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:profinix_app/website/widgets/navbar/desktop_navbar.dart';
import 'package:profinix_app/website/widgets/navbar/mobile_navbar.dart';

class NavBar extends GetResponsiveView {
  final VoidCallback scrollToContact;
  final VoidCallback scrollToFeatures;
  final VoidCallback scrollToHome;

  final Function(int) onNavItemTap;
  final GlobalKey<ScaffoldState> scaffoldKey;

  NavBar({
    super.key,
    required this.scrollToContact,
    required this.scrollToFeatures,
    required this.scrollToHome,
    required this.onNavItemTap,
    required this.scaffoldKey,
  }) : super(alwaysUseBuilder: false);

  @override
  Widget phone() => MobileNavBar(
        scrollToContact: scrollToContact,
        scrollToFeatures: scrollToFeatures,
        scrollToHome: scrollToHome,
        onNavItemTap: onNavItemTap,
        scaffoldKey: scaffoldKey, // Pass the scaffoldKey to MobileNavBar
      );

  @override
  Widget desktop() => DesktopNavBar(
        scrollToContact: scrollToContact,
        scrollToFeatures: scrollToFeatures,
        scrollToHome: scrollToHome,
        onNavItemTap: onNavItemTap,
      );

  // @override
  // Widget tablet() => TabletNavBar(
  //       scrollToContact: scrollToContact,
  //       scrollToFeatures: scrollToFeatures,
  //       scrollToHome: scrollToHome,
  //       onNavItemTap: onNavItemTap,
  //     );
}
