import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trustdeveopmenttask/features/product/presention/productCubit/product_cubit.dart';
import 'package:trustdeveopmenttask/features/product/presention/screens/widges/catgory_item.dart';

class TopCategoriesSection extends StatelessWidget {
  const TopCategoriesSection({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 80,
      child: BlocBuilder<ProductCubit, ProductState>(
        builder: (context, state) {
          if (state is ProductDataLoaded) {
            final categories = state.categories;

            if (categories.isEmpty) return const SizedBox();

            return ListView.separated(
              scrollDirection: Axis.horizontal,
              reverse: true,
              itemCount: categories.length,
              separatorBuilder: (_, __) => const SizedBox(width: 12),
              itemBuilder: (context, index) {
                final category = categories[index];

                return GestureDetector(
                  onTap: () {
                    context
                        .read<ProductCubit>()
                        .loadProductsByCategory(category.id);
                  },
                  child: CategoryItem(
                    title: category.nameAr,
                    imageUrl: category.image.isNotEmpty
                        ? category.image
                        : 'https://via.placeholder.com/70',
                  ),
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
    );
  }
}
