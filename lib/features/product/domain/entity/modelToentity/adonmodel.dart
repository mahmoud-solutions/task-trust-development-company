import 'package:trustdeveopmenttask/features/product/domain/entity/adons__entity.dart';

class AddonDomainModel extends AddonEntity {
  const AddonDomainModel({
    required super.id,
    required super.title,
    required super.titleAr,
    required super.isRequired,
    required super.isMultiChoice,
  });

  factory AddonDomainModel.fromJson(Map<String, dynamic> json) {
    return AddonDomainModel(
      id: json['id'].toString(),
      title: json['title'] ?? '',
      titleAr: json['title_ar'] ?? '',
      isRequired: json['required'] ?? false,
      isMultiChoice: json['is_multi_choice'] ?? false,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'title_ar': titleAr,
      'required': isRequired,
      'is_multi_choice': isMultiChoice,
    };
  }

  // 🔹 هنا الدالة اللي ناقصة
  AddonEntity toEntity() {
    return AddonEntity(
      id: id,
      title: title,
      titleAr: titleAr,
      isRequired: isRequired,
      isMultiChoice: isMultiChoice,
    );
  }
}
