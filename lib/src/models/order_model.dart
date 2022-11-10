// ignore_for_file: non_constant_identifier_names

import 'package:appquitanda/src/models/cart_item_model.dart';

class OrderModel {
  String id;
  DateTime createdDatetime;
  DateTime overdueDatetime;
  List<CartItemModel> items;
  String status;
  String copyAndPaste;
  double total;

  OrderModel({
    required this.copyAndPaste,
    required this.id,
    required this.createdDatetime,
    required this.items,
    required this.overdueDatetime,
    required this.status,
    required this.total,
  });
}
