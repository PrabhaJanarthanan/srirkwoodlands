import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_responsive.dart';
import 'package:profinix_app/website/pages/shopping/checkout/checkout_desktop.dart';
import 'package:profinix_app/website/pages/shopping/checkout/checkout_mobile.dart';

class CheckOut extends GetResponsiveView {
  CheckOut({super.key}) : super(alwaysUseBuilder: false);

  @override
  Widget phone() => CheckoutMobile();

  @override
  Widget desktop() => CheckoutDesktop();

  // @override
  // Widget tablet() => RefundTablet();
}