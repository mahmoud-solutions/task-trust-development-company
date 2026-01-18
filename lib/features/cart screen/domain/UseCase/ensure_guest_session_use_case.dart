import 'package:trustdeveopmenttask/features/cart%20screen/domain/repo/cart_repo.dart';

class EnsureGuestSessionUseCase {
  final CartRepository repository;

  EnsureGuestSessionUseCase(this.repository);

  Future<String> call() async {
    final result = await repository.getGuestId();

    return result.fold(
      (failure) => throw failure,
      (guest) => guest.guestId,
    );
  }
}
