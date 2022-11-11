// ignore_for_file: library_prefixes

import 'package:appquitanda/src/config/custom_colors.dart';
import 'package:appquitanda/src/config/app_data.dart' as appData;
import 'package:appquitanda/src/pages/orders/components/Order_Tile.dart';
import 'package:flutter/material.dart';

class OrdersTab extends StatelessWidget {
  const OrdersTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Pedidos',
          style: TextStyle(
            color: CustomColors.customContrastColor,
          ),
        ),
      ),
      body: ListView.separated(
        padding: const EdgeInsets.all(16),
        physics: const BouncingScrollPhysics(),
        itemBuilder: ((context, index) =>
            OrderTile(order: appData.orders[index])),
        separatorBuilder: (_, index) => const SizedBox(height: 10),
        itemCount: appData.orders.length,
      ),
    );
  }
}
