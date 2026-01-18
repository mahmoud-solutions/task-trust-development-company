part of 'cart_cubit.dart';

@immutable
abstract class CartState {}

class CartInitial extends CartState {}

class CartLoading extends CartState {}

class CartLoaded extends CartState {
  final CartResponseEntity cart;

  CartLoaded(this.cart);
}

class CartError extends CartState {
  final String message;

  CartError(this.message);
}
