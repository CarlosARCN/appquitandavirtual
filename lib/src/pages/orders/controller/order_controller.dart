// ignore_for_file: empty_constructor_bodies

import 'package:appquitanda/src/models/cart_item_model.dart';
import 'package:appquitanda/src/models/order_model.dart';
import 'package:appquitanda/src/pages/auth/controller/auth_controller.dart';
import 'package:appquitanda/src/pages/orders/orders_result/orders_result.dart';
import 'package:appquitanda/src/pages/orders/repository/orders_repository.dart';
import 'package:appquitanda/src/services/utils_services.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/instance_manager.dart';

class OrderController extends GetxController {
  OrderModel order;

  OrderController(this.order);

  final ordersRepository = OrdersRepository();
  final authController = Get.find<AuthController>();
  final utilServicess = UtilServicess();
  bool isLoading = false;

  void setLoading(bool value) {
    isLoading = value;
    update();
  }

  Future<void> getOrderItems() async {
    setLoading(true);
    final OrdersResult<List<CartItemModel>> result =
        await ordersRepository.getOrderItems(
      token: authController.user.token!,
      orderId: order.id,
    );
    setLoading(false);

    result.when(success: (items) {
      order.items = items;
      update();
    }, error: (message) {
      utilServicess.showToast(menssage: message, isError: true);
    });
  }
}
