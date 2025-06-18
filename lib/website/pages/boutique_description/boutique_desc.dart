import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'boutique_desc_desktop.dart';
import 'boutique_desc_mobile.dart';


class BoutiqueDesc extends GetResponsiveView {
  BoutiqueDesc({super.key}) : super(alwaysUseBuilder: false);

  @override
  Widget phone() => const BoutiqueDescMobile();

  @override
  Widget desktop() =>BoutiqueDescDesktop();

  // @override
  // Widget tablet() => const ContactPageTablet();
}
