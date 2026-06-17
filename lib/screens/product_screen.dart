import 'package:flutter/material.dart';
import 'package:product_manager/models/product_model.dart';
import 'package:product_manager/providers/cart_provider.dart';
import 'package:provider/provider.dart';

class ProductScreen extends StatelessWidget {
  const ProductScreen({super.key, required this.product});

  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Details')),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          children: [
            Image.network(product.thumbnail),
            Text(
              product.title,
              style: TextStyle(fontSize: 24, fontWeight: FontWeight(500)),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 20),
            Text(
              product.description,
              style: TextStyle(fontSize: 18),
              textAlign: TextAlign.center,
            ),
            Spacer(),
            ElevatedButton(
              onPressed: () {
                bool added = context.read<CartProvider>().addToCart(product);
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(
                      added
                          ? "Product added to cart"
                          : "Product already exists in cart",
                    ),
                    backgroundColor: added ? Colors.green : Colors.red,
                  ),
                );
                Navigator.pop(context);
              },
              child: Text('Add To Cart'),
            ),
          ],
        ),
      ),
    );
  }
}
