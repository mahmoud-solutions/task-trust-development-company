// domain/usecases/get_product_addons_usecase.dart

import 'package:trustdeveopmenttask/features/product/domain/category%20repo/repo_product_and_category.dart';
import 'package:trustdeveopmenttask/features/product/domain/entity/product_adons.dart';

class GetProductAddonsUseCase {
  final ProductRepository repository;

  GetProductAddonsUseCase(this.repository);

  Future<List<AddonEntity>> call(String productId) async {
    return await repository.getProductAddons(productId);
  }
}
