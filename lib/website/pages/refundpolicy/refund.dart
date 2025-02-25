import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:profinix_app/website/pages/privacypolicy/privacy_desktop.dart';
import 'package:profinix_app/website/pages/privacypolicy/privacy_mobile.dart';
import 'package:profinix_app/website/pages/privacypolicy/privacy_tablet.dart';
import 'package:profinix_app/website/pages/refundpolicy/refund_desktop.dart';
import 'package:profinix_app/website/pages/refundpolicy/refund_mobile.dart';
import 'package:profinix_app/website/pages/refundpolicy/refund_tablet.dart';

class RefundPage extends GetResponsiveView {
  RefundPage({super.key}) : super(alwaysUseBuilder: false);

  @override
  Widget phone() => RefundMobile();

  @override
  Widget desktop() => RefundDesktop();

  @override
  Widget tablet() => RefundTablet();
}
