import 'package:flutter/material.dart';
import 'package:trustdeveopmenttask/features/prodact%20details%20screen/widgets/bottom_navigation_bar.dart';
import 'package:trustdeveopmenttask/features/prodact%20details%20screen/widgets/prodact_appbar.dart';
import 'package:trustdeveopmenttask/features/prodact%20details%20screen/widgets/prodact_screen_body.dart';
import 'package:trustdeveopmenttask/features/product/domain/entity/product_entities.dart';

class ProdactDetailsScreen extends StatefulWidget {
  const ProdactDetailsScreen({super.key, required this.productEntity});
  final ProductEntity productEntity;

  @override
  State<ProdactDetailsScreen> createState() => _ProdactDetailsScreenState();
}

class _ProdactDetailsScreenState extends State<ProdactDetailsScreen> {
  int quantity = 1;
  List<Map<String, dynamic>>? selectedAddons;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(60),
        child: ProdactDetailsAppBar(),
      ),
      body: SingleChildScrollView(
        child: CartScreenBody(
          productEntity: widget.productEntity,
        ),
      ),
      bottomNavigationBar: BottomNaavigationBar(
        productEntity: widget.productEntity,
        quantity: quantity,
        selectedAddons: selectedAddons,
      ),
    );
  }
}
