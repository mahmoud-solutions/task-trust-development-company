import 'package:equatable/equatable.dart';
import 'package:trustdeveopmenttask/features/product/domain/entity/product_adons.dart';

class ProductEntity extends Equatable {
  final int id;
  final String name;
  final String description;
  final String image;
  final double price;
  final String? nameEn;
  final String? nameAr;
  final String? descriptionEn;
  final String? descriptionAr;
  final List<AddonEntity> addonEntity;
  final List<int> categoryIds;
  final bool onSale;
  final int priceTax;
  final int points;

  const ProductEntity({
    required this.id,
    required this.name,
    required this.description,
    required this.image,
    required this.price,
    this.nameEn,
    this.nameAr,
    this.descriptionEn,
    this.descriptionAr,
    required this.categoryIds,
    required this.onSale,
    required this.priceTax,
    required this.points,
    this.addonEntity = const [],
  });

  @override
  List<Object?> get props => [
        id,
        name,
        description,
        image,
        price,
        nameEn,
        nameAr,
        descriptionEn,
        descriptionAr,
        categoryIds,
        onSale,
        priceTax,
        points,
        addonEntity,
      ];
}
