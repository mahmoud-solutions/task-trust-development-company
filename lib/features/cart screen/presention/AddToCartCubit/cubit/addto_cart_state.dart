abstract class AddToCartState {}

class AddToCartInitial extends AddToCartState {}

class AddToCartLoading extends AddToCartState {
  final int productId;

  AddToCartLoading(this.productId);
}

class AddToCartSuccess extends AddToCartState {
  final String guestId;
  final int productId;

  AddToCartSuccess(this.guestId, this.productId);
}

class AddToCartError extends AddToCartState {
  final String message;
  final int? productId;

  AddToCartError(this.message, [this.productId]);
}
