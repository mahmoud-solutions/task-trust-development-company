import 'package:trustdeveopmenttask/features/cart%20screen/domain/entity/cartResponseEntity/cart_response_entity.dart';

import 'cart_item.dart';

class CartResponseModel extends CartResponseEntity {
  CartResponseModel({
    required super.cartItems,
    required super.totalPrice,
    required super.vat,
    required super.totalPriceWithTax,
    required super.totalItems,
    required super.totalPoints,
  });

  factory CartResponseModel.fromJson(Map<String, dynamic> json) =>
      CartResponseModel(
        cartItems: (json['cart_items'] as List<dynamic>)
            .map((e) => CartItemModel.fromJson(e))
            .toList(),
        totalPrice: _parseDouble(json['total_price']),
        vat: json['VAT']?.toString() ?? '0',
        totalPriceWithTax: _parseDouble(json['total_price_with_tax']),
        totalItems: _parseInt(json['total_items']),
        totalPoints: json['total_points']?.toString() ?? '0',
      );

  static double _parseDouble(dynamic value) {
    if (value == null) return 0.0;
    if (value is double) return value;
    if (value is int) return value.toDouble();
    if (value is String) {
      return double.tryParse(value) ?? 0.0;
    }
    return 0.0;
  }

  static int _parseInt(dynamic value) {
    if (value == null) return 0;
    if (value is int) return value;
    if (value is double) return value.toInt();
    if (value is String) {
      return int.tryParse(value) ?? 0;
    }
    return 0;
  }

  Map<String, dynamic> toJson() => {
        'cart_items':
            cartItems.map((e) => (e as CartItemModel).toJson()).toList(),
        'total_price': totalPrice,
        'VAT': vat,
        'total_price_with_tax': totalPriceWithTax,
        'total_items': totalItems,
        'total_points': totalPoints,
      };
}
