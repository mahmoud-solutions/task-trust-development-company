import 'package:flutter/material.dart';
import 'package:trustdeveopmenttask/features/product/domain/entity/product_entities.dart';

class ProductImageSection extends StatelessWidget {
  const ProductImageSection({super.key, required this.productEntity});
  final ProductEntity productEntity;
  @override
  Widget build(BuildContext context) {
    return Image.network(
      productEntity.image,
      height: 250,
      width: double.infinity,
      fit: BoxFit.cover,
    );
  }
}
