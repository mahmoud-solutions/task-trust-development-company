import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trustdeveopmenttask/features/product/domain/usecase/get_product_adons_usecase.dart';
import 'package:trustdeveopmenttask/features/product/presention/AdonsCubit/cubit/addon_cubit_state.dart';

class AddonCubit extends Cubit<AddonState> {
  final GetProductAddonsUseCase getProductAddonsUseCase;

  AddonCubit(this.getProductAddonsUseCase) : super(AddonInitial());

  Future<void> fetchAddons(String productId) async {
    emit(AddonLoading());
    try {
      final addons = await getProductAddonsUseCase(productId);
      emit(AddonLoaded(addons));
    } catch (e) {
      emit(AddonError(e.toString()));
    }
  }
}
