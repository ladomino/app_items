import 'package:app_items/providers/product_provider.dart';
import 'package:app_items/ui/pages/product_add.dart';
import 'package:app_items/ui/pages/product_list_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ProductSearchListPage extends ConsumerStatefulWidget {
  const ProductSearchListPage({super.key});

  @override
  ConsumerState<ProductSearchListPage> createState() => _ProductListPageState();
}

class _ProductListPageState extends ConsumerState<ProductSearchListPage> {
  final TextEditingController _searchController = TextEditingController();
  String _searchQuery = '';

  @override
  void initState() {
    super.initState();
    _searchController.addListener(() {
      setState(() {
        _searchQuery = _searchController.text.toLowerCase();
      });
    });
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    debugPrint('ProductSearchListPage build..');

    final products = ref.watch(productCollectionProvider);
    final productList = products.all;

    // Filter products based on search query
    final filteredProducts = _searchQuery.isEmpty
        ? productList
        : productList
              .where(
                (product) => product.name.toLowerCase().contains(_searchQuery),
              )
              .toList();

    debugPrint('Products List length: ${productList.length}');
    debugPrint('Filtered Products length: ${filteredProducts.length}');

    return Scaffold(
      backgroundColor: Colors.blueGrey[200],
      appBar: AppBar(
        title: const Text('Products'),
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
      body: Column(
        children: [
          // Search Bar
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextField(
              controller: _searchController,
              decoration: InputDecoration(
                hintText: 'Search products by name...',
                prefixIcon: const Icon(Icons.search),
                suffixIcon: _searchQuery.isNotEmpty
                    ? IconButton(
                        icon: const Icon(Icons.clear),
                        onPressed: () {
                          _searchController.clear();
                        },
                      )
                    : null,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                filled: true,
                fillColor: Colors.blueGrey[100],
              ),
            ),
          ),
          // Product List
          Expanded(
            child: filteredProducts.isEmpty
                ? Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          _searchQuery.isEmpty
                              ? Icons.inventory_2
                              : Icons.search_off,
                          size: 64,
                          color: Theme.of(
                            context,
                          ).colorScheme.onSurface.withValues(alpha: 0.5),
                        ),
                        const SizedBox(height: 16),
                        Text(
                          _searchQuery.isEmpty
                              ? 'No products available'
                              : 'No products found for "$_searchQuery"',
                          style: Theme.of(context).textTheme.titleMedium
                              ?.copyWith(
                                color: Theme.of(
                                  context,
                                ).colorScheme.onSurface.withValues(alpha: 0.7),
                              ),
                        ),
                        if (_searchQuery.isNotEmpty) ...[
                          const SizedBox(height: 8),
                          TextButton(
                            onPressed: () {
                              _searchController.clear();
                            },
                            child: const Text('Clear search'),
                          ),
                        ],
                      ],
                    ),
                  )
                : ListView.builder(
                    itemCount: filteredProducts.length,
                    itemBuilder: (_, i) =>
                        ProductTile(product: filteredProducts[i], index: i),
                  ),
          ),
        ],
      ),
    );
  }
}
