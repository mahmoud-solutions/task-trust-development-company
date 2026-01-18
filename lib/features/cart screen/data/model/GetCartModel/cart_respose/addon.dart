import 'package:trustdeveopmenttask/features/cart%20screen/domain/entity/AddonEntity/addon_entity.dart';

class AddonByCategoryModel extends AddonByCategoryEntity {
  AddonByCategoryModel({
    required super.id,
    required super.name,
    required super.price,
  });

  factory AddonByCategoryModel.fromJson(Map<String, dynamic> json) =>
      AddonByCategoryModel(
        id: json['id'] ?? 0,
        name: json['name'] ?? '',
        price: json['price'].toString(),
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'price': price,
      };
}
