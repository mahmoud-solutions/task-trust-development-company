import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trustdeveopmenttask/features/cart%20screen/domain/entity/AddToCartEntity/add_to_cart_entity.dart';
import 'package:trustdeveopmenttask/features/cart%20screen/presention/AddToCartCubit/cubit/addto_cart_cubit.dart';
import 'package:trustdeveopmenttask/features/cart%20screen/presention/AddToCartCubit/cubit/addto_cart_state.dart';
import 'package:trustdeveopmenttask/features/cart%20screen/presention/GetCartCubit/cubit/cart_cubit.dart';
import 'package:trustdeveopmenttask/features/product/domain/entity/product_entities.dart';

class BottomNaavigationBar extends StatelessWidget {
  final ProductEntity productEntity;
  final int quantity;
  final List<Map<String, dynamic>>? selectedAddons;

  const BottomNaavigationBar({
    super.key,
    required this.productEntity,
    this.quantity = 1,
    this.selectedAddons,
  });

  void _addToCart(BuildContext context) {
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
        if (state is AddToCartSuccess && state.productId == productEntity.id) {
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
        return GestureDetector(
          onTap: isLoading ? null : () => _addToCart(context),
          child: Container(
            height: 70,
            margin: const EdgeInsets.all(16),
            padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 24),
            decoration: BoxDecoration(
              color: isLoading
                  ? Colors.grey.shade300
                  : Colors.pink.shade100,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Center(
              child: isLoading
                  ? const SizedBox(
                      height: 20,
                      width: 20,
                      child: CircularProgressIndicator(
                        strokeWidth: 2,
                        color: Colors.white,
                      ),
                    )
                  : const Text(
                      'أضف إلى السلة',
                      style: TextStyle(
                        color: Colors.black87,
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
