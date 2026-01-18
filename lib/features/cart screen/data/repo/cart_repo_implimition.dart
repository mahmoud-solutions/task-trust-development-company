import 'package:dartz/dartz.dart';
import 'package:trustdeveopmenttask/core/errors/failures.dart';
import 'package:trustdeveopmenttask/features/cart%20screen/data/LocalDataSource/GuestLocalDataSource/guest_local_data_source.dart';
import 'package:trustdeveopmenttask/features/cart%20screen/data/RemoteDataSource/guestRemoteDataSource/cart_remote_data_source.dart';
import 'package:trustdeveopmenttask/features/cart%20screen/data/model/AddToCart/add_to_cart_response.dart';
import 'package:trustdeveopmenttask/features/cart%20screen/domain/entity/AddToCartEntity/add_to_cart_entity.dart';
import 'package:trustdeveopmenttask/features/cart%20screen/domain/entity/cartResponseEntity/cart_response_entity.dart';
import 'package:trustdeveopmenttask/features/cart%20screen/domain/entity/guestidentity/guest_id.dart';
import 'package:trustdeveopmenttask/features/cart%20screen/domain/repo/cart_repo.dart';

class CartRepositoryImpl implements CartRepository {
  final CartRemoteDataSource remoteDataSource;
  final GuestLocalDataSource localDataSource;

  CartRepositoryImpl({
    required this.remoteDataSource,
    required this.localDataSource,
  });

  @override
  Future<Either<Failure, GuestEntity>> getGuestId() async {
    try {
      final cachedId = localDataSource.getCachedGuestId();
      if (cachedId != null) {
        return Right(GuestEntity(guestId: cachedId));
      }

      final guestModel = await remoteDataSource.getGuestId();

      await localDataSource.cacheGuestId(guestModel.guestId);

      return Right(guestModel);
    } on Failure catch (failure) {
      return Left(failure);
    } catch (e) {
      return Left(
          ServerFailure('Failed to get guest session: ${e.toString()}'));
    }
  }

  @override
  Future<CartResponseEntity> getCart(String guestId) async {
    try {
      return await remoteDataSource.getCart(guestId);
    } on Failure catch (failure) {
      rethrow;
    } catch (e) {
      throw ServerFailure('Failed to get cart: ${e.toString()}');
    }
  }

  @override
  Future<void> addProductToCart(AddToCartEntity entity, String guestId) async {
    try {
      final model = AddToCartItemModel(
        productId: entity.productId,
        quantity: entity.quantity,
        addons: entity.addons,
      );

      await remoteDataSource.addProductToCart(model, guestId);
    } on Failure catch (failure) {
      rethrow;
    } catch (e) {
      throw ServerFailure('Failed to add product to cart: ${e.toString()}');
    }
  }
}
