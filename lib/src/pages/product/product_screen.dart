import 'package:appquitanda/src/config/custom_colors.dart';
import 'package:appquitanda/src/models/Iten_model.dart';
import 'package:appquitanda/src/pages/base/controller/navigation_controller.dart';
import 'package:appquitanda/src/pages/cart/controller/cart_controller.dart';
import 'package:appquitanda/src/pages/common_widgets/quantity_widget.dart';
import 'package:appquitanda/src/services/utils_services.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProductScreen extends StatefulWidget {
  ProductScreen({
    super.key,
    // required this.item,
  });

  final ItemModel item = Get.arguments;

  @override
  State<ProductScreen> createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {
  final UtilServicess utilservices = UtilServicess();

  int cartitemquantity = 1;

  final cartController = Get.find<CartController>();
  final navigationController = Get.find<NavigationController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white.withAlpha(230),
      body: Stack(
        children: [
          //conteudo
          Column(children: [
            Expanded(
              //hero poblematico

              child: Hero(
                tag: widget.item.imgUrl,
                child: Image.network(widget.item.imgUrl),
              ),
            ),
            Expanded(
              child: Container(
                padding: const EdgeInsets.all(32),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: const BorderRadius.vertical(
                    top: Radius.circular(50),
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.shade600,
                      offset: const Offset(0, 2),
                    ),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    //nome - quantidade
                    Row(
                      children: [
                        Expanded(
                          child: Text(
                            widget.item.itemName,
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            style: const TextStyle(
                                fontSize: 27, fontWeight: FontWeight.bold),
                          ),
                        ),
                        Quantitywidget(
                          suffixtext2: widget.item.unit,
                          value1: cartitemquantity,
                          result: (quantity) {
                            setState(() {
                              cartitemquantity = quantity;
                            });
                          },
                        )
                      ],
                    ),

                    //preco
                    Text(
                      utilservices.priceToCurrency(widget.item.price),
                      style: TextStyle(
                        fontSize: 23,
                        color: CustomColors.customSwatchColor,
                      ),
                    ),
                    //descricao
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 10),
                        child: SingleChildScrollView(
                          child: Text(
                            widget.item.description,
                            style: const TextStyle(
                              height: 1.5,
                            ),
                          ),
                        ),
                      ),
                    ),

                    //botao
                    SizedBox(
                      height: 55,
                      child: ElevatedButton.icon(
                        style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15),
                          ),
                        ),
                        onPressed: () {
                          Get.back();

                          cartController.addItemToCart(
                            item: widget.item,
                            quantity: cartitemquantity,
                          );

                          navigationController
                              .navigatePageView(NavigationTabs.cart);
                        },
                        label: const Text(
                          'Comprar',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        icon: const Icon(
                          Icons.shopping_cart_outlined,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            )
          ]),
          //back arrow
          Positioned(
            left: 10,
            top: 10,
            child: SafeArea(
              child: IconButton(
                  color: Colors.green.shade600,
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  icon: const Icon(
                    Icons.arrow_back_ios,
                  )),
            ),
          )
        ],
      ),
    );
  }
}
