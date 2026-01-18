import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trustdeveopmenttask/features/product/domain/usecase/get_broduct_details_usecas.dart';
import 'package:trustdeveopmenttask/features/product/presention/productDetailsCubit/cubit/product_details_state.dart';

class ProductDetailsCubit extends Cubit<ProductDetailsState> {
  final GetProductDetailsUseCase getProductDetailsUseCase;

  ProductDetailsCubit(this.getProductDetailsUseCase)
      : super(ProductDetailsInitial());

  Future<void> fetchProduct(int productId) async {
    emit(ProductDetailsLoading());
    final result = await getProductDetailsUseCase(productId);
    result.fold(
      (failure) => emit(ProductDetailsError(failure.message)),
      (product) => emit(ProductDetailsLoaded(product)),
    );
  }
}
