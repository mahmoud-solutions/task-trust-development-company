import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trustdeveopmenttask/core/errors/failures.dart';
import 'package:trustdeveopmenttask/features/cart%20screen/domain/UseCase/addToCart/add_to_cart_usecase.dart';
import 'package:trustdeveopmenttask/features/cart%20screen/domain/UseCase/ensure_guest_session_use_case.dart';
import 'package:trustdeveopmenttask/features/cart%20screen/domain/entity/AddToCartEntity/add_to_cart_entity.dart';
import 'package:trustdeveopmenttask/features/cart%20screen/presention/AddToCartCubit/cubit/addto_cart_state.dart';

class AddTOCartCubit extends Cubit<AddToCartState> {
  final AddProductToCartUseCase addToCartUseCase;
  final EnsureGuestSessionUseCase ensureGuestSessionUseCase;

  AddTOCartCubit(
    this.addToCartUseCase,
    this.ensureGuestSessionUseCase,
  ) : super(AddToCartInitial());

  Future<String?> getCurrentGuestSession() async {
    try {
      final guestId = await ensureGuestSessionUseCase();
      return guestId;
    } catch (e) {
      return null;
    }
  }

  Future<void> addToCart(AddToCartEntity entity) async {
    emit(AddToCartLoading(entity.productId));
    try {
      final guestId = await ensureGuestSessionUseCase();
      await addToCartUseCase(entity, guestId);
      emit(AddToCartSuccess(guestId, entity.productId));
    } on Failure catch (failure) {
      emit(AddToCartError(failure.message, entity.productId));
    } catch (e) {
      String errorMessage = 'حدث خطأ أثناء إضافة المنتج للسلة';
      if (e.toString().contains('Failed to add product to cart')) {
        errorMessage = 'فشل إضافة المنتج للسلة. يرجى المحاولة مرة أخرى';
      } else if (e.toString().contains('No Internet Connection')) {
        errorMessage = 'لا يوجد اتصال بالإنترنت';
      } else if (e.toString().contains('timeout')) {
        errorMessage = 'انتهت مهلة الاتصال. يرجى المحاولة مرة أخرى';
      } else if (e.toString().isNotEmpty) {
        errorMessage = 'خطأ: ${e.toString()}';
      }
      emit(AddToCartError(errorMessage, entity.productId));
    }
  }
}
