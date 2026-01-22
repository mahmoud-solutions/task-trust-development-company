import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:trustdeveopmenttask/core/routing/app_router.dart';
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
                    print(
                        'Product: ${product.nameAr}, ID: ${product.id}'); // اتأكد ان ال id موجود
                    return InkWell(
                      onTap: () {
                        final productId = product.id;
                        if (productId != null) {
                          GoRouter.of(context).go(
                              AppRouter.prodactDetailsScreennnnnn,
                              extra: product);
                          print(
                              'product.id type: ${product.id.runtimeType}, value: ${product.id}');
                        } else {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text(
                                  'خطأ: لا يمكن فتح تفاصيل المنتج، ID غير موجود'),
                            ),
                          );
                        }
                      },
                      child: ProductItem(
                        productEntity: product,
                        name: product.nameAr ?? '',
                        price: product.price,
                        image: product.image,
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
        ),
      ],
    );
  }
}
