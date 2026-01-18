import 'package:flutter/material.dart';

class ExtraItem extends StatelessWidget {
  final String title;

  const ExtraItem({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Text(title),
        // الأيقونة (يمين)
        const SizedBox(width: 8),
        Container(
          width: 18,
          height: 18,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(color: Colors.grey),
          ),
        ),

        // النص
      ],
    );
  }
}
