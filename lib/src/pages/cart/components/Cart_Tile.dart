// ignore_for_file: file_names, non_constant_identifier_names

import 'package:appquitanda/src/config/custom_colors.dart';
import 'package:appquitanda/src/models/cart_item_model.dart';
import 'package:appquitanda/src/pages/common_widgets/quantity_widget.dart';
import 'package:appquitanda/src/services/utils_services.dart';
import 'package:flutter/material.dart';

class CartTile extends StatefulWidget {
  final CartItemModel cartitem;
  final Function(CartItemModel) remove;
  const CartTile({
    super.key,
    required this.cartitem,
    required this.remove,
  });

  @override
  State<CartTile> createState() => _CartTileState();
}

class _CartTileState extends State<CartTile> {
  final utilServices UtilsServices = utilServices();

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.fromLTRB(10, 10, 10, 0),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      child: ListTile(
        //imagem
        leading: Image.asset(
          widget.cartitem.item.imgUrl,
          height: 60,
          width: 60,
        ),
        //titulo
        title: Text(
          widget.cartitem.item.itemName,
          style: const TextStyle(
            fontWeight: FontWeight.w500,
          ),
        ),
        //total
        subtitle: Text(
          UtilsServices.priceToCurrency(widget.cartitem.Totalprice()),
          style: TextStyle(
            color: CustomColors.customSwatchColor,
            fontWeight: FontWeight.bold,
          ),
        ),
        //quantidade
        trailing: Quantitywidget(
          result: ((quantity) {
            setState(() {
              widget.cartitem.quantity = quantity;

              if (quantity == 0) {
                //remover
                widget.remove(widget.cartitem);
              }
            });
          }),
          suffixtext2: widget.cartitem.item.unit,
          value1: widget.cartitem.quantity,
          isremovable: true,
        ),
      ),
    );
  }
}
