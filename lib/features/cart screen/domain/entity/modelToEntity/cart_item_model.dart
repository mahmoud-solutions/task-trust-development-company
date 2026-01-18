import 'package:trustdeveopmenttask/features/cart%20screen/domain/entity/AddToCartEntity/add_to_cart_entity.dart';

class AddToCartItemModel extends AddToCartEntity {
  AddToCartItemModel({
    required super.productId,
    required super.quantity,
    super.addons,
  });

  Map<String, dynamic> toJson() {
    return {
      'product_id': productId,
      'quantity': quantity,
      if (addons != null) 'addons': addons,
    };
  }
}
