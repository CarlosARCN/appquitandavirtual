import 'package:flutter/material.dart';
import 'package:greengrocer/src/config/custom_colors.dart';
import 'package:greengrocer/src/pages/cart/blocs/cart_bloc.dart';
import 'package:greengrocer/src/pages/cart/blocs/cart_event.dart';
import 'package:greengrocer/src/pages/cart/blocs/cart_state.dart';
import 'package:greengrocer/src/pages/cart/components/cart_tile.dart';
import 'package:greengrocer/src/pages/common_widgets/payment_dialog.dart';
import 'package:greengrocer/src/services/utils_services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:greengrocer/src/config/app_data.dart' as appdata;

class CartTab extends StatefulWidget {
  const CartTab({Key? key}) : super(key: key);

  @override
  State<CartTab> createState() => _CartTabState();
}

class _CartTabState extends State<CartTab> {
  late final CartItemBloc bloc;

  final UtilsServices utilsServices = UtilsServices();

  @override
  void initState() {
    super.initState();
    bloc = CartItemBloc();
    bloc.add(
      LoadCartItemEvent(),
    );
  }

  @override
  void dispose() {
    bloc.close();
    super.dispose();
  }
  //TODO: funcition total price

  // double cartTotalPrice() {
  //   double total = 0;

  //   for (var item in cartItemsList) {
  //     total += item.totalPrice();
  //   }

  //   return total;
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Carrinho'),
      ),
      body: Column(
        children: [
          Expanded(
            child: BlocBuilder<CartItemBloc, CartItemState>(
              bloc: bloc,
              builder: (context, State) {
                if (State is CartItemInitialState) {
                  return const Center(
                    child: CircularProgressIndicator.adaptive(),
                  );
                } else if (State is CartItemSuccessState) {
                  final cartItemsList = State.cartItemsModel;
                  return ListView.builder(
                    itemCount: cartItemsList.length,
                    itemBuilder: (_, index) {
                      return CartTile(
                        cartItem: cartItemsList[index],
                        remove: (cartItemModel) {
                          bloc.add(
                            RemoveCartItemEvent(
                              cartItemModel: cartItemsList[index],
                            ),
                          );
                        },
                      );
                    },
                  );
                }
                return Container();
              },
            ),
          ),
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: const BorderRadius.vertical(
                top: Radius.circular(30),
              ),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.shade300,
                  blurRadius: 3,
                  spreadRadius: 2,
                ),
              ],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 8),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Total geral',
                        style: TextStyle(
                          fontSize: 12,
                        ),
                      ),
                      Text(
                        'a definir a function',
                        style: TextStyle(
                          fontSize: 23,
                          color: CustomColors.customSwatchColor,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 50,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: CustomColors.customSwatchColor,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(18),
                      ),
                    ),
                    onPressed: () async {
                      bool? result = await showOrderConfirmation();

                      if (result ?? false) {
                        showDialog(
                          context: context,
                          builder: (_) {
                            return PaymentDialog(
                              order: appdata.orders.first,
                            );
                          },
                        );
                      } else {
                        utilsServices.showToast(
                          message: 'Pedido não confirmado',
                          isError: true,
                        );
                      }
                    },
                    child: const Text(
                      'Concluir pedido',
                      style: TextStyle(
                        fontSize: 18,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Future<bool?> showOrderConfirmation() {
    return showDialog<bool>(
      context: context,
      builder: (context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          title: const Text('Confirmação'),
          content: const Text('Deseja realmente concluir o pedido?'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(false);
              },
              child: const Text('Não'),
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
              onPressed: () {
                Navigator.of(context).pop(true);
              },
              child: const Text('Sim'),
            ),
          ],
        );
      },
    );
  }
}
