// ignore_for_file: file_names, non_constant_identifier_names

import 'package:appquitanda/src/models/order_model.dart';
import 'package:appquitanda/src/services/utils_services.dart';
import 'package:flutter/material.dart';

class OrderTile extends StatelessWidget {
  final OrderModel order;
  OrderTile({super.key, required this.order});
  final utilServices Utilsservices = utilServices();

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      child: Theme(
        data: Theme.of(context).copyWith(
          dividerColor: Colors.transparent,
        ),
        child: ExpansionTile(
          title: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text('pedido: ${order.id}'),
              Text(
                Utilsservices.formaterDateTime(order.createdDatetime),
                style: const TextStyle(fontSize: 12, color: Colors.black),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
