import 'package:freezed_annotation/freezed_annotation.dart';

part 'product_response.freezed.dart';
part 'product_response.g.dart';

@freezed
class ProductResponse with _$ProductResponse {
  const factory ProductResponse({
    required String status,
    required int results,
    required ProductData data,
    required String message,
  }) = _ProductResponse;
  factory ProductResponse.fromJson(Map<String, dynamic> json) =>
      _$ProductResponseFromJson(json);
}

@freezed
class ProductData with _$ProductData {
  const factory ProductData({
    required List<Product>? product,
  }) = _ProductData;
  factory ProductData.fromJson(Map<String, dynamic> json) =>
      _$ProductDataFromJson(json);
}

@freezed
class Product with _$Product {
  const factory Product({
    required int id,
    required String name,
    required String image,
    required String price,
    required int stock,
    required int createDate,
    required List<String> category,
  }) = _Product;
  factory Product.fromJson(Map<String, dynamic> json) =>
      _$ProductFromJson(json);
}
