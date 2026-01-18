import 'package:trustdeveopmenttask/features/cart%20screen/domain/entity/AddToCartEntity/add_to_cart_entity.dart';
import 'package:trustdeveopmenttask/features/cart%20screen/domain/repo/cart_repo.dart';

class AddProductToCartUseCase {
  final CartRepository repository;

  AddProductToCartUseCase(this.repository);

  Future<void> call(AddToCartEntity entity, String guestId) async {
    await repository.addProductToCart(entity, guestId);
  }
}
