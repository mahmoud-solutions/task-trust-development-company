import 'package:dartz/dartz.dart';
import 'package:trustdeveopmenttask/core/errors/failures.dart';
import 'package:trustdeveopmenttask/features/cart%20screen/domain/entity/AddToCartEntity/add_to_cart_entity.dart';
import 'package:trustdeveopmenttask/features/cart%20screen/domain/entity/cartResponseEntity/cart_response_entity.dart';
import 'package:trustdeveopmenttask/features/cart%20screen/domain/entity/guestidentity/guest_id.dart';

abstract class CartRepository {
  Future<Either<Failure, GuestEntity>> getGuestId();
  Future<CartResponseEntity> getCart(String guestId);
  Future<void> addProductToCart(AddToCartEntity entity, String guestId);
}
