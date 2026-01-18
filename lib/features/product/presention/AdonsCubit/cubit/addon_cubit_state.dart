import 'package:trustdeveopmenttask/features/product/domain/entity/product_adons.dart';

abstract class AddonState {}

class AddonInitial extends AddonState {}

class AddonLoading extends AddonState {}

class AddonLoaded extends AddonState {
  final List<AddonEntity> addons;
  AddonLoaded(this.addons);
}

class AddonError extends AddonState {
  final String message;
  AddonError(this.message);
}
