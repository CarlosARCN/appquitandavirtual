// ignore_for_file: non_constant_identifier_names, library_prefixes

import 'package:appquitanda/src/config/custom_colors.dart';
import 'package:appquitanda/src/pages/cart/controller/cart_controller.dart';
import 'package:appquitanda/src/pages/cart/view/components/Cart_Tile.dart';
import 'package:appquitanda/src/services/utils_services.dart';
import 'package:flutter/material.dart';
// import 'package:appquitanda/src/config/app_data.dart' as appData;
import 'package:get/get.dart';

class CartTab extends StatefulWidget {
  const CartTab({super.key});

  @override
  State<CartTab> createState() => _CartTabState();
}

class _CartTabState extends State<CartTab> {
  final UtilServicess UtilsServices = UtilServicess();
  final cartController = Get.find<CartController>();

  double cartTotalPrice() {
    // double total = 0;

    // for (var item in appData.cartItems) {
    //   total += item.totalPrice();
    // }
    // return total;
    return 0;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'carrinho',
          style: TextStyle(
            color: CustomColors.customContrastColor,
          ),
        ),
      ),
      body: Column(
        children: [
          //list
          Expanded(child: GetBuilder<CartController>(
            builder: (controller) {
              if (controller.cartItems.isEmpty) {
                return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.remove_shopping_cart,
                      size: 40,
                      color: CustomColors.customSwatchColor,
                    ),
                    const Text('nao ha items no carrinho'),
                  ],
                );
              }
              return ListView.builder(
                itemCount: controller.cartItems.length,
                itemBuilder: (_, index) {
                  return CartTile(
                    cartitem: controller.cartItems[index],
                  );
                },
              );
            },
          )),
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: const BorderRadius.vertical(
                top: Radius.circular(30),
              ),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.shade300,
                  blurRadius: 3,
                  spreadRadius: 2,
                )
              ],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const Text(
                  'total geral',
                  style: TextStyle(
                    fontSize: 12,
                  ),
                ),
                GetBuilder<CartController>(
                  builder: (controller) {
                    return Text(
                      UtilsServices.priceToCurrency(
                          controller.cartTotalPrice()),
                      style: TextStyle(
                        fontSize: 23,
                        color: CustomColors.customSwatchColor,
                        fontWeight: FontWeight.bold,
                      ),
                    );
                  },
                ),
                SizedBox(
                  height: 50,
                  child: GetBuilder<CartController>(
                    builder: (controller) {
                      return ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: CustomColors.customSwatchColor,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(18),
                          ),
                        ),
                        onPressed: controller.isCheckouLoading
                            ? null
                            : () async {
                                // ignore: unused_local_variable
                                bool? result = await showOrderConfirmation();
                                if (result ?? false) {
                                  cartController.checkoutCart();
                                } else {
                                  UtilsServices.showToast(
                                      menssage: 'pedido nao confirmado ');
                                }
                              },
                        child: controller.isCheckouLoading
                            ? const CircularProgressIndicator()
                            : const Text(
                                'Concluir pedido',
                                style: TextStyle(fontSize: 18),
                              ),
                      );
                    },
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  Future<bool?> showOrderConfirmation() {
    return showDialog<bool>(
      context: context,
      builder: (context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          title: const Text(
            'confirmação',
          ),
          content: const Text('Deseja realmente concluir o pdido?'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(false);
              },
              child: const Text('nao'),
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
              onPressed: () {
                Navigator.of(context).pop(true);
              },
              child: const Text('sim'),
            ),
          ],
        );
      },
    );
  }
}
