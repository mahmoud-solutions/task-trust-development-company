import 'package:dio/dio.dart';
import 'package:trustdeveopmenttask/core/errors/failures.dart';
import 'package:trustdeveopmenttask/features/cart%20screen/data/model/AddToCart/add_to_cart_response.dart';
import 'package:trustdeveopmenttask/features/cart%20screen/data/model/GetCartModel/cart_respose/cart_respose.dart';
import 'package:trustdeveopmenttask/features/cart%20screen/data/model/guest_model/guest_id_model.dart';

abstract class CartRemoteDataSource {
  Future<GuestModel> getGuestId();
  Future<CartResponseModel> getCart(String guestId);
  Future<void> addProductToCart(
    AddToCartItemModel item,
    String guestId,
  );
}

class CartRemoteDataSourceImpl implements CartRemoteDataSource {
  final Dio dio;

  CartRemoteDataSourceImpl(this.dio);

  @override
  Future<GuestModel> getGuestId() async {
    try {
      final response = await dio.get(
        'https://dushkaburger.com/wp-json/guestcart/v1/guestid',
      );

      return GuestModel.fromJson(response.data);
    } on DioException catch (e) {
      throw ServerFailure.fromDiorError(e);
    } on FormatException catch (e) {
      throw ServerFailure('Invalid response format: ${e.message}');
    } on TypeError catch (e) {
      throw ServerFailure('Data type error: ${e.toString()}');
    } catch (e) {
      throw ServerFailure('Failed to get guest ID: ${e.toString()}');
    }
  }

  @override
  Future<CartResponseModel> getCart(String guestId) async {
    try {
      final response = await dio.get(
        'https://dushkaburger.com/wp-json/guestcart/v1/cart',
        queryParameters: {'guest_id': guestId},
      );

      return CartResponseModel.fromJson(response.data);
    } on DioException catch (e) {
      throw ServerFailure.fromDiorError(e);
    } on FormatException catch (e) {
      throw ServerFailure('Invalid cart response format: ${e.message}');
    } on TypeError catch (e) {
      throw ServerFailure('Cart data type error: ${e.toString()}');
    } catch (e) {
      throw ServerFailure('Failed to get cart: ${e.toString()}');
    }
  }

  @override
  Future<void> addProductToCart(
    AddToCartItemModel item,
    String guestId,
  ) async {
    try {
      await dio.post(
        'https://dushkaburger.com/wp-json/guestcart/v1/cart',
        data: {
          "guest_id": guestId,
          "items": [item.toJson()],
        },
      );
    } on DioException catch (e) {
      throw ServerFailure.fromDiorError(e);
    } on FormatException catch (e) {
      throw ServerFailure('Invalid response format: ${e.message}');
    } on TypeError catch (e) {
      throw ServerFailure('Data type error: ${e.toString()}');
    } catch (e) {
      if (e is ServerFailure) {
        rethrow;
      }
      throw ServerFailure('Failed to add product to cart: ${e.toString()}');
    }
  }
}
