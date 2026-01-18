// lib/features/product/domain/entity/product_details_entity.dart
class ProductDetailsEntity {
  final int id;
  final String name;
  final String description;
  final double price;
  final String image;

  ProductDetailsEntity({
    required this.id,
    required this.name,
    required this.description,
    required this.price,
    required this.image,
  });
}
