// ignore_for_file: non_constant_identifier_names, library_prefixes

import 'package:appquitanda/src/config/custom_colors.dart';
import 'package:appquitanda/src/models/cart_item_model.dart';
import 'package:appquitanda/src/pages/cart/components/Cart_Tile.dart';
import 'package:appquitanda/src/services/utils_services.dart';
import 'package:flutter/material.dart';
import 'package:appquitanda/src/config/app_data.dart' as appData;

class CartTab extends StatefulWidget {
  const CartTab({super.key});

  @override
  State<CartTab> createState() => _CartTabState();
}

class _CartTabState extends State<CartTab> {
  final utilServices UtilsServices = utilServices();

  void removeitemfromcart(CartItemModel cartitem) {
    setState(() {
      appData.CartItems.remove(cartitem);
    });
  }

  double cartTotalPrice() {
    double total = 0;

    for (var item in appData.CartItems) {
      total += item.Totalprice();
    }
    return total;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('carrinho'),
      ),
      body: Column(
        children: [
          Expanded(
              child: ListView.builder(
            itemCount: appData.CartItems.length,
            itemBuilder: (_, index) {
              return CartTile(
                  cartitem: appData.CartItems[index],
                  remove: removeitemfromcart);
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
                Text(
                  UtilsServices.priceToCurrency(cartTotalPrice()),
                  style: TextStyle(
                    fontSize: 23,
                    color: CustomColors.customSwatchColor,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(
                  height: 50,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: CustomColors.customSwatchColor,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(18),
                      ),
                    ),
                    onPressed: () {},
                    child: const Text(
                      'Concluir pedido',
                      style: TextStyle(fontSize: 18),
                    ),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
