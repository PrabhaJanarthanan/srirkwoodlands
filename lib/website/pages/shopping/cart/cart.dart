import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_responsive.dart';
import 'package:profinix_app/website/pages/shopping/cart/cart_page_desktop.dart';
import 'package:profinix_app/website/pages/shopping/cart/cart_page_mobile.dart';

class Cart extends GetResponsiveView {
  Cart({super.key}) : super(alwaysUseBuilder: false);

  @override
  Widget phone() => CartPageMobile();

  @override
  Widget desktop() => CartPageDesktop();

  // @override
  // Widget tablet() => RefundTablet();
}