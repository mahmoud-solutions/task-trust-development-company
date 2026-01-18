import 'package:trustdeveopmenttask/features/cart%20screen/domain/entity/cartResponseEntity/cart_response_entity.dart';
import 'package:trustdeveopmenttask/features/cart%20screen/domain/repo/cart_repo.dart';

class GetCartUseCase {
  final CartRepository repository;

  GetCartUseCase(this.repository);

  /// Executes the use case to fetch cart for a given guestId
  Future<CartResponseEntity> call(String guestId) {
    return repository.getCart(guestId);
  }
}
