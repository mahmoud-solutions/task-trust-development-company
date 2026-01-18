import 'package:dartz/dartz.dart';
import 'package:trustdeveopmenttask/core/errors/failures.dart';
import 'package:trustdeveopmenttask/features/product/domain/category%20repo/repo_product_and_category.dart';
import 'package:trustdeveopmenttask/features/product/domain/entity/product_entities.dart';

class GetProductsByCategory {
  final ProductRepository repository;

  GetProductsByCategory(this.repository);

  Future<Either<Failure, List<ProductEntity>>> call(int categoryId) async {
    return await repository.getProductsByCategory(categoryId);
  }
}
