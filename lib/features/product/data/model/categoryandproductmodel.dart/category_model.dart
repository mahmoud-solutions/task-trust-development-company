import 'package:equatable/equatable.dart';
import 'package:trustdeveopmenttask/features/product/data/model/categoryandproductmodel.dart/product_model.dart';
import 'package:trustdeveopmenttask/features/product/domain/entity/category_entities.dart';

class CategoryModel extends Equatable {
  final int id;
  final String nameEn;
  final String nameAr;
  final String image;
  final List<ProductModel> products;

  const CategoryModel({
    required this.id,
    required this.nameEn,
    required this.nameAr,
    required this.image,
    required this.products,
  });

  factory CategoryModel.fromJson(Map<String, dynamic> json) {
    return CategoryModel(
      id: json['id'],
      nameEn: json['name_en'] ?? '',
      nameAr: json['name_ar'] ?? '',
      image: json['image'] ?? '',
      products: (json['products'] as List<dynamic>)
          .map((product) => ProductModel.fromJson(product))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name_en': nameEn,
      'name_ar': nameAr,
      'image': image,
      'products': products.map((product) => product.toJson()).toList(),
    };
  }

  CategoryEntity toEntity() {
    return CategoryEntity(
      id: id,
      nameEn: nameEn,
      nameAr: nameAr,
      image: image,
      products: products.map((model) => model.toEntity()).toList(),
    );
  }

  @override
  List<Object?> get props => [id, nameEn, nameAr, image, products];
}
