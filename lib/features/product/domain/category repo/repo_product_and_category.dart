// lib/features/products/domain/repositories/product_repository.dart
import 'package:dartz/dartz.dart';
import 'package:trustdeveopmenttask/core/errors/failures.dart';
import 'package:trustdeveopmenttask/features/product/data/model/product_details_model_response/product_details_model_response.dart';
import 'package:trustdeveopmenttask/features/product/domain/entity/category_entities.dart';
import 'package:trustdeveopmenttask/features/product/domain/entity/product_adons.dart';
import 'package:trustdeveopmenttask/features/product/domain/entity/product_entities.dart';

abstract class ProductRepository {
  Future<Either<Failure, List<CategoryEntity>>> getCategories();
  Future<Either<Failure, ProductEntity>> getProductById(int id);
  Future<Either<Failure, List<ProductEntity>>> getProductsByCategory(
      int categoryId);
  Future<Either<Failure, ProductDetailsModelResponse>> getProductDetails(
      int productId);
  Future<List<AddonEntity>> getProductAddons(String productId);
}
