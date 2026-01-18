// lib/features/products/domain/usecases/get_categories.dart
import 'package:dartz/dartz.dart';
import 'package:trustdeveopmenttask/core/errors/failures.dart';
import 'package:trustdeveopmenttask/features/product/domain/category%20repo/repo_product_and_category.dart';
import 'package:trustdeveopmenttask/features/product/domain/entity/category_entities.dart';

class GetCategoriesUseCse {
  final ProductRepository repository;

  GetCategoriesUseCse(this.repository);

  Future<Either<Failure, List<CategoryEntity>>> call() async {
    return await repository.getCategories();
  }
}
