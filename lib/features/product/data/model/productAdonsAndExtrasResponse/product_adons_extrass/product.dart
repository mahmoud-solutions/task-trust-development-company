class Product {
  int? id;
  String? name;
  String? nameAr;
  String? price;
  String? type;

  Product({this.id, this.name, this.nameAr, this.price, this.type});

  factory Product.fromJson(Map<String, dynamic> json) => Product(
        id: json['id'] as int?,
        name: json['name'] as String?,
        nameAr: json['name_ar'] as String?,
        price: json['price'] as String?,
        type: json['type'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'name_ar': nameAr,
        'price': price,
        'type': type,
      };
}
