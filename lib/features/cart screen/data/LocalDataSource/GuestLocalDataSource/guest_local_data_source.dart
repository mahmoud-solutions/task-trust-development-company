import 'package:trustdeveopmenttask/core/services/shered_prefs.dart';

abstract class GuestLocalDataSource {
  String? getCachedGuestId();
  Future<void> cacheGuestId(String guestId);
}

class GuestLocalDataSourceImpl implements GuestLocalDataSource {
  static const String guestKey = 'guest_id';

  @override
  String? getCachedGuestId() {
    final id = Prefs.getString(guestKey);
    return id.isEmpty ? null : id;
  }

  @override
  Future<void> cacheGuestId(String guestId) async {
    await Prefs.setString(guestKey, guestId);
  }
}
