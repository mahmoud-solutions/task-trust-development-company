import 'addonResponseModel.dart';
// file: block.dart
import 'addonResponseModel.dart';

class Block {
  final String? id;
  final String? name;
  final String? productAssociation;
  final String? excludeProducts;
  final String? userAssociation;
  final String? excludeUsers;
  final List<AddonResponseModel>? addons;

  Block({
    this.id,
    this.name,
    this.productAssociation,
    this.excludeProducts,
    this.userAssociation,
    this.excludeUsers,
    this.addons,
  });

  factory Block.fromJson(Map<String, dynamic> json) => Block(
        id: json['id'] as String?,
        name: json['name'] as String?,
        productAssociation: json['product_association'] as String?,
        excludeProducts: json['exclude_products'] as String?,
        userAssociation: json['user_association'] as String?,
        excludeUsers: json['exclude_users'] as String?,
        addons: (json['addons'] as List<dynamic>?)
            ?.map((e) => AddonResponseModel.fromJson(e as Map<String, dynamic>))
            .toList(),
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'product_association': productAssociation,
        'exclude_products': excludeProducts,
        'user_association': userAssociation,
        'exclude_users': excludeUsers,
        'addons': addons?.map((e) => e.toJson()).toList(),
      };
}
