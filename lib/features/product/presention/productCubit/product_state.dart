// lib/features/product/presention/productCubit/product_state.dart
part of 'product_cubit.dart';

abstract class ProductState extends Equatable {
  const ProductState();

  @override
  List<Object> get props => [];
}

class ProductInitial extends ProductState {}

class ProductLoading extends ProductState {}

class ProductError extends ProductState {
  final String message;

  const ProductError(this.message);

  @override
  List<Object> get props => [message];
}

class ProductDataLoaded extends ProductState {
  final List<CategoryEntity> categories;
  final List<ProductEntity> products;

  const ProductDataLoaded({
    required this.categories,
    required this.products,
  });

  @override
  List<Object> get props => [categories, products];
}
