import 'package:flutter/material.dart';
import 'package:trustdeveopmenttask/features/product/domain/entity/product_entities.dart';

class DescriptionSection extends StatelessWidget {
  const DescriptionSection({super.key, required this.productEntity});
  final ProductEntity productEntity;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(16),
      child: Text(
        productEntity.descriptionAr!,
        style: TextStyle(fontSize: 14),
      ),
    );
  }
}
