// screens/product_list_screen.dart
import 'package:app_items/providers/product_provider.dart';
import 'package:app_items/ui/pages/product_add.dart';
import 'package:app_items/ui/pages/product_list_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ProductListPage extends ConsumerWidget {
  const ProductListPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    debugPrint('ProductListPage build..');

    final products = ref.watch(productCollectionProvider);
    final productList = products.all;
    
    debugPrint('Products List length: ${productList.length}');

    return Scaffold(
      appBar: AppBar(
        title: const Text('Inventory'),
        actions: [
          IconButton(
            icon: const Icon(Icons.add),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => AddProductPage()),
              );
            },
            tooltip: 'Add Product',
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: productList.length,
        itemBuilder: (_, i) => ProductTile(product: productList[i]),
      ),
    );
  }
}
