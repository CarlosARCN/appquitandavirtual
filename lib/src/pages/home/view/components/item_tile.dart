// ignore_for_file: must_be_immutable

import 'package:appquitanda/src/config/custom_colors.dart';
import 'package:appquitanda/src/models/Iten_model.dart';
import 'package:appquitanda/src/pages/cart/controller/cart_controller.dart';
import 'package:appquitanda/src/pages_Routes/app_Pages.dart';
import 'package:appquitanda/src/services/utils_services.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ItemTile extends StatefulWidget {
  final ItemModel item;
  final Function(GlobalKey) cartAnimationMethod;

  const ItemTile({
    super.key,
    required this.item,
    required this.cartAnimationMethod,
  });

  @override
  State<ItemTile> createState() => _ItemTileState();
}

class _ItemTileState extends State<ItemTile> {
  final GlobalKey imageGk = GlobalKey();

  final UtilServicess utilservices = UtilServicess();
  final cartController = Get.find<CartController>();

  IconData tittleIcon = Icons.add_shopping_cart_outlined;

  Future<void> swithIcon() async {
    setState(() => tittleIcon = Icons.add_task_outlined);

    await Future.delayed(const Duration(milliseconds: 2000));

    setState(() => tittleIcon = Icons.add_shopping_cart_outlined);
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        GestureDetector(
          onTap: () {
            Get.toNamed(PagesRoutes.productRoute, arguments: widget.item);
          },
          child: Card(
            elevation: 1,
            shadowColor: Colors.grey.shade500,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  //img
                  //outro pt.
                  Expanded(
                    child: Hero(
                      tag: widget.item.imgUrl,
                      child: Image.network(
                        widget.item.imgUrl,
                        key: imageGk,
                      ),
                    ),
                  ),
                  //nome
                  Text(
                    widget.item.itemName,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  //preco - unit
                  Row(
                    children: [
                      Text(
                        utilservices.priceToCurrency(widget.item.price),
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                          color: CustomColors.customSwatchColor,
                        ),
                      ),
                      Text(
                        ' - ${widget.item.unit}',
                        style: TextStyle(
                          color: Colors.grey.shade500,
                          fontWeight: FontWeight.bold,
                          fontSize: 12,
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
        Positioned(
            top: 4,
            right: 4,
            child: ClipRRect(
              borderRadius: const BorderRadius.only(
                bottomLeft: Radius.circular(15),
                topRight: Radius.circular(20),
              ),
              child: Material(
                child: InkWell(
                  onTap: () {
                    swithIcon();

                    cartController.addItemToCart(item: widget.item);

                    widget.cartAnimationMethod(imageGk);
                  },
                  child: Ink(
                    decoration: BoxDecoration(
                      color: CustomColors.customSwatchColor,
                    ),
                    height: 40,
                    width: 35,
                    child: Icon(
                      tittleIcon,
                      color: Colors.white,
                      size: 20,
                    ),
                  ),
                ),
              ),
            ))
      ],
    );
  }
}
