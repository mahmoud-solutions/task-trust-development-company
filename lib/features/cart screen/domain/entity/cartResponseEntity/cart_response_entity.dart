import 'package:trustdeveopmenttask/features/cart%20screen/domain/entity/cartItemEntity/cart_item_entity.dart';

class CartResponseEntity {
  final List<CartItemEntity> cartItems;
  final double totalPrice;
  final String vat;
  final double totalPriceWithTax;
  final int totalItems;
  final String totalPoints;

  CartResponseEntity({
    required this.cartItems,
    required this.totalPrice,
    required this.vat,
    required this.totalPriceWithTax,
    required this.totalItems,
    required this.totalPoints,
  });
}
