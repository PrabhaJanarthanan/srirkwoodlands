import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:profinix_app/website/pages/footer/footer_desktop.dart';
import 'package:profinix_app/website/pages/footer/footer_mobile.dart';
import 'package:profinix_app/website/pages/footer/footer_tablet.dart';

class Footer extends GetResponsiveView {
  Footer({super.key}) : super(alwaysUseBuilder: false);

  @override
  Widget phone() => const FooterMobile();

  @override
  Widget desktop() => const FooterDesktop();

  @override
  Widget tablet() => const FooterTablet();
}
