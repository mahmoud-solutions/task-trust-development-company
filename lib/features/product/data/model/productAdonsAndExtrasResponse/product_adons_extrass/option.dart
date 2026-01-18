class Option {
  bool? selectedByDefault;
  bool? required;
  bool? addonEnabled;
  String? label;
  String? labelAr;
  String? price;
  String? priceType;
  String? priceMethod;
  String? tooltip;
  String? description;
  String? image;
  bool? showImage;
  bool? labelInCart;
  String? labelInCartOpt;

  Option({
    this.selectedByDefault,
    this.required,
    this.addonEnabled,
    this.label,
    this.labelAr,
    this.price,
    this.priceType,
    this.priceMethod,
    this.tooltip,
    this.description,
    this.image,
    this.showImage,
    this.labelInCart,
    this.labelInCartOpt,
  });

  factory Option.fromJson(Map<String, dynamic> json) => Option(
        selectedByDefault: json['selected_by_default'] as bool?,
        required: json['required'] as bool?,
        addonEnabled: json['addon_enabled'] as bool?,
        label: json['label'] as String?,
        labelAr: json['label_ar'] as String?,
        price: json['price'] as String?,
        priceType: json['price_type'] as String?,
        priceMethod: json['price_method'] as String?,
        tooltip: json['tooltip'] as String?,
        description: json['description'] as String?,
        image: json['image'] as String?,
        showImage: json['show_image'] as bool?,
        labelInCart: json['label_in_cart'] as bool?,
        labelInCartOpt: json['label_in_cart_opt'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'selected_by_default': selectedByDefault,
        'required': required,
        'addon_enabled': addonEnabled,
        'label': label,
        'label_ar': labelAr,
        'price': price,
        'price_type': priceType,
        'price_method': priceMethod,
        'tooltip': tooltip,
        'description': description,
        'image': image,
        'show_image': showImage,
        'label_in_cart': labelInCart,
        'label_in_cart_opt': labelInCartOpt,
      };
}
