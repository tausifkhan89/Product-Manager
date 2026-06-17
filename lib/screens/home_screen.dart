import 'package:flutter/material.dart';
import 'package:product_manager/providers/cart_provider.dart';
import 'package:product_manager/providers/product_provider.dart';
import 'package:product_manager/screens/cart_screen.dart';
import 'package:product_manager/screens/product_screen.dart';
import 'package:product_manager/widgets/custom_text_field.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
    Future.microtask(() {
      if (!mounted) return;
      context.read<ProductProvider>().fetchProducts();
    });
  }

  @override
  Widget build(BuildContext context) {
    final provider = context.watch<ProductProvider>();
    if (provider.isLoading) {
      return Scaffold(body: Center(child: const CircularProgressIndicator()));
    }

    if (provider.error != null) {
      return Scaffold(body: Center(child: Text(provider.error.toString())));
    }

    final products = provider.filteredProducts;

    return Scaffold(
      appBar: AppBar(
        title: Text('Product Manager'),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => CartScreen()),
              );
            },
            icon: Icon(Icons.shopping_cart_outlined),
          ),
          Consumer(
            builder: (context, value, child) {
              int count = context.watch<CartProvider>().count;
              return Text('$count', style: TextStyle(fontSize: 18));
            },
          ),
        ],
        actionsPadding: EdgeInsets.only(right: 12),
      ),
      body: Column(
        children: [
          CustomTextField(),
          Expanded(
            child: ListView.builder(
              itemCount: products.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 8.0,
                    vertical: 4,
                  ),
                  child: InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              ProductScreen(product: products[index]),
                        ),
                      );
                    },
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
                        ),
                        leading: Image(
                          image: NetworkImage(products[index].thumbnail),
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
