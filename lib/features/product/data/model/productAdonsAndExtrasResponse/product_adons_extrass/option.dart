import 'package:equatable/equatable.dart';
// file: option.dart

class Option extends Equatable {
  final bool? selectedByDefault;
  final bool? isRequired;
  final bool? addonEnabled;
  final String? label;
  final String? labelAr;
  final String? price;
  final String? priceType;
  final String? priceMethod;

  const Option({
    this.selectedByDefault,
    this.isRequired,
    this.addonEnabled,
    this.label,
    this.labelAr,
    this.price,
    this.priceType,
    this.priceMethod,
  });

  factory Option.fromJson(Map<String, dynamic> json) => Option(
        selectedByDefault: json['selected_by_default'] as bool?,
        isRequired: json['required'] as bool?,
        addonEnabled: json['addon_enabled'] as bool?,
        label: json['label'] as String?,
        labelAr: json['label_ar'] as String?,
        price: json['price'] as String?,
        priceType: json['price_type'] as String?,
        priceMethod: json['price_method'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'selected_by_default': selectedByDefault,
        'required': isRequired,
        'addon_enabled': addonEnabled,
        'label': label,
        'label_ar': labelAr,
        'price': price,
        'price_type': priceType,
        'price_method': priceMethod,
      };

  @override
  List<Object?> get props =>
      [selectedByDefault, isRequired, addonEnabled, label, labelAr, price];
}
