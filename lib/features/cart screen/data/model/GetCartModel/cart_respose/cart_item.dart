import 'package:trustdeveopmenttask/features/cart%20screen/data/model/GetCartModel/cart_respose/addon.dart';
import 'package:trustdeveopmenttask/features/cart%20screen/domain/entity/cartItemEntity/cart_item_entity.dart';

class CartItemModel extends CartItemEntity {
  CartItemModel({
    required super.productId,
    required super.productName,
    required super.productNameEn,
    required super.productNameAr,
    required super.quantity,
    required super.price,
    required super.addonPrice,
    required super.image,
    required super.addons,
    required super.points,
    required super.total,
  });

  factory CartItemModel.fromJson(Map<String, dynamic> json) => CartItemModel(
        productId: _parseInt(json['product_id']),
        productName: json['product_name']?.toString() ?? '',
        productNameEn: json['product_name_en']?.toString() ?? '',
        productNameAr: json['product_name_ar']?.toString() ?? '',
        quantity: _parseInt(json['quantity']),
        price: json['price']?.toString() ?? '0',
        addonPrice: _parseInt(json['addon_price']),
        image: json['image']?.toString() ?? '',
        addons: (json['addons'] as List<dynamic>?)
                ?.map((e) => AddonByCategoryModel.fromJson(e))
                .toList() ??
            [],
        points: json['points']?.toString() ?? '0',
        total: json['total']?.toString() ?? '0',
      );

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
        'product_id': productId,
        'product_name': productName,
        'product_name_en': productNameEn,
        'product_name_ar': productNameAr,
        'quantity': quantity,
        'price': price,
        'addon_price': addonPrice,
        'image': image,
        'addons':
            addons.map((e) => (e as AddonByCategoryModel).toJson()).toList(),
        'points': points,
        'total': total,
      };
}
