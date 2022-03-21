import 'package:electronic_shop/infrastructure/product/entities/product_response.dart';
import 'package:electronic_shop/infrastructure/services/endpoints.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

abstract class IProductRepository {
  Future appStarted();
}

class ProductRepository implements IProductRepository {
  @override
  Future appStarted() async {
    try {
      final response = await http.get(Uri.parse(Endpoints.productEp));

      final result =
          ProductResponse.fromJson(response.body as Map<String, dynamic>);
      return result;
    } catch (e) {
      debugPrint('$e');
    }
  }
}
