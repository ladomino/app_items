import 'package:equatable/equatable.dart';

class Product extends Equatable {
  final String id;
  final String name;
  final int quantity;
  final double price;
  final String? description;

  const Product({
    required this.id,
    required this.name,
    required this.quantity,
    required this.price,
    this.description,
  });

  Product copyWith({
    String? name,
    int? quantity,
    double? price,
    bool clearDescription = false,
    String? description,
  }) {
    return Product(
      id: id,
      name: name ?? this.name,
      quantity: quantity ?? this.quantity,
      price: price ?? this.price,
      description: clearDescription ? '' : (description ?? this.description),
    );
  }

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      id: json['id'],
      name: json['name'],
      quantity: json['quantity'],
      price: json['price'],
      description: json['description'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'quantity': quantity,
      'price': price,
      'description': description,
    };
  }

  @override
  List<Object?> get props => [id, name, quantity, price, description];

  @override
  String toString() {
    return 'Product{id: $id, name: $name, quantity: $quantity, price: $price, description: $description}';
  }
}

class ProductCollection {
  Map<String, Product> _products = {};

  ProductCollection({
    Map<String, Product>? products,
  }) : _products = products ?? {};

  List<Product> get all => _products.values.toList();

  Product? getById(String id) => _products[id];

  void add(Product product) {
    _products[product.id] = product;
  }

  void update(Product product) {
    if (!_products.containsKey(product.id)) {
      throw Exception('Product with id ${product.id} not found.');
    }
    _products[product.id] = product;
  }

  void delete(String id) {
    _products.remove(id);
  }

  void clear() {
    _products.clear();
  }

  factory ProductCollection.fromJson(Map<String, dynamic> json) {
    final collection = ProductCollection();

    for (final entry in json.entries) {
      final productId = entry.key;
      final productJson = entry.value;

      // Create Product from JSON
      final Product product = Product.fromJson(productJson);

      // Add to collection's internal map
      collection._products[productId] = product;
    }

    return ProductCollection(products: collection._products);
  }
}
