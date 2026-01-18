import 'package:flutter/material.dart';
import 'package:trustdeveopmenttask/features/prodact%20details%20screen/widgets/description_section.dart';
import 'package:trustdeveopmenttask/features/prodact%20details%20screen/widgets/divider_line.dart';
import 'package:trustdeveopmenttask/features/prodact%20details%20screen/widgets/extras_section.dart';
import 'package:trustdeveopmenttask/features/prodact%20details%20screen/widgets/product_image_sction.dart';
import 'package:trustdeveopmenttask/features/prodact%20details%20screen/widgets/product_info_section.dart';
import 'package:trustdeveopmenttask/features/product/domain/entity/product_entities.dart';

class CartScreenBody extends StatelessWidget {
  const CartScreenBody({super.key, required this.productEntity});
  final ProductEntity productEntity;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ProductImageSection(
          productEntity: productEntity,
        ),
        ProductInfoSection(
          productEntity: productEntity,
        ),
        DividerLine(),
        DescriptionSection(
          productEntity: productEntity,
        ),
        DividerLine(),
        ExtrasSection(addons: productEntity.addonEntity)
      ],
    );
  }
}
