import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trustdeveopmenttask/features/cart%20screen/domain/UseCase/get%20guest/get_guest_id.dart';

class GuestIdCubit extends Cubit<String?> {
  final GetGuestIdUseCase getGuestIdUseCase;

  GuestIdCubit(this.getGuestIdUseCase) : super(null);

  Future<void> loadGuestId() async {
    final result = await getGuestIdUseCase();
    result.fold(
      (failure) => emit(null),
      (guestEntity) => emit(guestEntity.guestId),
    );
  }

  String? get guestId => state;
}
