import 'package:trustdeveopmenttask/features/cart%20screen/domain/entity/guestidentity/guest_id.dart';

class GuestModel extends GuestEntity {
  const GuestModel({required super.guestId});

  factory GuestModel.fromJson(Map<String, dynamic> json) {
    return GuestModel(
      guestId: json['guest_id'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'guest_id': guestId,
    };
  }
}
