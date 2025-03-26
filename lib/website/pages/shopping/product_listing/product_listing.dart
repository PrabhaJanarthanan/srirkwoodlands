
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_responsive.dart';
import 'package:profinix_app/website/pages/shopping/product_listing/product_listing_mobile.dart';
import 'package:profinix_app/website/pages/shopping/product_listing/product_listing_desktop.dart';

class ProductListing extends GetResponsiveView {
  ProductListing({super.key}) : super(alwaysUseBuilder: false);

  @override
  Widget phone() => ProductListingMobile();

  @override
  Widget desktop() => ProductListingDesktop();

  // @override
  // Widget tablet() => RefundTablet();
}