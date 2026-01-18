import 'package:flutter/material.dart';
import 'package:trustdeveopmenttask/features/prodact%20details%20screen/widgets/circle_icon.dart';
import 'package:trustdeveopmenttask/features/product/domain/entity/product_entities.dart';

class ProductInfoSection extends StatelessWidget {
  const ProductInfoSection({super.key, required this.productEntity});
  final ProductEntity productEntity;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Text(
            productEntity.nameAr!,
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 12),
          Row(
            children: [
              Row(
                children: const [
                  CircleIcon(icon: Icons.remove),
                  SizedBox(width: 8),
                  Text('1'),
                  SizedBox(width: 8),
                  CircleIcon(
                    icon: Icons.add,
                    color: Colors.red,
                  ),
                ],
              ),
              const Spacer(),
              Text(
                '${productEntity.price} ج',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
