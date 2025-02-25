import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:profinix_app/website/pages/woodtype/woodtype_desktop.dart';
import 'package:profinix_app/website/pages/woodtype/woodtype_mobile.dart';
import 'package:profinix_app/website/pages/woodtype/woodtype_tablet.dart';

class Worldwide extends GetResponsiveView {
  Worldwide({super.key}) : super(alwaysUseBuilder: false);

  @override
  Widget phone() => WorldwideMobile();

  @override
  Widget desktop() => WorldwideDesktop();

  @override
  Widget tablet() => WorldwideTablet();
}
