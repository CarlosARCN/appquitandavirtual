import 'package:appquitanda/src/pages/base/controller/navigation_controller.dart';
import 'package:get/instance_manager.dart';

class Navigationbinging extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => NavigationController());
  }
}
