import 'package:dartz/dartz.dart';
import 'package:trustdeveopmenttask/core/errors/failures.dart';
import 'package:trustdeveopmenttask/features/cart%20screen/domain/entity/guestidentity/guest_id.dart';
import 'package:trustdeveopmenttask/features/cart%20screen/domain/repo/cart_repo.dart';

class GetGuestIdUseCase {
  final CartRepository repository;

  GetGuestIdUseCase(this.repository);

  Future<Either<Failure, GuestEntity>> call() async {
    return await repository.getGuestId();
  }
}
