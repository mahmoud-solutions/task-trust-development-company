import 'date_created.dart';
import 'date_modified.dart';
import 'meta_datum.dart';

class ProductDetailsModelResponse {
  int? id;
  String? name;
  String? slug;
  DateCreated? dateCreated;
  DateModified? dateModified;
  String? status;
  bool? featured;
  String? catalogVisibility;
  String? description;
  String? shortDescription;
  String? sku;
  String? globalUniqueId;
  String? price;
  String? regularPrice;
  String? salePrice;
  dynamic dateOnSaleFrom;
  dynamic dateOnSaleTo;
  int? totalSales;
  String? taxStatus;
  String? taxClass;
  bool? manageStock;
  dynamic stockQuantity;
  String? stockStatus;
  String? backorders;
  String? lowStockAmount;
  bool? soldIndividually;
  String? weight;
  String? length;
  String? width;
  String? height;
  List<dynamic>? upsellIds;
  List<dynamic>? crossSellIds;
  int? parentId;
  bool? reviewsAllowed;
  String? purchaseNote;
  List<dynamic>? attributes;
  List<dynamic>? defaultAttributes;
  int? menuOrder;
  String? postPassword;
  bool? virtual;
  bool? downloadable;
  List<int>? categoryIds;
  List<dynamic>? tagIds;
  List<dynamic>? brandIds;
  int? shippingClassId;
  List<dynamic>? downloads;
  String? imageId;
  List<dynamic>? galleryImageIds;
  int? downloadLimit;
  int? downloadExpiry;
  List<dynamic>? ratingCounts;
  String? averageRating;
  int? reviewCount;
  dynamic cogsValue;
  List<MetaDatum>? metaData;
  String? nameEn;
  String? nameAr;
  String? descriptionEn;
  String? descriptionAr;
  String? image;
  int? priceTax;
  int? priceTaxSale;
  int? points;
  bool? onSale;
  List<int>? relatedIds;
  String? type;

  ProductDetailsModelResponse({
    this.id,
    this.name,
    this.slug,
    this.dateCreated,
    this.dateModified,
    this.status,
    this.featured,
    this.catalogVisibility,
    this.description,
    this.shortDescription,
    this.sku,
    this.globalUniqueId,
    this.price,
    this.regularPrice,
    this.salePrice,
    this.dateOnSaleFrom,
    this.dateOnSaleTo,
    this.totalSales,
    this.taxStatus,
    this.taxClass,
    this.manageStock,
    this.stockQuantity,
    this.stockStatus,
    this.backorders,
    this.lowStockAmount,
    this.soldIndividually,
    this.weight,
    this.length,
    this.width,
    this.height,
    this.upsellIds,
    this.crossSellIds,
    this.parentId,
    this.reviewsAllowed,
    this.purchaseNote,
    this.attributes,
    this.defaultAttributes,
    this.menuOrder,
    this.postPassword,
    this.virtual,
    this.downloadable,
    this.categoryIds,
    this.tagIds,
    this.brandIds,
    this.shippingClassId,
    this.downloads,
    this.imageId,
    this.galleryImageIds,
    this.downloadLimit,
    this.downloadExpiry,
    this.ratingCounts,
    this.averageRating,
    this.reviewCount,
    this.cogsValue,
    this.metaData,
    this.nameEn,
    this.nameAr,
    this.descriptionEn,
    this.descriptionAr,
    this.image,
    this.priceTax,
    this.priceTaxSale,
    this.points,
    this.onSale,
    this.relatedIds,
    this.type,
  });

  factory ProductDetailsModelResponse.fromJson(Map<String, dynamic> json) {
    return ProductDetailsModelResponse(
      id: json['id'] as int?,
      name: json['name'] as String?,
      slug: json['slug'] as String?,
      dateCreated: json['date_created'] == null
          ? null
          : DateCreated.fromJson(json['date_created'] as Map<String, dynamic>),
      dateModified: json['date_modified'] == null
          ? null
          : DateModified.fromJson(
              json['date_modified'] as Map<String, dynamic>),
      status: json['status'] as String?,
      featured: json['featured'] as bool?,
      catalogVisibility: json['catalog_visibility'] as String?,
      description: json['description'] as String?,
      shortDescription: json['short_description'] as String?,
      sku: json['sku'] as String?,
      globalUniqueId: json['global_unique_id'] as String?,
      price: json['price'] as String?,
      regularPrice: json['regular_price'] as String?,
      salePrice: json['sale_price'] as String?,
      dateOnSaleFrom: json['date_on_sale_from'] as dynamic,
      dateOnSaleTo: json['date_on_sale_to'] as dynamic,
      totalSales: json['total_sales'] as int?,
      taxStatus: json['tax_status'] as String?,
      taxClass: json['tax_class'] as String?,
      manageStock: json['manage_stock'] as bool?,
      stockQuantity: json['stock_quantity'] as dynamic,
      stockStatus: json['stock_status'] as String?,
      backorders: json['backorders'] as String?,
      lowStockAmount: json['low_stock_amount'] as String?,
      soldIndividually: json['sold_individually'] as bool?,
      weight: json['weight'] as String?,
      length: json['length'] as String?,
      width: json['width'] as String?,
      height: json['height'] as String?,
      upsellIds: json['upsell_ids'] as List<dynamic>?,
      crossSellIds: json['cross_sell_ids'] as List<dynamic>?,
      parentId: json['parent_id'] as int?,
      reviewsAllowed: json['reviews_allowed'] as bool?,
      purchaseNote: json['purchase_note'] as String?,
      attributes: json['attributes'] as List<dynamic>?,
      defaultAttributes: json['default_attributes'] as List<dynamic>?,
      menuOrder: json['menu_order'] as int?,
      postPassword: json['post_password'] as String?,
      virtual: json['virtual'] as bool?,
      downloadable: json['downloadable'] as bool?,
      categoryIds: json['category_ids'] as List<int>?,
      tagIds: json['tag_ids'] as List<dynamic>?,
      brandIds: json['brand_ids'] as List<dynamic>?,
      shippingClassId: json['shipping_class_id'] as int?,
      downloads: json['downloads'] as List<dynamic>?,
      imageId: json['image_id'] as String?,
      galleryImageIds: json['gallery_image_ids'] as List<dynamic>?,
      downloadLimit: json['download_limit'] as int?,
      downloadExpiry: json['download_expiry'] as int?,
      ratingCounts: json['rating_counts'] as List<dynamic>?,
      averageRating: json['average_rating'] as String?,
      reviewCount: json['review_count'] as int?,
      cogsValue: json['cogs_value'] as dynamic,
      metaData: (json['meta_data'] as List<dynamic>?)
          ?.map((e) => MetaDatum.fromJson(e as Map<String, dynamic>))
          .toList(),
      nameEn: json['name_en'] as String?,
      nameAr: json['name_ar'] as String?,
      descriptionEn: json['description_en'] as String?,
      descriptionAr: json['description_ar'] as String?,
      image: json['image'] as String?,
      priceTax: json['price_tax'] as int?,
      priceTaxSale: json['price_tax_sale'] as int?,
      points: json['points'] as int?,
      onSale: json['on_sale'] as bool?,
      relatedIds: json['related_ids'] as List<int>?,
      type: json['type'] as String?,
    );
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'slug': slug,
        'date_created': dateCreated?.toJson(),
        'date_modified': dateModified?.toJson(),
        'status': status,
        'featured': featured,
        'catalog_visibility': catalogVisibility,
        'description': description,
        'short_description': shortDescription,
        'sku': sku,
        'global_unique_id': globalUniqueId,
        'price': price,
        'regular_price': regularPrice,
        'sale_price': salePrice,
        'date_on_sale_from': dateOnSaleFrom,
        'date_on_sale_to': dateOnSaleTo,
        'total_sales': totalSales,
        'tax_status': taxStatus,
        'tax_class': taxClass,
        'manage_stock': manageStock,
        'stock_quantity': stockQuantity,
        'stock_status': stockStatus,
        'backorders': backorders,
        'low_stock_amount': lowStockAmount,
        'sold_individually': soldIndividually,
        'weight': weight,
        'length': length,
        'width': width,
        'height': height,
        'upsell_ids': upsellIds,
        'cross_sell_ids': crossSellIds,
        'parent_id': parentId,
        'reviews_allowed': reviewsAllowed,
        'purchase_note': purchaseNote,
        'attributes': attributes,
        'default_attributes': defaultAttributes,
        'menu_order': menuOrder,
        'post_password': postPassword,
        'virtual': virtual,
        'downloadable': downloadable,
        'category_ids': categoryIds,
        'tag_ids': tagIds,
        'brand_ids': brandIds,
        'shipping_class_id': shippingClassId,
        'downloads': downloads,
        'image_id': imageId,
        'gallery_image_ids': galleryImageIds,
        'download_limit': downloadLimit,
        'download_expiry': downloadExpiry,
        'rating_counts': ratingCounts,
        'average_rating': averageRating,
        'review_count': reviewCount,
        'cogs_value': cogsValue,
        'meta_data': metaData?.map((e) => e.toJson()).toList(),
        'name_en': nameEn,
        'name_ar': nameAr,
        'description_en': descriptionEn,
        'description_ar': descriptionAr,
        'image': image,
        'price_tax': priceTax,
        'price_tax_sale': priceTaxSale,
        'points': points,
        'on_sale': onSale,
        'related_ids': relatedIds,
        'type': type,
      };
}
