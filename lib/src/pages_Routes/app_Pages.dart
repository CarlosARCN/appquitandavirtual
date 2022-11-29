// ignore_for_file: file_names

import 'package:appquitanda/src/pages/Splash/splash_Screen.dart';
import 'package:appquitanda/src/pages/auth/view/sing_in_screen.dart';
import 'package:appquitanda/src/pages/auth/view/sing_up_screen.dart';
import 'package:appquitanda/src/pages/base/base_screen.dart';
import 'package:appquitanda/src/pages/home/binding/home_binding.dart';
import 'package:get/get.dart';

abstract class AppPages {
  static final pages = <GetPage>[
    GetPage(
      page: () => const SplashScreen(),
      name: PagesRoutes.splashRoute,
    ),
    GetPage(
      page: () => SingInScreen(),
      name: PagesRoutes.signInRoute,
    ),
    GetPage(
      page: () => SingUpScreen(),
      name: PagesRoutes.singUpRoute,
    ),
    GetPage(
      page: () => const BaseScreen(),
      name: PagesRoutes.baseroute,
      binding: HomeBinding(),
    ),
  ];
}

abstract class PagesRoutes {
  static const String signInRoute = '/singnin';
  static const String singUpRoute = '/singnup';
  static const String splashRoute = '/splash';
  static const String baseroute = '/';
}
