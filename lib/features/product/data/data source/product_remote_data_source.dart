import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:trustdeveopmenttask/core/services/server_exp.dart';
import 'package:trustdeveopmenttask/features/product/data/model/categoryandproductmodel.dart/category_model.dart';
import 'package:trustdeveopmenttask/features/product/data/model/categoryandproductmodel.dart/product_model.dart';
import 'package:trustdeveopmenttask/features/product/data/model/product_details_model_response/product_details_model_response.dart';
import 'package:trustdeveopmenttask/features/product/domain/entity/modelToentity/adonmodel.dart';

abstract class ProductRemoteDataSource {
  Future<List<CategoryModel>> getCategories();
  Future<List<ProductModel>> getProductsByCategory(int categoryId);
  Future<ProductDetailsModelResponse> getProductDetails(int productId);
  Future<List<AddonDomainModel>> getProductAddons(int productId);
}

class ProductRemoteDataSourceImpl implements ProductRemoteDataSource {
  final Dio dio;
  final String baseUrl = "https://dushkaburger.com/wp-json/";

  ProductRemoteDataSourceImpl(this.dio) {
    const username = 'testapp';
    const password = '5S0Q YjyH 4s3G elpe 5F8v u8as';
    final basicAuth =
        'Basic ${base64Encode(utf8.encode('$username:$password'))}';
    dio.options.headers.addAll({
      'Authorization': basicAuth,
      'Accept': 'application/json',
      'Content-Type': 'application/json',
    });
  }

  @override
  Future<List<CategoryModel>> getCategories() async {
    try {
      final response = await dio.get('${baseUrl}custom-api/v1/categories');

      if (response.statusCode == 200) {
        final data = response.data;

        if (data is List) {
          return data
              .map<CategoryModel>((c) => CategoryModel.fromJson(c))
              .toList();
        }

        if (data is Map<String, dynamic>) {
          if (data['categories'] is List) {
            return (data['categories'] as List)
                .map((c) => CategoryModel.fromJson(c))
                .toList();
          }
        }

        throw ServerException('Invalid response format');
      } else {
        throw ServerException(
            'Failed to load categories. Status: ${response.statusCode}');
      }
    } catch (e) {
      throw ServerException('Network error: $e');
    }
  }

  @override
  Future<List<ProductModel>> getProductsByCategory(int categoryId) async {
    try {
      try {
        final response = await dio.get(
          '${baseUrl}custom-api/v1/categories/$categoryId',
        );

        if (response.statusCode == 200) {
          final data = response.data;

          if (data['products'] is List) {
            return (data['products'] as List)
                .map((p) => ProductModel.fromJson(p))
                .toList();
          }

          if (data is Map<String, dynamic>) {
            final category = CategoryModel.fromJson(data);
            return category.products;
          }
        }
      } catch (e) {}

      final categories = await getCategories();

      final matchingCategory = categories.firstWhere(
        (cat) => cat.id == categoryId,
        orElse: () => throw ServerException('Category not found'),
      );

      return matchingCategory.products;
    } on DioException catch (e) {
      if (e.response?.statusCode == 404) {
        throw ServerException(
          'Category with ID $categoryId not found. The endpoint may not exist or the category ID is invalid.',
        );
      }
      throw ServerException('Network error: ${e.message}');
    } catch (e) {
      throw ServerException('Error fetching products: $e');
    }
  }

  @override
  Future<ProductDetailsModelResponse> getProductDetails(int productId) async {
    try {
      final response = await dio.get(
        '${baseUrl}custom-api/v1/products',
        queryParameters: {'product_id': productId},
      );

      if (response.statusCode == 200) {
        return ProductDetailsModelResponse.fromJson(response.data[0]);
      } else {
        throw ServerException('Failed to fetch product details');
      }
    } catch (e) {
      throw ServerException('Error fetching product details: $e');
    }
  }

  @override
  Future<List<AddonDomainModel>> getProductAddons(int productId) async {
    try {
      final response = await dio.get(
        'https://dushkaburger.com/wp-json/proaddon/v1/get2/',
        queryParameters: {'product_id2': productId},
      );

      if (response.statusCode == 200 && response.data['blocks'] != null) {
        final blocks = response.data['blocks'] as List;
        List<AddonDomainModel> addons = [];

        for (var block in blocks) {
          if (block['addons'] != null) {
            addons.addAll((block['addons'] as List)
                .map((e) => AddonDomainModel.fromJson(e))
                .toList());
          }
        }

        return addons;
      } else {
        throw ServerException('Failed to load addons');
      }
    } catch (e) {
      throw ServerException('Error fetching addons: $e');
    }
  }
}
