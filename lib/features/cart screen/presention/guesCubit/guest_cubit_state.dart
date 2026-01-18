import 'package:trustdeveopmenttask/features/cart%20screen/domain/entity/guestidentity/guest_id.dart';

abstract class GuestState {}

class GuestInitial extends GuestState {}

class GuestLoading extends GuestState {}

class GuestSuccess extends GuestState {
  final GuestEntity guest;

  GuestSuccess(this.guest);
}

class GuestError extends GuestState {
  final String message;

  GuestError(this.message);
}
