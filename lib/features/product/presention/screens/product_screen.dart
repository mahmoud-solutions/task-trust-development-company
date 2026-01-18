import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trustdeveopmenttask/core/services/service_locator.dart';
import 'package:trustdeveopmenttask/features/navigation%20bar/naviagation_bar.dart';
import 'package:trustdeveopmenttask/features/product/presention/productCubit/product_cubit.dart';
import 'package:trustdeveopmenttask/features/product/presention/screens/widges/product_screen_body.dart';

class ProductPage extends StatelessWidget {
  const ProductPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: const NavigationBarr(),
      appBar: AppBar(title: const Text('المنتجات')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: BlocProvider<ProductCubit>(
          create: (_) => sl<ProductCubit>()..loadCategoriesAndFirstProducts(),
          child: const ProductScreenBody(),
        ),
      ),
    );
  }
}
