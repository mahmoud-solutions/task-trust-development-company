import 'package:flutter/material.dart';
import 'package:trustdeveopmenttask/features/product/domain/entity/adons__entity.dart';

import 'extra_item.dart';
import 'package:flutter/material.dart';
import 'package:trustdeveopmenttask/features/product/domain/entity/adons__entity.dart';

import 'extra_item.dart';

class ExtrasSection extends StatelessWidget {
  final List<String> addons; // المتغير العام لكل الإضافات
  const ExtrasSection({super.key, required this.addons});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: addons.map((addon) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  const SizedBox(width: 8),
                  Text(
                    addon,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 12),
              ExtraItem(title: addon),
              const SizedBox(height: 16),
            ],
          );
        }).toList(),
      ),
    );
  }
}
