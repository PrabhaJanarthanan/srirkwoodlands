import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:profinix_app/website/pages/frontpage/front_desktop.dart';
import 'package:profinix_app/website/pages/frontpage/front_mobile.dart';
import 'package:profinix_app/website/pages/frontpage/front_tablet.dart';

class Page1 extends GetResponsiveView {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  Page1({super.key}) : super(alwaysUseBuilder: false);

  @override
  Widget phone() => FrontMobile(
        scrollToContact: () {},
        scrollToFeatures: () {},
        scrollToHome: () {},
        onNavItemTap: (index) {},
        scaffoldKey: _scaffoldKey,
      );

  @override
  Widget desktop() => FrontDesktop(
        scrollToContact: () {},
        scrollToFeatures: () {},
        scrollToHome: () {},
      );

  @override
  Widget tablet() => FrontTablet(
        scrollToContact: () {},
        scrollToFeatures: () {},
        scrollToHome: () {},
      );
}
