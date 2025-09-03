import 'package:flutter_test/flutter_test.dart';
import 'package:app_items/data_classes/product.dart';

void main() {
  group('Product', () {
    const testProduct = Product(
      id: 'test-id',
      name: 'Test Product',
      quantity: 10,
      price: 99.99,
      description: 'A test product',
    );

    test('should create a Product with all fields', () {
      expect(testProduct.id, 'test-id');
      expect(testProduct.name, 'Test Product');
      expect(testProduct.quantity, 10);
      expect(testProduct.price, 99.99);
      expect(testProduct.description, 'A test product');
    });

    test('should create a Product with null description', () {
      const product = Product(
        id: 'test-id',
        name: 'Test Product',
        quantity: 10,
        price: 99.99,
      );

      expect(product.description, isNull);
    });

    test('should create Product from JSON', () {
      final json = {
        'id': 'json-id',
        'name': 'JSON Product',
        'quantity': 5,
        'price': 49.99,
        'description': 'From JSON',
      };

      final product = Product.fromJson(json);

      expect(product.id, 'json-id');
      expect(product.name, 'JSON Product');
      expect(product.quantity, 5);
      expect(product.price, 49.99);
      expect(product.description, 'From JSON');
    });

    test('should create Product from JSON with null description', () {
      final json = {
        'id': 'json-id',
        'name': 'JSON Product',
        'quantity': 5,
        'price': 49.99,
        'description': null,
      };

      final product = Product.fromJson(json);

      expect(product.description, isNull);
    });

    test('should convert Product to JSON', () {
      final json = testProduct.toJson();

      expect(json['id'], 'test-id');
      expect(json['name'], 'Test Product');
      expect(json['quantity'], 10);
      expect(json['price'], 99.99);
      expect(json['description'], 'A test product');
    });

    test('should convert Product with null description to JSON', () {
      const product = Product(
        id: 'test-id',
        name: 'Test Product',
        quantity: 10,
        price: 99.99,
      );

      final json = product.toJson();

      expect(json['description'], isNull);
    });

    test('copyWith should create new Product with updated fields', () {
      final updatedProduct = testProduct.copyWith(
        name: 'Updated Product',
        quantity: 20,
      );

      expect(updatedProduct.id, 'test-id'); // unchanged
      expect(updatedProduct.name, 'Updated Product'); // changed
      expect(updatedProduct.quantity, 20); // changed
      expect(updatedProduct.price, 99.99); // unchanged
      expect(updatedProduct.description, 'A test product'); // unchanged
    });

    test('copyWith should handle clearing description', () {
      final updatedProduct = testProduct.copyWith(clearDescription: true);

      expect(updatedProduct.description, isEmpty);
    });

    test('copyWith with no parameters should return identical Product', () {
      final copiedProduct = testProduct.copyWith();

      expect(copiedProduct.id, testProduct.id);
      expect(copiedProduct.name, testProduct.name);
      expect(copiedProduct.quantity, testProduct.quantity);
      expect(copiedProduct.price, testProduct.price);
      expect(copiedProduct.description, testProduct.description);
    });

    test('should implement equality correctly', () {
      const product1 = Product(
        id: 'same-id',
        name: 'Same Product',
        quantity: 10,
        price: 99.99,
        description: 'Same description',
      );

      const product2 = Product(
        id: 'same-id',
        name: 'Same Product',
        quantity: 10,
        price: 99.99,
        description: 'Same description',
      );

      const product3 = Product(
        id: 'different-id',
        name: 'Same Product',
        quantity: 10,
        price: 99.99,
        description: 'Same description',
      );

      expect(product1, equals(product2));
      expect(product1, isNot(equals(product3)));
    });

    test('should have consistent hashCode for equal objects', () {
      const product1 = Product(
        id: 'same-id',
        name: 'Same Product',
        quantity: 10,
        price: 99.99,
        description: 'Same description',
      );

      const product2 = Product(
        id: 'same-id',
        name: 'Same Product',
        quantity: 10,
        price: 99.99,
        description: 'Same description',
      );

      expect(product1.hashCode, equals(product2.hashCode));
    });

    test('toString should return formatted string', () {
      final result = testProduct.toString();

      expect(result, contains('Product{'));
      expect(result, contains('id: test-id'));
      expect(result, contains('name: Test Product'));
      expect(result, contains('quantity: 10'));
      expect(result, contains('price: 99.99'));
      expect(result, contains('description: A test product'));
    });

    test('should handle edge cases for numeric values', () {
      const product = Product(
        id: 'edge-case',
        name: 'Edge Case Product',
        quantity: 0,
        price: 0.0,
      );

      expect(product.quantity, 0);
      expect(product.price, 0.0);
    });

    test('fromJson and toJson should be reversible', () {
      final originalJson = {
        'id': 'reversible-id',
        'name': 'Reversible Product',
        'quantity': 15,
        'price': 199.99,
        'description': 'Reversible description',
      };

      final product = Product.fromJson(originalJson);
      final convertedJson = product.toJson();

      expect(convertedJson, equals(originalJson));
    });
  });
}
