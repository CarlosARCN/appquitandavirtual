import 'package:appquitanda/src/models/order_model.dart';
import 'package:appquitanda/src/pages/auth/controller/auth_controller.dart';
import 'package:appquitanda/src/pages/orders/orders_result/orders_result.dart';
import 'package:appquitanda/src/pages/orders/repository/orders_repository.dart';
import 'package:appquitanda/src/services/utils_services.dart';
import 'package:get/get.dart';

class AllOrdersController extends GetxController {
  List<OrderModel> allOrders = [];
  final ordersRepository = OrdersRepository();
  final authController = Get.find<AuthController>();
  final UtilServicess utilServicess = UtilServicess();

  @override
  void onInit() {
    super.onInit();

    getAllOrders();
  }

  Future<void> getAllOrders() async {
    OrdersResult<List<OrderModel>> result = await ordersRepository.getAllOrders(
      userId: authController.user.id!,
      token: authController.user.token!,
    );

    result.when(
      success: (orders) {
        allOrders = orders;
        update();
      },
      error: (message) {
        utilServicess.showToast(
          menssage: message,
          isError: true,
        );
      },
    );
  }
}
