import 'package:flutter/material.dart';
import 'package:trustdeveopmenttask/features/prodact%20details%20screen/widgets/extra_item.dart';
import 'package:trustdeveopmenttask/features/product/domain/entity/product_adons.dart';

class ExtrasSection extends StatelessWidget {
  final List<AddonEntity> addons;

  const ExtrasSection({
    super.key,
    required this.addons,
  });

  @override
  Widget build(BuildContext context) {
    if (addons.isEmpty) {
      return const SizedBox.shrink();
    }

    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          ...addons.map((addon) => _buildAddonSection(addon)),
        ],
      ),
    );
  }

  Widget _buildAddonSection(AddonEntity addon) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            if (addon.required)
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                decoration: BoxDecoration(
                  color: Colors.red.shade100,
                  borderRadius: BorderRadius.circular(4),
                ),
                child: const Text(
                  'إجباري',
                  style: TextStyle(
                    fontSize: 12,
                    color: Colors.red,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            const SizedBox(width: 8),
            Text(
              addon.titleAr.isNotEmpty ? addon.titleAr : addon.title,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
        const SizedBox(height: 12),
        ExtraItem(
            title: addon.titleAr.isNotEmpty ? addon.titleAr : addon.title),
        const SizedBox(height: 16),
      ],
    );
  }
}
