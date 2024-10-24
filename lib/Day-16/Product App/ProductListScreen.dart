import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'main.dart';

class ProductListScreen extends StatelessWidget {
  final ProductController productController = Get.put(ProductController());

  ProductListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Product List')),
      body: Obx(() {
        return ListView.builder(
          itemCount: productController.products.length,
          itemBuilder: (context, index) {
            final product = productController.products[index];
            return ListTile(
              leading: Image.network(product.imageUrl, width: 50, height: 50),
              title: Text(product.name),
              subtitle: Text('${product.price.toStringAsFixed(0)}원'),
              onTap: () {
                // TODO: Implement the toNamed method
                Get.toNamed('/product-detail', arguments: product);
              },
            );
          },
        );
      }),
    );
  }
}