import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trustdeveopmenttask/core/services/service_locator.dart';
import 'package:trustdeveopmenttask/core/widgets/Bottom_navigation_bar.dart';
import 'package:trustdeveopmenttask/features/product/domain/entity/product_entities.dart';

import 'package:trustdeveopmenttask/features/product/presention/AdonsCubit/cubit/addon_cubit_cubit.dart';
import 'package:trustdeveopmenttask/features/product/presention/AdonsCubit/cubit/addon_cubit_state.dart';

import 'package:trustdeveopmenttask/features/product/presention/productDetailsCubit/cubit/product_details_cubit.dart';
import 'package:trustdeveopmenttask/features/product/presention/productDetailsCubit/cubit/product_details_state.dart';

import 'widgets/prodact_appbar.dart';
import 'widgets/prodact_screen_body.dart';

class ProdactDetailsScreen extends StatelessWidget {
  /// 🔹 الـ Entity اللي جاية من شاشة الليست
  final ProductEntity product;

  const ProdactDetailsScreen({
    super.key,
    required this.product,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(60),
        child: ProdactDetailsAppBar(),
      ),
      body: SingleChildScrollView(
        child: MultiBlocProvider(
          providers: [
            BlocProvider<ProductDetailsCubit>(
              create: (_) =>
                  ProductDetailsCubit(sl())..fetchProduct(product.id),
            ),
            BlocProvider<AddonCubit>(
              create: (_) => AddonCubit(sl()),
            ),
          ],
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              BlocListener<ProductDetailsCubit, ProductDetailsState>(
                listener: (context, state) {
                  if (state is ProductDetailsLoaded) {
                    context.read<AddonCubit>().fetchAddons(state.product.id!);
                  }
                },
                child: BlocBuilder<ProductDetailsCubit, ProductDetailsState>(
                  builder: (context, state) {
                    if (state is ProductDetailsLoading) {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    } else if (state is ProductDetailsLoaded) {
                      final detailsProduct = state.product;

                      return BlocBuilder<AddonCubit, AddonState>(
                        builder: (context, addonState) {
                          List<String> addonTitles = [];

                          if (addonState is AddonLoaded) {
                            addonTitles =
                                addonState.addons.map((e) => e.title).toList();
                          }

                          return CartScreenBody(
                            imageProduct: detailsProduct.image ?? '',
                            nameProduct: detailsProduct.nameAr ?? product.name,
                            descriptionProduct: detailsProduct.descriptionAr ??
                                product.description,
                            price: double.tryParse(
                                  detailsProduct.price ?? '',
                                ) ??
                                product.price,
                            addonTitles: addonTitles,
                          );
                        },
                      );
                    } else if (state is ProductDetailsError) {
                      return Center(
                        child: Text(state.message),
                      );
                    } else {
                      return const SizedBox();
                    }
                  },
                ),
              ),
              const SizedBox(height: 20),
              BlocBuilder<AddonCubit, AddonState>(
                builder: (context, state) {
                  if (state is AddonLoading) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  } else if (state is AddonLoaded) {
                    final addons = state.addons;

                    if (addons.isEmpty) {
                      return const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 8.0),
                        child: Text('لا يوجد إضافات'),
                      );
                    }

                    return ListView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: addons.length,
                      itemBuilder: (context, index) {
                        final addon = addons[index];
                        return Padding(
                          padding: const EdgeInsets.symmetric(
                            vertical: 4.0,
                            horizontal: 8,
                          ),
                          child: Text('- ${addon.title}'),
                        );
                      },
                    );
                  } else if (state is AddonError) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: Text(state.message),
                    );
                  }

                  return const SizedBox();
                },
              ),
            ],
          ),
        ),
      ),

      /// ✅ هنا الحل الصح
      bottomNavigationBar: BottomNavigationBarAddToCart(
        productEntity: product,
      ),
    );
  }
}
