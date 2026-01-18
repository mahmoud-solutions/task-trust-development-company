import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trustdeveopmenttask/features/product/presention/productCubit/product_cubit.dart';
import 'package:trustdeveopmenttask/features/product/presention/screens/widges/product_itm.dart';
import 'package:trustdeveopmenttask/features/product/presention/screens/widges/top_categoiriez_section.dart';
import 'package:trustdeveopmenttask/features/product/presention/screens/widges/offer_title.dart';

class ProductScreenBody extends StatelessWidget {
  const ProductScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const TopCategoriesSection(),
        const SizedBox(height: 16),
        BlocBuilder<ProductCubit, ProductState>(
          builder: (context, state) {
            String offerTitle = 'عروض دوشكا برجر';
            if (state is ProductDataLoaded && state.products.isNotEmpty) {
              offerTitle = state.products.first.nameAr ?? offerTitle;
            }
            return OffersTitle(title: offerTitle);
          },
        ),
        const SizedBox(height: 16),
        Expanded(
          child: BlocBuilder<ProductCubit, ProductState>(
            builder: (context, state) {
              if (state is ProductLoading) {
                return const Center(child: CircularProgressIndicator());
              }
              if (state is ProductDataLoaded) {
                final products = state.products;
                if (products.isEmpty) return const SizedBox();
                return ListView.separated(
                  itemCount: products.length,
                  separatorBuilder: (_, __) => const SizedBox(height: 12),
                  itemBuilder: (context, index) {
                    final product = products[index];
                    return ProductItem(
                      productEntity: product,
                      name: product.nameAr ?? '',
                      price: product.price,
                      image: product.image,
                    );
                  },
                );
              }
              if (state is ProductError) {
                return Center(child: Text(state.message));
              }
              return const SizedBox();
            },
          ),
        ),
      ],
    );
  }
}
