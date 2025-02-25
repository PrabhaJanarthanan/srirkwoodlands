import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:profinix_app/website/pages/contactpage/contact_desktop.dart';
import 'package:profinix_app/website/pages/contactpage/contact_mobile.dart';
import 'package:profinix_app/website/pages/contactpage/contact_tablet.dart';

class ContactPage extends GetResponsiveView {
  ContactPage({super.key}) : super(alwaysUseBuilder: false);

  @override
  Widget phone() => const ContactPageMobile();

  @override
  Widget desktop() => Scaffold(body: ContactPageDesktop());

  @override
  Widget tablet() => const ContactPageTablet();
}
