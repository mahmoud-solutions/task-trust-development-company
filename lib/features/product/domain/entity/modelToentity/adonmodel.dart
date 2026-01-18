import 'package:trustdeveopmenttask/features/product/domain/entity/product_adons.dart';

class AddonModel extends AddonEntity {
  AddonModel({
    required super.id,
    required super.title,
    required super.titleAr,
    required super.required,
    required super.isMultiChoice,
  });

  factory AddonModel.fromJson(Map<String, dynamic> json) {
    return AddonModel(
      id: json['id'].toString(),
      title: json['title'] ?? '',
      titleAr: json['title_ar'] ?? '',
      required: json['required'] ?? false,
      isMultiChoice: json['IsMultiChoise'] ?? false,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'title_ar': titleAr,
      'required': required,
      'IsMultiChoise': isMultiChoice,
    };
  }

  // هنا دالة toEntity الطبيعية
  AddonEntity toEntity() {
    return AddonEntity(
      id: id,
      title: title,
      titleAr: titleAr,
      required: required,
      isMultiChoice: isMultiChoice,
    );
  }
}
