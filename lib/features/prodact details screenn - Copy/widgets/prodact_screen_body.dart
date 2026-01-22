import 'package:flutter/material.dart';

import 'product_image_sction.dart';
import 'product_info_section.dart';
import 'description_section.dart';
import 'divider_line.dart';
import 'extras_section.dart';

class CartScreenBody extends StatelessWidget {
  const CartScreenBody(
      {super.key,
      required this.imageProduct,
      required this.nameProduct,
      required this.descriptionProduct,
      required this.addonTitles,
      required this.price});
  final String imageProduct;
  final String nameProduct;
  final double price;
  final String descriptionProduct;

  final List<String> addonTitles;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ProductImageSection(
          imgage: imageProduct,
        ),
        ProductInfoSection(
          nameProduct: nameProduct,
          priceProduct: price,
        ),
        DividerLine(),
        DescriptionSection(
          description: descriptionProduct,
        ),
        DividerLine(),
        ExtrasSection(
          addons: addonTitles,
        ),
      ],
    );
  }
}
