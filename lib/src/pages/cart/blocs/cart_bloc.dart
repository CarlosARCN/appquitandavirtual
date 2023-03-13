import 'package:greengrocer/src/pages/cart/blocs/cart_event.dart';
import 'package:greengrocer/src/pages/cart/blocs/cart_state.dart';
import 'package:bloc/bloc.dart';
import 'package:greengrocer/src/repository/cart_items_repository.dart';

class CartItemBloc extends Bloc<CartItemEvent, CartItemState> {
  final _cartRepo = CartItemRepository();

  CartItemBloc() : super(CartItemInitialState()) {
    on<LoadCartItemEvent>(
      (event, emit) => emit(
        CartItemSuccessState(
          cartItemModel: _cartRepo.loadCartItem(),
        ),
      ),
    );
    on<AddCartItemEvent>(
      (event, emit) => emit(
        CartItemSuccessState(
          cartItemModel: _cartRepo.addCartItem(event.cartItemModel),
        ),
      ),
    );
    on<RemoveCartItemEvent>(
      (event, emit) => emit(
        CartItemSuccessState(
          cartItemModel: _cartRepo.removeCartItem(event.cartItemModel),
        ),
      ),
    );
  }
}
