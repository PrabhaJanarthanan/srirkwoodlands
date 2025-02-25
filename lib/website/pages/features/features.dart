import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:profinix_app/website/pages/features/features_desktop.dart';
import 'package:profinix_app/website/pages/features/features_mobile.dart';
import 'package:profinix_app/website/pages/features/features_tablet.dart';

class Features extends GetResponsiveView {
  Features({super.key}) : super(alwaysUseBuilder: false);

  @override
  Widget phone() => FeaturesMobile();

  @override
  Widget desktop() => FeaturesDesktop();

  @override
  Widget tablet() => FeaturesTablet();
}
