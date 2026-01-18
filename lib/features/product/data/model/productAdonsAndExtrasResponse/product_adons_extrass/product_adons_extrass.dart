import 'block.dart';
import 'product.dart';

class ProductAdonsExtrassResponse {
  Product? product;
  List<Block>? blocks;

  ProductAdonsExtrassResponse({this.product, this.blocks});

  factory ProductAdonsExtrassResponse.fromJson(Map<String, dynamic> json) {
    return ProductAdonsExtrassResponse(
      product: json['product'] == null
          ? null
          : Product.fromJson(json['product'] as Map<String, dynamic>),
      blocks: (json['blocks'] as List<dynamic>?)
          ?.map((e) => Block.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() => {
        'product': product?.toJson(),
        'blocks': blocks?.map((e) => e.toJson()).toList(),
      };
}
