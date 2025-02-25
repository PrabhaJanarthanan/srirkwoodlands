import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:profinix_app/website/pages/pricing/pricing_desktop.dart';
import 'package:profinix_app/website/pages/pricing/pricing_mobile.dart';
import 'package:profinix_app/website/pages/pricing/pricing_tablet.dart';

class PricingPage extends GetResponsiveView {
  PricingPage({super.key}) : super(alwaysUseBuilder: false);

  @override
  Widget phone() => PricingMobile();

  @override
  Widget desktop() => PricingDesktop();

  // @override
  // Widget tablet() => PricingTablet();
}
