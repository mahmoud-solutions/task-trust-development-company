class AddToCartEntity {
  final int productId;
  final int quantity;
  final List<Map<String, dynamic>>? addons;

  AddToCartEntity({
    required this.productId,
    required this.quantity,
    this.addons,
  });
}
