// ignore_for_file: unused_import

import 'package:appquitanda/src/pages/Splash/splash_Screen.dart';
import 'package:appquitanda/src/pages/auth/controller/auth_controller.dart';
import 'package:appquitanda/src/pages_Routes/app_Pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'src/pages/auth/view/sing_in_screen.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  Get.put(AuthController());

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Greengrocer',
      theme: ThemeData(
        primarySwatch: Colors.green,
        scaffoldBackgroundColor: Colors.white.withAlpha(190),
      ),
      debugShowCheckedModeBanner: false,
      initialRoute: PagesRoutes.splashRoute,
      getPages: AppPages.pages,
    );
  }
}
