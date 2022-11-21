// ignore_for_file: file_names

import 'package:appquitanda/src/pages/Splash/splash_Screen.dart';
import 'package:appquitanda/src/pages/auth/Sing_In_Screen.dart';
import 'package:appquitanda/src/pages/auth/Sing_up_screen.dart';
import 'package:appquitanda/src/pages/base/base_screen.dart';
import 'package:get/get.dart';

abstract class AppPages {
  static final pages = <GetPage>[
    GetPage(
      name: PagesRoutes.splashRoute,
      page: () => const SplashScreen(),
    ),
    GetPage(
      name: PagesRoutes.signInRoute,
      page: () => SingInScreen(),
    ),
    GetPage(
      name: PagesRoutes.singUpRoute,
      page: () => SingUpScreen(),
    ),
    GetPage(
      name: PagesRoutes.baseroute,
      page: () => const BaseScreen(),
    ),
  ];
}

abstract class PagesRoutes {
  static const String signInRoute = '/singnin';
  static const String singUpRoute = '/singnup';
  static const String splashRoute = '/splash';
  static const String baseroute = '/';
}
