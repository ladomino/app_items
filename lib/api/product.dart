import 'package:app_items/constants/sample_products.dart';
import 'package:app_items/data_classes/product.dart';
import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';

class ProductAPI {
  // Use for List<Product>
  //final List<Product> _products = [];
  //final List<Product> _products = List.from(sampleProducts); // Add this line!

  // Setup for ProductCollection
  final ProductCollection _products;

  ProductAPI() : _products = ProductCollection.fromJson(sampleJson) {
    debugPrint('ProductAPI: Loading sample data...');
    // Load sample data only once during instantiation
    //_products.addAll(sampleProducts);
  }

  // Return a copy of the list of products.
  ProductCollection getAll() {
    debugPrint('ProductAPI: Returning ${_products.all.length} products');

    //return [..._products];
    return _products;
  }

  /// Add a new product to the _product list in memory.
  void addProduct(
    String name,
    int quantity,
    double price, {
    String? description,
  }) {
    final product = Product(
      id: const Uuid().v4(),
      name: name,
      quantity: quantity,
      price: price,
      description: description ?? '',
    );

    debugPrint('ProductAPI: Added product: $product');

    _products.add(product);
  }

  void delete(String id) {
    //_products.removeWhere((product) => product.id == id);

    _products.delete(id);
  }

  void clearAll() {
    _products.clear();
  }

  void updateProduct(Product updatedProduct) {
    // Used for List<Product>
    // final index = _products.indexWhere((p) => p.id == updatedProduct.id);
    // if (index == -1) {
    //   throw Exception('Product not found');
    // }

    // _products[index] = updatedProduct;

    // Used for ProductCollection
    _products.update(updatedProduct);
  }

  /// Partial update: useful for patching just certain fields (e.g., from HTTP PATCH or quick UI update)
  void editProduct(
    String id, {
    String? name,
    int? quantity,
    double? price,
    String? description,
  }) {
    // Used for List<Product>
    // final index = _products.indexWhere((p) => p.id == id);
    // if (index == -1) return;

    // final existing = _products[index];

    // _products[index] = existing.copyWith(
    //   name: name,
    //   quantity: quantity,
    //   price: price,
    //   description: description,
    // );

    // Used for ProductCollection
    final existing = _products.getById(id);
    if (existing == null) return;

    final updatedProduct = existing.copyWith(
      name: name,
      quantity: quantity,
      price: price,
      description: description,
    );

    _products.update(updatedProduct);
  }
}

// class ProductAPI {
//   final ProductCollection _collection = ProductCollection();

//   List<Product> getAll() => _collection.all;

//   void addProduct(String name, int quantity, double price, {String description = ''}) {
//     final newProduct = Product(
//       id: DateTime.now().millisecondsSinceEpoch.toString(),
//       name: name,
//       quantity: quantity,
//       price: price,
//       description: description,
//     );

//     _collection.add(newProduct);
//   }

//   void updateProduct(Product updatedProduct) {
//     _collection.update(updatedProduct);
//   }

//   void deleteProduct(String id) {
//     _collection.delete(id);
//   }

//   Product? getById(String id) => _collection.getById(id);
// }
