import 'package:flutter/material.dart';
import 'package:trustdeveopmenttask/features/product/domain/entity/product_entities.dart';
import 'package:flutter/material.dart';
import 'circle_icon.dart';
import 'package:flutter/material.dart';

class CircleIcon extends StatelessWidget {
  final IconData icon;
  final Color? color;

  const CircleIcon({super.key, required this.icon, this.color});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(6),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(color: Colors.grey),
      ),
      child: Icon(icon, size: 16, color: color ?? Colors.black),
    );
  }
}

class ProductInfoSection extends StatelessWidget {
  const ProductInfoSection(
      {super.key, required this.nameProduct, required this.priceProduct});

  final String nameProduct;
  final double priceProduct;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Text(
            '$nameProduct',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
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
                  CircleIcon(icon: Icons.add, color: Colors.red),
                ],
              ),
              const Spacer(),
              Text(
                '$priceProduct',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
