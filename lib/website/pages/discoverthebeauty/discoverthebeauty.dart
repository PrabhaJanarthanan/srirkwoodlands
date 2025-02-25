import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:profinix_app/website/pages/discoverthebeauty/discoverthebeauty_desktop.dart';
import 'package:profinix_app/website/pages/discoverthebeauty/discoverthebeauty_mobile.dart';
import 'package:profinix_app/website/pages/discoverthebeauty/discoverthebeauty_tablet.dart';

class AiStudio extends GetResponsiveView {
  AiStudio({super.key}) : super(alwaysUseBuilder: false);

  @override
  Widget phone() => AistudioMobile();

  @override
  Widget desktop() => AistudioDesktop();

  @override
  Widget tablet() => AistudioTablet();
}
