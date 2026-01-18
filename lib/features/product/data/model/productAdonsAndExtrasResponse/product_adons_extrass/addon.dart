import 'package:equatable/equatable.dart';
import 'package:trustdeveopmenttask/features/product/domain/entity/product_adons.dart';

import 'min_max_rules.dart';
import 'option.dart';

class Addon extends Equatable {
  final String id;
  final String title;
  final String titleAr;
  final MinMaxRules? minMaxRules;
  final bool required;
  final bool isMultiChoice;
  final List<Option>? options;

  const Addon({
    required this.id,
    required this.title,
    required this.titleAr,
    this.minMaxRules,
    required this.required,
    required this.isMultiChoice,
    this.options,
  });

  factory Addon.fromJson(Map<String, dynamic> json) => Addon(
        id: json['id'] as String? ?? '',
        title: json['title'] as String? ?? '',
        titleAr: json['title_ar'] as String? ?? '',
        minMaxRules: json['min_max_rules'] == null
            ? null
            : MinMaxRules.fromJson(
                json['min_max_rules'] as Map<String, dynamic>),
        required: json['required'] as bool? ?? false,
        isMultiChoice: json['IsMultiChoise'] as bool? ?? false,
        options: (json['options'] as List<dynamic>?)
            ?.map((e) => Option.fromJson(e as Map<String, dynamic>))
            .toList(),
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'title': title,
        'title_ar': titleAr,
        'min_max_rules': minMaxRules?.toJson(),
        'required': required,
        'IsMultiChoise': isMultiChoice,
        'options': options?.map((e) => e.toJson()).toList(),
      };

  AddonEntity toEntity() {
    return AddonEntity(
      id: id,
      title: title,
      titleAr: titleAr,
      required: required,
      isMultiChoice: isMultiChoice,
    );
  }

  @override
  List<Object?> get props => [
        id,
        title,
        titleAr,
        minMaxRules,
        required,
        isMultiChoice,
        options,
      ];
}
