import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'ProductDetailScreen.dart';
import 'ProductListScreen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Product App',
      initialRoute: '/product-list',
      getPages: [
        GetPage(name: '/product-list', page: () => ProductListScreen()),
        GetPage(
            name: '/product-detail', page: () => const ProductDetailScreen()),
      ],
    );
  }
}

class Product {
  final String name;
  final String imageUrl;
  final double price;

  Product({required this.name, required this.imageUrl, required this.price});
}

class ProductController extends GetxController {
  var products = <Product>[
    Product(
        name: 'Product 1',
        imageUrl: 'https://picsum.photos/150/150?random=1',
        price: 50),
    Product(
        name: 'Product 2',
        imageUrl: 'https://picsum.photos/151/150?random=1',
        price: 100),
    Product(
        name: 'Product 3',
        imageUrl: 'https://picsum.photos/150/151?random=1',
        price: 999),
  ].obs;
}


