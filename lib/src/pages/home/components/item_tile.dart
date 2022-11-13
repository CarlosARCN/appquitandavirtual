// ignore_for_file: must_be_immutable

import 'package:appquitanda/src/config/custom_colors.dart';
import 'package:appquitanda/src/models/Iten_model.dart';
import 'package:appquitanda/src/pages/product/product_screen.dart';
import 'package:appquitanda/src/services/utils_services.dart';
import 'package:flutter/material.dart';

class ItemTile extends StatelessWidget {
  final ItemModel item;
  final Function(GlobalKey) cartAnimationMethod;
  final GlobalKey imageGk = GlobalKey();
  ItemTile({
    super.key,
    required this.item,
    required this.cartAnimationMethod,
  });
  utilServices utilservices = utilServices();

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        GestureDetector(
          onTap: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (c) {
                  return ProductScreen(
                    item: item,
                  );
                },
              ),
            );
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
                      tag: item.imgUrl,
                      child: Image.asset(
                        item.imgUrl,
                        key: imageGk,
                      ),
                    ),
                  ),
                  //nome
                  Text(
                    item.itemName,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  //preco - unit
                  Row(
                    children: [
                      Text(
                        utilservices.priceToCurrency(item.price),
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                          color: CustomColors.customSwatchColor,
                        ),
                      ),
                      Text(
                        ' - ${item.unit}',
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
            child: GestureDetector(
              onTap: () {
                cartAnimationMethod(imageGk);
              },
              child: Container(
                decoration: BoxDecoration(
                  color: CustomColors.customSwatchColor,
                  borderRadius: const BorderRadius.only(
                    bottomLeft: Radius.circular(15),
                    topRight: Radius.circular(20),
                  ),
                ),
                height: 40,
                width: 35,
                child: const Icon(
                  Icons.add_shopping_cart_outlined,
                  color: Colors.white,
                  size: 20,
                ),
              ),
            ))
      ],
    );
  }
}
