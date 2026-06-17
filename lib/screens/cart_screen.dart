import 'package:flutter/material.dart';
import 'package:product_manager/models/product_model.dart';
import 'package:product_manager/providers/cart_provider.dart';
import 'package:provider/provider.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = context.watch<CartProvider>();
    List<ProductModel> products = provider.cartProducts;
    return Scaffold(
      appBar: AppBar(title: Text('Products In Cart')),
      body: provider.cartProducts.isEmpty
          ? Center(
              child: Text(
                'Cart Empty',
                style: TextStyle(fontSize: 30, fontWeight: FontWeight(400)),
              ),
            )
          : ListView.builder(
              itemCount: provider.count,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 8.0,
                    vertical: 4,
                  ),
                  child: Card(
                    child: ListTile(
                      title: Text(
                        products[index].title,
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight(500),
                        ),
                      ),
                      subtitle: Text(
                        products[index].description,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(fontSize: 18),
                      ),
                      leading: Image.network(products[index].thumbnail),
                      trailing: IconButton(
                        onPressed: () {
                          context.read<CartProvider>().removeFromCart(
                            products[index],
                          );
                        },
                        icon: Icon(Icons.delete_outline, color: Colors.red),
                      ),
                    ),
                  ),
                );
              },
            ),
    );
  }
}
