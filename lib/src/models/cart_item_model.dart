// ignore_for_file: non_constant_identifier_names

import 'package:appquitanda/src/models/Iten_model.dart';

class CartItemModel {
  ItemModel item;
  int quantity;
  CartItemModel({
    required this.item,
    required this.quantity,
  });

  double Totalprice() => item.price * quantity;
}
