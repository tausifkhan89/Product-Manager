import 'dart:collection';

import 'package:flutter/foundation.dart';
import 'package:product_manager/models/product_model.dart';
import 'package:product_manager/services/product_service.dart';

class ProductProvider extends ChangeNotifier {
  List<ProductModel> _products = [];

  bool _isLoading = false;

  String? _error;

  List<ProductModel> get products => UnmodifiableListView(_products);

  List<ProductModel> _filteredProducts = [];

  List<ProductModel> get filteredProducts =>
      UnmodifiableListView(_filteredProducts);

  bool get isLoading => _isLoading;

  String? get error => _error;

  final ProductService _productService = ProductService();

  Future<void> fetchProducts() async {
    _isLoading = true;
    _error = null;
    notifyListeners();

    try {
      _products = await _productService.getProducts();
      _filteredProducts = List.from(_products);
    } catch (e) {
      _error = e.toString();
    } finally {
      _isLoading = false;

      notifyListeners();
    }
  }

  void searchProduct(String query) {
    if (query.isEmpty) {
      _filteredProducts = List.from(_products);
      notifyListeners();
    } else {
      _filteredProducts = _products.where((product) {
        return product.title.toLowerCase().contains(query.toLowerCase());
      }).toList();

      notifyListeners();
    }
  }
}
