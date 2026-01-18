import 'package:equatable/equatable.dart';

class AddonEntity extends Equatable {
  final String id;
  final String title;
  final String titleAr;
  final bool required;
  final bool isMultiChoice;

  const AddonEntity({
    required this.id,
    required this.title,
    required this.titleAr,
    required this.required,
    required this.isMultiChoice,
  });

  @override
  List<Object?> get props => [
        id,
        title,
        titleAr,
        required,
        isMultiChoice,
      ];
}
