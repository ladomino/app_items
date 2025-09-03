import 'package:app_items/api/product.dart';
import 'package:app_items/data_classes/product.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final productAPIProvider = Provider((ref) => ProductAPI());

// final productListProvider =
//     StateNotifierProvider<ProductListNotifier, List<Product>>(
//       (ref) => ProductListNotifier(ref.read(productAPIProvider)),
//     );

// class ProductListNotifier extends StateNotifier<List<Product>> {
//   final ProductAPI _api;

//   ProductListNotifier(this._api) : super([]) {
//     // Initialize with data from API
//     _load();
//   }

//   void _load() {
//     state = _api.getAll(); // trigger UI rebuild
//   }

//   void delete(String id) {
//     _api.delete(id);
//     _load();
//   }

//   void add(String name, int quantity, double price, String description) {
//     _api.addProduct(name, quantity, price, description: description);

//     state = _api.getAll(); // trigger UI rebuild
//   }

//   void update(Product updatedProduct) {
//     _api.updateProduct(updatedProduct);
//     _load(); // refresh list
//   }

//   void patch(String id, {String? name, int? quantity}) {
//   _api.editProduct(id, name: name, quantity: quantity);
//   _load();
// }
// }

// final productCollectionProvider =
//     StateNotifierProvider<ProductCollectionNotifier, ProductCollection>(
//       (ref) => ProductCollectionNotifier(ref.read(productAPIProvider)),
//     );
final productCollectionProvider =
    ChangeNotifierProvider<ProductCollectionNotifier>((ref) {
      return ProductCollectionNotifier(ref.read(productAPIProvider));
    });

// Keep the list provider for UI compatibility
final productListProvider = Provider<List<Product>>((ref) {
  final collection = ref.watch(productCollectionProvider);
  return collection.all;
});

//class ProductCollectionNotifier extends StateNotifier<ProductCollection> {
class ProductCollectionNotifier extends ChangeNotifier {
  final ProductAPI _api;
  ProductCollection? _products;

  //ProductCollectionNotifier(this._api) : super(ProductCollection()) {
  ProductCollectionNotifier(this._api) {
    // Initialize with data from API
    _load();
  }

  // Getter to expose the products collection
  ProductCollection get products => _products ?? ProductCollection();

   // Getter for the list of products (for compatibility)
  List<Product> get all => _products?.all ?? [];

  void _load() {
    debugPrint('Loading products...');
    _products = _api.getAll();
    notifyListeners();
  }

  void delete(String id) {
    _api.delete(id);
    _load();
  }

  void add(String name, int quantity, double price, String description) {
    _api.addProduct(name, quantity, price, description: description);
    _load();
  }

  void update(Product updatedProduct) {
    _api.updateProduct(updatedProduct);
    _load();
  }

  void patch(
    String id, {
    String? name,
    int? quantity,
    double? price,
    String? description,
  }) {
    _api.editProduct(
      id,
      name: name,
      quantity: quantity,
      price: price,
      description: description,
    );
    _load();
  }

  Product? getById(String id) {
    return _products?.getById(id);
  }
}
