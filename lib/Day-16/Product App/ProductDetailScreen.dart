import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'main.dart';

class ProductDetailScreen extends StatelessWidget {
  const ProductDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final Product product = Get.arguments;

    return Scaffold(
      appBar: AppBar(title: Text(product.name)),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Image.network(product.imageUrl),
            const SizedBox(height: 16),
            Text(product.name,
                style:
                const TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
            const SizedBox(height: 8),
            Text('${product.price.toStringAsFixed(0)}원',
                style: const TextStyle(fontSize: 20)),
          ],
        ),
      ),
    );
  }
}
