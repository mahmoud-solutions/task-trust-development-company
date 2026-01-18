class AddToCartItemModel {
  final int productId;
  final int quantity;
  final List<Map<String, dynamic>>? addons;

  AddToCartItemModel({
    required this.productId,
    required this.quantity,
    this.addons,
  });

  Map<String, dynamic> toJson() {
    return {
      "product_id": productId,
      "quantity": quantity,
      "addons": addons,
    };
  }
}
