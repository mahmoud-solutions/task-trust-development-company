// lib/features/product/presention/productCubit/product_cubit.dart
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:trustdeveopmenttask/core/errors/failures.dart';
import 'package:trustdeveopmenttask/features/product/data/repo%20impl/product_repo_impl.dart';
import 'package:trustdeveopmenttask/features/product/domain/entity/category_entities.dart';
import 'package:trustdeveopmenttask/features/product/domain/entity/product_entities.dart';
import 'package:trustdeveopmenttask/features/product/domain/usecase/get_category_usecase.dart';
import 'package:trustdeveopmenttask/features/product/domain/usecase/get_product_by_category.dart';

part 'product_state.dart';

class ProductCubit extends Cubit<ProductState> {
  final GetCategoriesUseCse getCategories;
  final GetProductsByCategory getProductsByCategoryUseCase;

  List<CategoryEntity> _categories = [];
  List<ProductEntity> _products = [];

  ProductCubit({
    required this.getCategories,
    required this.getProductsByCategoryUseCase,
  }) : super(ProductInitial());

  Future<void> loadCategories() async {
    emit(ProductLoading());
    final result = await getCategories();
    result.fold(
      (failure) => emit(ProductError(_mapFailureToMessage(failure))),
      (categories) {
        _categories = categories;
        emit(ProductDataLoaded(
          categories: _categories,
          products: _products,
        ));
      },
    );
  }

  Future<void> loadProductsByCategory(int categoryId) async {
    emit(ProductLoading());
    final result = await getProductsByCategoryUseCase(categoryId);
    result.fold(
      (failure) => emit(ProductError(_mapFailureToMessage(failure))),
      (products) {
        _products = products;
        emit(ProductDataLoaded(
          categories: _categories,
          products: _products,
        ));
      },
    );
  }

  Future<void> loadCategoriesAndFirstProducts() async {
    emit(ProductLoading());
    final categoriesResult = await getCategories();
    categoriesResult.fold(
      (failure) => emit(ProductError(_mapFailureToMessage(failure))),
      (categories) async {
        _categories = categories;
        if (_categories.isNotEmpty) {
          final firstCategoryId = _categories.first.id;
          final productsResult =
              await getProductsByCategoryUseCase(firstCategoryId);
          productsResult.fold(
            (failure) => emit(ProductError(_mapFailureToMessage(failure))),
            (products) {
              _products = products;
              emit(ProductDataLoaded(
                categories: _categories,
                products: _products,
              ));
            },
          );
        } else {
          emit(ProductDataLoaded(categories: _categories, products: _products));
        }
      },
    );
  }

  String getOfferTitle() {
    if (_products.isNotEmpty && _products.first.nameAr != null) {
      return _products.first.nameAr!;
    }
    return 'عروض دوشكا برجر';
  }

  String _mapFailureToMessage(Failure failure) {
    if (failure is ServerFailure) {
      return failure.message;
    } else if (failure is NotFoundFailure) {
      return failure.message;
    } else {
      return 'Unexpected error';
    }
  }
}
