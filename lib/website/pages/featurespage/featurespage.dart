import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:profinix_app/website/pages/featurespage/featurespage_desktop.dart';
import 'package:profinix_app/website/pages/featurespage/featurespage_mobile.dart';
import 'package:profinix_app/website/pages/pricing/pricing_desktop.dart';
import 'package:profinix_app/website/pages/pricing/pricing_mobile.dart';
import 'package:profinix_app/website/pages/pricing/pricing_tablet.dart';

class FeaturesPage extends GetResponsiveView {
  FeaturesPage({super.key}) : super(alwaysUseBuilder: false);

  // @override
  // Widget phone() => FeaturesPageMobile();

  @override
  Widget desktop() => FeaturesPageDesktop();

  //@override
  // Widget tablet() => FeaturesPageTablet();
}
