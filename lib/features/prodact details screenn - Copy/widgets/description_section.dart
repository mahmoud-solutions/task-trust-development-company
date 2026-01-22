import 'package:flutter/material.dart';

class DescriptionSection extends StatelessWidget {
  const DescriptionSection({super.key, required this.description});
  final String description;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(16),
      child: Text(
        '$description',
        style: TextStyle(fontSize: 14),
      ),
    );
  }
}
