import 'package:flutter/material.dart';

class ProductImageSection extends StatelessWidget {
  const ProductImageSection({super.key, required this.imgage});
  final String imgage;

  @override
  Widget build(BuildContext context) {
    return Image.network(
      imgage,
      height: 250,
      width: double.infinity,
      fit: BoxFit.cover,
    );
  }
}
