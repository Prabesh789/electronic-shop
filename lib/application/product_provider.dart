import 'package:electronic_shop/infrastructure/product/entities/product_response.dart';
import 'package:flutter/material.dart';

class ProductProvider extends ChangeNotifier {
  bool _productLoading = true;
  bool get productLoading => _productLoading;
  List<Product> _productList = [];

  setProductLoading(bool value) {
    _productLoading = value;
    notifyListeners();
  }

  getProductList(List<Product> product, {bool notify = true}) {
    _productList = product;
    if (notify) notifyListeners();
  }

  Product getProductByIndex(int index) => _productList[index];
  int get productListLength => _productList.length;
}
