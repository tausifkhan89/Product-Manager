import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:product_manager/models/product_model.dart';

class ProductService {
  Future<List<ProductModel>> getProducts() async {
    final response = await http.get(
      Uri.parse('https://dummyjson.com/products'),
    );

    final data = jsonDecode(response.body);

    final products = data['products'];

    return products
        .map<ProductModel>((product) => ProductModel.fromJson(product))
        .toList();
  }
}
