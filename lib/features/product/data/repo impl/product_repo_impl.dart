import 'package:dartz/dartz.dart';
import 'package:trustdeveopmenttask/core/errors/failures.dart';
import 'package:trustdeveopmenttask/core/services/server_exp.dart';
import 'package:trustdeveopmenttask/features/product/data/data%20source/product_remote_data_source.dart';
import 'package:trustdeveopmenttask/features/product/data/model/product_details_model_response/product_details_model_response.dart';
import 'package:trustdeveopmenttask/features/product/domain/category%20repo/repo_product_and_category.dart';
import 'package:trustdeveopmenttask/features/product/domain/entity/category_entities.dart';
import 'package:trustdeveopmenttask/features/product/domain/entity/modelToentity/adonmodel.dart';
import 'package:trustdeveopmenttask/features/product/domain/entity/product_adons.dart';
import 'package:trustdeveopmenttask/features/product/domain/entity/product_entities.dart';

class ProductRepositoryImpl implements ProductRepository {
  final ProductRemoteDataSource remoteDataSource;

  ProductRepositoryImpl({required this.remoteDataSource});

  @override
  Future<Either<Failure, List<CategoryEntity>>> getCategories() async {
    try {
      final categories = await remoteDataSource.getCategories();
      return Right(categories.map((model) => model.toEntity()).toList());
    } on ServerException catch (e) {
      return Left(ServerFailure(e.message));
    } catch (e) {
      return Left(ServerFailure('Unexpected error: ${e.toString()}'));
    }
  }

  @override
  Future<Either<Failure, ProductEntity>> getProductById(int id) async {
    try {
      final categories = await remoteDataSource.getCategories();

      for (var category in categories) {
        for (var product in category.products) {
          if (product.id == id) {
            return Right(product.toEntity());
          }
        }
      }

      return Left(NotFoundFailure('Product not found'));
    } on ServerException catch (e) {
      return Left(ServerFailure(e.message));
    } catch (e) {
      return Left(ServerFailure('Unexpected error: ${e.toString()}'));
    }
  }

  @override
  Future<Either<Failure, List<ProductEntity>>> getProductsByCategory(
      int categoryId) async {
    try {
      final products = await remoteDataSource.getProductsByCategory(categoryId);

      if (products.isEmpty) {
        return Left(NotFoundFailure('No products found for this category'));
      }

      return Right(products.map((model) => model.toEntity()).toList());
    } on ServerException catch (e) {
      return Left(ServerFailure(e.message));
    } catch (e) {
      return Left(ServerFailure('Unexpected error: ${e.toString()}'));
    }
  }

  @override
  Future<Either<Failure, ProductDetailsModelResponse>> getProductDetails(
      int productId) async {
    try {
      final product = await remoteDataSource.getProductDetails(productId);
      return Right(product);
    } on ServerException catch (e) {
      return Left(ServerFailure(e.message));
    } catch (e) {
      return Left(
          ServerFailure('Failed to fetch product details: ${e.toString()}'));
    }
  }

  @override
  Future<List<AddonEntity>> getProductAddons(String productId) async {
    final List<AddonModel> addonsModel =
        await remoteDataSource.getProductAddons(productId);
    return addonsModel.map((model) => model.toEntity()).toList();
  }
}

class NotFoundFailure extends Failure {
  NotFoundFailure(String message) : super(message);
}
