import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:trustdeveopmenttask/core/routing/app_router.dart';
import 'package:trustdeveopmenttask/features/cart%20screen/domain/entity/AddToCartEntity/add_to_cart_entity.dart';
import 'package:trustdeveopmenttask/features/cart%20screen/presention/AddToCartCubit/cubit/addto_cart_cubit.dart';
import 'package:trustdeveopmenttask/features/cart%20screen/presention/AddToCartCubit/cubit/addto_cart_state.dart';
import 'package:trustdeveopmenttask/features/cart%20screen/presention/GetCartCubit/cubit/cart_cubit.dart';
import 'package:trustdeveopmenttask/features/product/domain/entity/product_entities.dart';

class ProductItem extends StatelessWidget {
  final String name;
  final double price;
  final String? image;
  final ProductEntity productEntity;

  const ProductItem({
    super.key,
    required this.name,
    required this.price,
    this.image,
    required this.productEntity,
  });

  void _addToCart(BuildContext context) {
    final addToCartEntity = AddToCartEntity(
      productId: productEntity.id,
      quantity: 1,
      addons: null,
    );

    context.read<AddTOCartCubit>().addToCart(addToCartEntity);
  }

  @override
  Widget build(BuildContext context) {
    const fallbackImage = 'https://via.placeholder.com/80';

    return GestureDetector(
      onTap: () {
        GoRouter.of(context).push(
          AppRouter.prodactDetailsScreennnnnn,
          extra: productEntity,
        );
      },
      child: Container(
        padding: const EdgeInsets.all(16),
        margin: const EdgeInsets.only(bottom: 12),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.05),
              blurRadius: 8,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Row(
          children: [
            GestureDetector(
              behavior: HitTestBehavior.opaque,
              onTap: () {},
              child: BlocConsumer<AddTOCartCubit, AddToCartState>(
                listener: (context, state) {
                  if (state is AddToCartSuccess &&
                      state.productId == productEntity.id) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('تمت الإضافة للسلة بنجاح ✓'),
                        backgroundColor: Colors.green,
                      ),
                    );
                    context.read<CartCubit>().fetchCart(state.guestId);
                  } else if (state is AddToCartError &&
                      state.productId == productEntity.id) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text('خطأ: ${state.message}'),
                        backgroundColor: Colors.red,
                      ),
                    );
                  }
                },
                builder: (context, state) {
                  final isLoading = state is AddToCartLoading &&
                      state.productId == productEntity.id;
                  return Container(
                    width: 44,
                    height: 44,
                    decoration: const BoxDecoration(
                      color: Colors.red,
                      shape: BoxShape.circle,
                    ),
                    child: isLoading
                        ? const Center(
                            child: SizedBox(
                              width: 20,
                              height: 20,
                              child: CircularProgressIndicator(
                                strokeWidth: 2,
                                valueColor: AlwaysStoppedAnimation<Color>(
                                  Colors.white,
                                ),
                              ),
                            ),
                          )
                        : IconButton(
                            padding: EdgeInsets.zero,
                            onPressed: () => _addToCart(context),
                            icon: const Icon(
                              Icons.add,
                              color: Colors.white,
                              size: 24,
                            ),
                          ),
                  );
                },
              ),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    name,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.black87,
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 8),
                  Text(
                    '$price ج.م',
                    style: TextStyle(
                      fontSize: 15,
                      color: Colors.grey.shade700,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(width: 16),
            ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Image.network(
                image != null && image!.isNotEmpty ? image! : fallbackImage,
                width: 90,
                height: 90,
                fit: BoxFit.cover,
                errorBuilder: (_, __, ___) => Container(
                  width: 90,
                  height: 90,
                  color: Colors.grey.shade200,
                  child: const Icon(
                    Icons.image_not_supported,
                    color: Colors.grey,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
