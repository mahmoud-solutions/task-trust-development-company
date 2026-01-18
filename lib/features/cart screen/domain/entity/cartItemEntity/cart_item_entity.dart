import 'package:trustdeveopmenttask/features/cart%20screen/domain/entity/AddonEntity/addon_entity.dart';

class CartItemEntity {
  final int productId;
  final String productName;
  final String productNameEn;
  final String productNameAr;
  final int quantity;
  final String price;
  final int addonPrice;
  final String image;
  final List<AddonByCategoryEntity> addons;
  final String points;
  final String total;

  CartItemEntity({
    required this.productId,
    required this.productName,
    required this.productNameEn,
    required this.productNameAr,
    required this.quantity,
    required this.price,
    required this.addonPrice,
    required this.image,
    required this.addons,
    required this.points,
    required this.total,
  });
}
