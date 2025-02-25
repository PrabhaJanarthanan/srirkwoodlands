import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:profinix_app/website/pages/homepage/home_desktop.dart';
import 'package:profinix_app/website/pages/homepage/home_mobile.dart';
import 'package:profinix_app/website/pages/homepage/home_tablet.dart';
//import 'package:profinix_app/website/pages/homepage/home_tablet.dart';

class HomePage extends GetResponsiveView {
  final ScrollController _scrollController = ScrollController();
  final GlobalKey _contactKey = GlobalKey();
  final GlobalKey _featuresKey = GlobalKey();
  final GlobalKey _homeKey = GlobalKey();

  HomePage({super.key}) : super(alwaysUseBuilder: false);

  void scrollToContact() {
    final context = _contactKey.currentContext;
    if (context != null) {
      Scrollable.ensureVisible(context,
          duration: Duration(seconds: 1), curve: Curves.easeInOut);
    }
  }

  void scrollToFeatures() {
    final context = _featuresKey.currentContext;
    if (context != null) {
      Scrollable.ensureVisible(context,
          duration: Duration(seconds: 1), curve: Curves.easeInOut);
    }
  }

  void scrollToHome() {
    final context = _homeKey.currentContext;
    if (context != null) {
      Scrollable.ensureVisible(context,
          duration: Duration(seconds: 1), curve: Curves.easeInOut);
    }
  }

  void onNavItemTap(int index) {
    if (index == 0) {
      scrollToContact();
    } else if (index == 1) {
      scrollToFeatures();
    } else if (index == 2) {
      scrollToHome();
    }
  }

  @override
  Widget phone() => HomePagePhone(
        scrollController: _scrollController,
        contactKey: _contactKey,
        featureskey: _featuresKey,
        homekey: _homeKey,
        scrollToContact: scrollToContact,
        scrollToFeatures: scrollToFeatures,
        scrollToHome: scrollToHome,
        onNavItemTap: onNavItemTap,
      );

  @override
  Widget desktop() => HomePageDesktop(
        scrollController: _scrollController,
        contactKey: _contactKey,
        featureskey: _featuresKey,
        homekey: _homeKey,
        scrollToContact: scrollToContact,
        scrollToFeatures: scrollToFeatures,
        scrollToHome: scrollToHome,
        //onNavItemTap: onNavItemTap,
      );

  // @override
  // Widget tablet() => HomePageTablet(
  //       scrollController: _scrollController,
  //       contactKey: _contactKey,
  //       featuresKey: _featuresKey,
  //       scrollToContact: scrollToContact,
  //       scrollToFeatures: scrollToFeatures,
  //       scrollToHome: scrollToHome,
  //       homeKey: _homeKey,
  //       //onNavItemTap: onNavItemTap,
  //     );
}
