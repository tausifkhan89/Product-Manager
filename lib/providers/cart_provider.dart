import 'dart:collection';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:product_manager/models/product_model.dart';

class CartProvider extends ChangeNotifier {
  List<ProductModel> _cartProducts = [];

  List<ProductModel> get cartProducts => UnmodifiableListView(_cartProducts);

  int get _count => _cartProducts.length;

  int get count => _count;

  bool addToCart(ProductModel product) {
    bool alreadyExists = _cartProducts.any((item) => item.id == product.id);

    if (alreadyExists) {
      return false;
    }
    _cartProducts.add(product);
    notifyListeners();
    return true;
  }

  void removeFromCart(ProductModel value) {
    _cartProducts.remove(value);

    notifyListeners();
  }
}
