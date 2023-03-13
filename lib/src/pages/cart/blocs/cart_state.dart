import 'package:greengrocer/src/models/cart_item_model.dart';

abstract class CartItemState {
  List<CartItemModel> cartItemsModel;

  CartItemState({
    required this.cartItemsModel,
  });
}

class CartItemInitialState extends CartItemState {
  CartItemInitialState() : super(cartItemsModel: []);
}

class CartItemSuccessState extends CartItemState {
  CartItemSuccessState({required List<CartItemModel> cartItemModel})
      : super(cartItemsModel: cartItemModel);
}
