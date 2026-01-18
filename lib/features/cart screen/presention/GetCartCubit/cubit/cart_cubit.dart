import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:trustdeveopmenttask/core/errors/failures.dart';
import 'package:trustdeveopmenttask/features/cart%20screen/domain/UseCase/get_cart.dart/get_cart.dart';
import 'package:trustdeveopmenttask/features/cart%20screen/domain/entity/cartResponseEntity/cart_response_entity.dart';

part 'cart_state.dart';

class CartCubit extends Cubit<CartState> {
  CartCubit(this.getCartUseCase) : super(CartInitial());
  final GetCartUseCase getCartUseCase;
  Future<void> fetchCart(String guestId) async {
    emit(CartLoading());
    try {
      final cart = await getCartUseCase.call(guestId);
      emit(CartLoaded(cart));
    } on Failure catch (failure) {
      emit(CartError(failure.message));
    } catch (e) {
      emit(CartError('فشل تحميل السلة: ${e.toString()}'));
    }
  }
}
