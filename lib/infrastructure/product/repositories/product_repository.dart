import 'dart:convert';

import 'package:electronic_shop/infrastructure/product/entities/product_response.dart';
import 'package:electronic_shop/infrastructure/services/endpoints.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

abstract class IProductRepository {
  Future<ProductResponse> electronicProducts();
  Future<List<ProductData>> cartProducts({
    ProductData? productData,
  });
}

class ProductRepository implements IProductRepository {
  @override
  Future<ProductResponse> electronicProducts() async {
    try {
      final response = await http.get(
        Uri.parse(Endpoints.productEp),
      );
      final data = json.decode(response.body);
      debugPrint('$data');
      debugPrint('$response');
      final result = ProductResponse.fromJson(data as Map<String, dynamic>);
      return result;
    } catch (e) {
      debugPrint('$e');
    }
    throw UnimplementedError();
  }

  @override
  Future<List<ProductData>> cartProducts({
    ProductData? productData,
  }) async {
    try {
      List<ProductData> cardProductList = [];
      cardProductList.add(productData!);
      return cardProductList;
    } catch (e) {
      debugPrint('$e');
    }
    throw UnimplementedError();
  }
}
