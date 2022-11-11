// ignore_for_file: file_names, non_constant_identifier_names
import 'package:appquitanda/src/models/cart_item_model.dart';
import 'package:appquitanda/src/pages/orders/components/order_status_widget.dart';
import 'package:flutter/material.dart';
import 'package:appquitanda/src/models/order_model.dart';
import 'package:appquitanda/src/services/utils_services.dart';

class OrderTile extends StatelessWidget {
  final OrderModel order;

  OrderTile({
    super.key,
    required this.order,
  });
  final utilServices Utilsservices = utilServices();

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      child: Theme(
        data: Theme.of(context).copyWith(dividerColor: Colors.transparent),
        child: ExpansionTile(
          title: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('pedido: ${order.id}'),
              Text(
                Utilsservices.formaterDateTime(order.createdDatetime),
                style: const TextStyle(
                  fontSize: 12,
                  color: Colors.black,
                ),
              ),
            ],
          ),
          childrenPadding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
          children: [
            SizedBox(
              height: 150,
              child: Row(
                children: [
                  //expanded1
                  Expanded(
                    flex: 3,
                    child: ListView(
                      children: order.items.map((orderitem) {
                        return _OrderItemWidget(
                          orderItem: orderitem,
                          utilsServices: Utilsservices,
                        );
                      }).toList(),
                    ),
                  ),
                  //divisao
                  VerticalDivider(
                    color: Colors.grey.shade300,
                    thickness: 2,
                    width: 8,
                  ),
                  //expanded2
                  Expanded(
                      flex: 2,
                      child: OrderStatusWidget(
                        isOverdue:
                            order.overdueDatetime.isBefore(DateTime.now()),
                        status: order.status,
                      )),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class _OrderItemWidget extends StatelessWidget {
  const _OrderItemWidget({
    Key? key,
    required this.utilsServices,
    required this.orderItem,
  }) : super(key: key);

  final utilServices utilsServices;
  final CartItemModel orderItem;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Row(
        children: [
          Text(
            '${orderItem.quantity} ${orderItem.item.unit} ',
            style: const TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
          Expanded(child: Text(orderItem.item.itemName)),
          Text(utilsServices.priceToCurrency(orderItem.Totalprice()))
        ],
      ),
    );
  }
}
