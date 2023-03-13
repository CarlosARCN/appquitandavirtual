import 'package:greengrocer/src/config/app_data.dart';
import 'package:greengrocer/src/models/cart_item_model.dart';

class CartItemRepository {
  final List<CartItemModel> cartItems = [];

  List<CartItemModel> loadCartItem() {
    cartItems.addAll([
      CartItemModel(
        item: apple,
        quantity: 4,
      ),
      CartItemModel(
        item: mango,
        quantity: 2,
      ),
      CartItemModel(
        item: guava,
        quantity: 1,
      ),
    ]);
    return cartItems;
  }

  List<CartItemModel> addCartItem(CartItemModel cartItemModel) {
    cartItems.add(cartItemModel);
    return cartItems;
  }

  List<CartItemModel> removeCartItem(CartItemModel cartItemModel) {
    cartItems.remove(cartItemModel);
    return cartItems;
  }
}
