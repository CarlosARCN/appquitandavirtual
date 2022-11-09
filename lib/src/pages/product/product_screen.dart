import 'package:appquitanda/src/config/custom_colors.dart';
import 'package:appquitanda/src/models/Iten_model.dart';
import 'package:appquitanda/src/pages/common_widgets/quantity_widget.dart';
import 'package:appquitanda/src/services/utils_services.dart';
import 'package:flutter/material.dart';

class ProductScreen extends StatefulWidget {
  const ProductScreen({
    super.key,
    required this.item,
  });

  final ItemModel item;

  @override
  State<ProductScreen> createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {
  final utilServices utilservices = utilServices();

  int cartitemquantity = 1;

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
                child: Image.asset(widget.item.imgUrl),
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
                        onPressed: () {},
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
          Positioned(
            left: 10,
            top: 10,
            child: SafeArea(
              child: IconButton(
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
