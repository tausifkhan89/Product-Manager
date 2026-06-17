import 'package:flutter/material.dart';
import 'package:product_manager/providers/product_provider.dart';
import 'package:provider/provider.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({super.key});

  @override
  Widget build(BuildContext context) {
    ProductProvider provider = context.read<ProductProvider>();
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextField(
        decoration: InputDecoration(
          hint: Text('Search'),
          contentPadding: EdgeInsets.all(4),
          border: InputBorder.none,
          fillColor: Colors.black12,
          filled: true,
        ),
        onChanged: (value) {
          provider.searchProduct(value);
        },
      ),
    );
  }
}
