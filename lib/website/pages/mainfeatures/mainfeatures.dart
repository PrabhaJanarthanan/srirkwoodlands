import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:profinix_app/website/pages/mainfeatures/mainfeatures_desktop.dart';
import 'package:profinix_app/website/pages/mainfeatures/mainfeatures_mobile.dart';
import 'package:profinix_app/website/pages/mainfeatures/mainfeatures_tablet.dart';

import 'package:profinix_app/website/pages/mainfeatures/mainfeatures_contents.dart';

class MainFeatures extends GetResponsiveView {
  final MainfeaturesContents feature;

  MainFeatures({required this.feature, super.key})
      : super(alwaysUseBuilder: false);

  @override
  Widget phone() => MainfeaturesMobile(feature: feature);

  @override
  Widget desktop() => MainfeaturesDesktop(
        feature: feature,
      );

  @override
  Widget tablet() => MainfeaturesTablet(feature: feature);
}
