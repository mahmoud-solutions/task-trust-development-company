import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:trustdeveopmenttask/core/routing/app_router.dart';
import 'package:trustdeveopmenttask/features/cart%20screen/domain/entity/AddToCartEntity/add_to_cart_entity.dart';
import 'package:trustdeveopmenttask/features/cart%20screen/presention/AddToCartCubit/cubit/addto_cart_cubit.dart';
import 'package:trustdeveopmenttask/features/cart%20screen/presention/AddToCartCubit/cubit/addto_cart_state.dart';
import 'package:trustdeveopmenttask/features/product/domain/entity/product_entities.dart';
import 'package:trustdeveopmenttask/features/product/presention/cubit/gest_cubit.dart';

class BottomNavigationBarAddToCart extends StatelessWidget {
  final ProductEntity productEntity;
  final int quantity;
  final List<Map<String, dynamic>>? selectedAddons;

  const BottomNavigationBarAddToCart({
    super.key,
    required this.productEntity,
    this.quantity = 1,
    this.selectedAddons,
  });

  void _addToCart(BuildContext context) {
    final guestId = context.read<GuestIdCubit>().guestId;

    if (guestId == null || guestId.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('جاري تحميل معلومات الجلسة...')),
      );
      context.read<GuestIdCubit>().loadGuestId();
      GoRouter.of(context).go(AppRouter.cartScreen);
      return;
    }

    final addToCartEntity = AddToCartEntity(
      productId: productEntity.id,
      quantity: quantity,
      addons: selectedAddons,
    );

    context.read<AddTOCartCubit>().addToCart(addToCartEntity);
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AddTOCartCubit, AddToCartState>(
      listener: (context, state) {
        if (state is AddToCartSuccess) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('تمت الإضافة للسلة بنجاح ✓'),
              backgroundColor: Colors.green,
            ),
          );
        } else if (state is AddToCartError) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text('خطأ: ${state.message}'),
              backgroundColor: Colors.red,
            ),
          );
        }
      },
      builder: (context, state) {
        return GestureDetector(
          onTap: state is AddToCartLoading ? null : () => _addToCart(context),
          child: Container(
            height: 70,
            margin: const EdgeInsets.all(16),
            padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 24),
            decoration: BoxDecoration(
              color: state is AddToCartLoading
                  ? Colors.grey
                  : Colors.red.withOpacity(0.7),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Center(
              child: state is AddToCartLoading
                  ? const SizedBox(
                      height: 20,
                      width: 20,
                      child: CircularProgressIndicator(
                        strokeWidth: 2,
                        color: Colors.white,
                      ),
                    )
                  : const Text(
                      'اضف الى السلة',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
            ),
          ),
        );
      },
    );
  }
}
