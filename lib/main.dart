import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:profinix_app/firebase_options.dart';
import 'package:profinix_app/website/controller/auth_controller.dart';
import 'package:profinix_app/website/controller/order_controller.dart';
import 'package:profinix_app/website/utils/theme/theme.dart';
import 'package:profinix_app/website/utils/webroutes.dart';

import 'website/controller/wishlist_controller.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  Get.put(AuthController(), permanent: true);
  Get.put(OrderController(), permanent: true);
  Get.lazyPut(() => WishlistController());

  runApp(GetMaterialApp(
    debugShowCheckedModeBanner: false,
    theme: SNWebsiteTheme.lightTheme,
    darkTheme: SNWebsiteTheme.darkTheme,
    themeMode: ThemeMode.light, 
    title: 'Sri Nivi Boutique',
    initialRoute: '/',
    getPages: webroutes,
  ));
}
