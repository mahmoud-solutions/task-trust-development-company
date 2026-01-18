import 'package:equatable/equatable.dart';
import 'package:trustdeveopmenttask/features/product/data/model/productAdonsAndExtrasResponse/product_adons_extrass/addon.dart';
import 'package:trustdeveopmenttask/features/product/domain/entity/product_entities.dart';

class ProductModel extends Equatable {
  final int id;
  final String name;
  final String description;
  final String image;
  final double price;
  final String? nameEn;
  final String? nameAr;
  final String? descriptionEn;
  final String? descriptionAr;
  final List<int> categoryIds;
  final bool onSale;
  final int priceTax;
  final int points;
  final List<Addon> addons;
  const ProductModel({
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
    this.addons = const [],
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
      id: json['id'],
      name: json['name'] ?? '',
      description: json['description'] ?? '',
      image: json['image'] ?? '',
      price: double.tryParse(json['price'].toString()) ?? 0.0,
      nameEn: json['name_en'],
      nameAr: json['name_ar'],
      descriptionEn: json['description_en'],
      descriptionAr: json['description_ar'],
      categoryIds: List<int>.from(json['category_ids'] ?? []),
      onSale: json['on_sale'] ?? false,
      priceTax: json['price_tax'] ?? 0,
      points: json['points'] ?? 0,
      addons: (json['addons'] as List<dynamic>?)
              ?.map((e) => Addon.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'description': description,
      'image': image,
      'price': price,
      'name_en': nameEn,
      'name_ar': nameAr,
      'description_en': descriptionEn,
      'description_ar': descriptionAr,
      'category_ids': categoryIds,
      'on_sale': onSale,
      'price_tax': priceTax,
      'points': points,
      'addons': addons.map((e) => e.toJson()).toList(),
    };
  }

  ProductEntity toEntity() {
    return ProductEntity(
      id: id,
      name: name,
      description: description,
      image: image,
      price: price,
      nameEn: nameEn,
      nameAr: nameAr,
      descriptionEn: descriptionEn,
      descriptionAr: descriptionAr,
      categoryIds: categoryIds,
      onSale: onSale,
      priceTax: priceTax,
      points: points,
      addonEntity:
          addons.map((addon) => addon.toEntity()).toList(), // التحويل هنا
    );
  }

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
        addons,
      ];
}
