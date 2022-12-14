// ignore_for_file: file_names, non_constant_identifier_names
import 'package:appquitanda/src/models/cart_item_model.dart';
import 'package:appquitanda/src/pages/common_widgets/Payment_dialog.dart';
import 'package:appquitanda/src/pages/orders/controller/order_controller.dart';
import 'package:appquitanda/src/pages/orders/view/components/order_status_widget.dart';
import 'package:flutter/material.dart';
import 'package:appquitanda/src/models/order_model.dart';
import 'package:appquitanda/src/services/utils_services.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

class OrderTile extends StatelessWidget {
  final OrderModel order;

  OrderTile({
    super.key,
    required this.order,
  });
  final UtilServicess Utilsservices = UtilServicess();

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      child: Theme(
          data: Theme.of(context).copyWith(dividerColor: Colors.transparent),
          child: GetBuilder<OrderController>(
            init: OrderController(order),
            global: false,
            builder: (controller) {
              return ExpansionTile(
                onExpansionChanged: (value) {
                  if (value && order.items.isEmpty) {
                    controller.getOrderItems();
                  }
                },
                // initiallyExpanded: order.status == 'pending_payment',
                title: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('pedido: ${order.id}'),
                    Text(
                      Utilsservices.formaterDateTime(order.createdDatetime!),
                      style: const TextStyle(
                        fontSize: 12,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
                childrenPadding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
                expandedCrossAxisAlignment: CrossAxisAlignment.stretch,
                children: controller.isLoading
                    ? [
                        Container(
                          height: 80,
                          alignment: Alignment.center,
                          child: const CircularProgressIndicator(),
                        )
                      ]
                    : [
                        IntrinsicHeight(
                          child: Row(
                            children: [
                              //expanded1
                              Expanded(
                                flex: 3,
                                child: SizedBox(
                                  height: 150,
                                  child: ListView(
                                    children: order.items.map((orderitem) {
                                      return _OrderItemWidget(
                                        orderItem: orderitem,
                                        utilsServices: Utilsservices,
                                      );
                                    }).toList(),
                                  ),
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
                                    isOverdue: order.overdueDatetime
                                        .isBefore(DateTime.now()),
                                    status: order.status,
                                  )),
                            ],
                          ),
                        ),
                        //total
                        Text.rich(
                          TextSpan(
                            style: const TextStyle(
                              fontSize: 20,
                            ),
                            children: [
                              const TextSpan(
                                text: 'Total ',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              TextSpan(
                                  text: Utilsservices.priceToCurrency(
                                      order.total))
                            ],
                          ),
                        ),

                        //btn pagamento pix
                        Visibility(
                          visible: order.status == 'pending_payment' &&
                              !order.isOverDue,
                          child: ElevatedButton.icon(
                            style: ElevatedButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20),
                              ),
                            ),
                            onPressed: (() {
                              showDialog(
                                context: context,
                                builder: (_) {
                                  return PaymentDialog(
                                    order: order,
                                  );
                                },
                              );
                            }),
                            icon: Image.asset(
                              'assets/app_Images/pix.png',
                              height: 18,
                            ),
                            label: const Text('Ver QR code pix'),
                          ),
                        )
                      ],
              );
            },
          )),
    );
  }
}

class _OrderItemWidget extends StatelessWidget {
  const _OrderItemWidget({
    Key? key,
    required this.utilsServices,
    required this.orderItem,
  }) : super(key: key);

  final UtilServicess utilsServices;
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
          Text(utilsServices.priceToCurrency(orderItem.totalPrice()))
        ],
      ),
    );
  }
}
