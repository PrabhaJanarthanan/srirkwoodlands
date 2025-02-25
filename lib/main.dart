import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:profinix_app/firebase_options.dart';
import 'package:profinix_app/website/controller/auth_controller.dart';
import 'package:profinix_app/website/controller/order_controller.dart';
import 'package:profinix_app/website/utils/colors.dart';
import 'package:profinix_app/website/utils/webroutes.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  Get.put(AuthController(), permanent: true);
  Get.put(OrderController(), permanent: true);

  runApp(GetMaterialApp(
    debugShowCheckedModeBanner: false,
    theme: ThemeData(
      fontFamily: 'Montserrat',
      brightness: Brightness.light,
      primaryColor: WebColors.primary,
      textTheme: const TextTheme(
        bodyMedium: TextStyle(fontSize: 14.0),
      ),
    ),
    darkTheme: ThemeData.light(),
    //themeMode: ThemeMode.system,
    title: 'Sri RK Woodlands',
    initialRoute: '/',
    getPages: webroutes,
  ));
}
