import 'package:appquitanda/src/models/Iten_model.dart';
import 'package:appquitanda/src/models/cart_item_model.dart';
import 'package:appquitanda/src/models/order_model.dart';
import 'package:appquitanda/src/pages/auth/controller/auth_controller.dart';
import 'package:appquitanda/src/pages/cart/cart_result/cart_result.dart';
import 'package:appquitanda/src/pages/cart/repository/cart_repository.dart';
import 'package:appquitanda/src/pages/common_widgets/Payment_dialog.dart';
import 'package:appquitanda/src/services/utils_services.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CartController extends GetxController {
  final cartRepository = CartRepository();
  final authController = Get.find<AuthController>();
  final UtilServicess utilsServices = UtilServicess();

  List<CartItemModel> cartItems = [];
  bool isCheckouLoading = false;

  @override
  void onInit() {
    super.onInit();

    getCartItems();
  }

  double cartTotalPrice() {
    double total = 0;

    for (final item in cartItems) {
      total += item.totalPrice();
    }
    return total;
  }

  void setCheckoutLoading(bool value) {
    isCheckouLoading = value;
    update();
  }

  Future checkoutCart() async {
    setCheckoutLoading(true);
    CartResult<OrderModel> result = await cartRepository.checkoutCart(
      token: authController.user.token!,
      total: cartTotalPrice(),
    );

    setCheckoutLoading(false);
    update();

    result.when(
      success: (order) {
        cartItems.clear();
        showDialog(
          context: Get.context!,
          builder: (_) {
            return PaymentDialog(
              order: order,
            );
          },
        );
      },
      error: (message) {
        utilsServices.showToast(
          menssage: message,
        );
      },
    );
  }

  Future<bool> changeItemQuantity(
      {required CartItemModel item, required int quantity}) async {
    final result = await cartRepository.changeItemQuantity(
      token: authController.user.token!,
      cartItemId: item.id,
      quantity: quantity,
    );

    if (result) {
      if (quantity == 0) {
        cartItems.removeWhere((cartItem) => cartItem.id == item.id);
      } else {
        cartItems.firstWhere((cartItem) => cartItem.id == item.id).quantity =
            quantity;
      }
      update();
    } else {
      utilsServices.showToast(
        menssage: 'oco umm ero ao alter a quanti d produ',
        isError: true,
      );
    }

    return result;
  }

  Future<void> getCartItems() async {
    final CartResult<List<CartItemModel>> result =
        await cartRepository.getCartItems(
      token: authController.user.token!,
      userID: authController.user.id!,
    );

    result.when(
      success: (data) {
        cartItems = data;
        update();
        // ignore: avoid_print
        print('tudook');
      },
      error: (message) {
        utilsServices.showToast(
          menssage: message,
          isError: true,
        );
      },
    );
  }

  int getItemIndex(ItemModel item) {
    return cartItems.indexWhere((itemInList) => itemInList.item.id == item.id);
  }

  Future<void> addItemToCart(
      {required ItemModel item, int quantity = 1}) async {
    int itemIndex = getItemIndex(item);

    if (itemIndex >= 0) {
      final product = cartItems[itemIndex];
      await changeItemQuantity(
          item: product, quantity: (product.quantity + quantity));

      //ja existe
    } else {
      final CartResult<String> result = await cartRepository.additemToCart(
        userId: authController.user.id!,
        token: authController.user.token!,
        productId: item.id,
        quantity: quantity,
      );
      result.when(success: (cartItemId) {
        cartItems
            .add(CartItemModel(id: cartItemId, item: item, quantity: quantity));
      }, error: (message) {
        utilsServices.showToast(
          menssage: message,
          isError: true,
        );
      });
    }
  }
}
