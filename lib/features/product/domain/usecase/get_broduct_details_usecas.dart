import 'package:dartz/dartz.dart';
import 'package:trustdeveopmenttask/core/errors/failures.dart';
import 'package:trustdeveopmenttask/features/product/data/model/product_details_model_response/product_details_model_response.dart';
import 'package:trustdeveopmenttask/features/product/domain/category%20repo/repo_product_and_category.dart';

class GetProductDetailsUseCase {
  final ProductRepository repository;

  GetProductDetailsUseCase(this.repository);

  Future<Either<Failure, ProductDetailsModelResponse>> call(
      int productId) async {
    return await repository.getProductDetails(productId);
  }
}
