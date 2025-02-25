import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:profinix_app/website/pages/privacypolicy/privacy_desktop.dart';
import 'package:profinix_app/website/pages/privacypolicy/privacy_mobile.dart';
import 'package:profinix_app/website/pages/privacypolicy/privacy_tablet.dart';

class PrivacyPolicy extends GetResponsiveView {
  PrivacyPolicy({super.key}) : super(alwaysUseBuilder: false);

  @override
  Widget phone() => PrivacyPolicyMobile();

  @override
  Widget desktop() => PrivacyPolicyDesktop();

  @override
  Widget tablet() => PrivacyPolicyTablet();
}
