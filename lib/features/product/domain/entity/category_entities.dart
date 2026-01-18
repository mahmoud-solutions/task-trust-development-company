import 'package:trustdeveopmenttask/features/product/domain/entity/product_entities.dart';

class CategoryEntity {
  final int id;
  final String nameEn;
  final String nameAr;
  final String image;
  final List<ProductEntity> products;

  CategoryEntity({
    required this.id,
    required this.nameEn,
    required this.nameAr,
    required this.image,
    required this.products,
  });
}
