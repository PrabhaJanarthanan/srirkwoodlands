import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:profinix_app/website/pages/termsandconditions/terms_exporter.dart';

class TermsandConditions extends GetResponsiveView {
  TermsandConditions({super.key}) : super(alwaysUseBuilder: false);

  @override
  Widget phone() => TermsMobile();

  @override
  Widget desktop() => TermsDesktop();

  @override
  Widget tablet() => TermsTablet();
}
