import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:profinix_app/website/pages/whychoose/whychoose_desktop.dart';
import 'package:profinix_app/website/pages/whychoose/whychoose_mobile.dart';
import 'package:profinix_app/website/pages/whychoose/whychoose_tablet.dart';

class WhyWhatsapp extends GetResponsiveView {
  WhyWhatsapp({super.key}) : super(alwaysUseBuilder: false);

  @override
  Widget phone() => WhywhatsappMobile();

  @override
  Widget desktop() => WhywhatsappDesktop();

  @override
  Widget tablet() => WhywhatsappTablet();
}
