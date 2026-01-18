import 'package:flutter/material.dart';

class ProdactDetailsAppBar extends StatelessWidget {
  const ProdactDetailsAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Row(
          children: [
            // الشمال - سلة
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.shopping_cart),
            ),

            const Spacer(),

            // النص في المنتصف
            const Text(
              'تفاصيل المنتج',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),

            const Spacer(),

            // اليمين - رجوع
            InkWell(
              onTap: () => Navigator.pop(context),
              child: Row(
                children: const [
                  Text('رجوع'),
                  SizedBox(width: 6),
                  Icon(Icons.arrow_forward),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
