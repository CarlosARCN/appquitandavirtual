import 'package:greengrocer/src/models/cart_item_model.dart';

abstract class CartItemEvent {}

class LoadCartItemEvent extends CartItemEvent {}

class AddCartItemEvent extends CartItemEvent {
  CartItemModel cartItemModel;

  AddCartItemEvent({
    required this.cartItemModel,
  });
}

class RemoveCartItemEvent extends CartItemEvent {
  CartItemModel cartItemModel;

  RemoveCartItemEvent({
    required this.cartItemModel,
  });
}
