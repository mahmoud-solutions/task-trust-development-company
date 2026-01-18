import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trustdeveopmenttask/features/cart%20screen/domain/UseCase/get%20guest/get_guest_id.dart';
import 'package:trustdeveopmenttask/features/cart%20screen/presention/guesCubit/guest_cubit_state.dart';

class GuestCubit extends Cubit<GuestState> {
  final GetGuestIdUseCase getGuestIdUseCase;

  GuestCubit(this.getGuestIdUseCase) : super(GuestInitial());

  Future<void> getGuestId() async {
    emit(GuestLoading());

    final result = await getGuestIdUseCase();

    result.fold(
      (failure) => emit(GuestError(failure.message)),
      (guest) => emit(GuestSuccess(guest)),
    );
  }
}
