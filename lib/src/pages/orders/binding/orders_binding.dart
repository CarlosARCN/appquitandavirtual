import 'package:appquitanda/src/pages/orders/controller/all_orders_controller.dart';
import 'package:get/instance_manager.dart';

class OrdersBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(AllOrdersController());
  }
}
