// final List<Product> sampleProducts = [
//   Product(
//     id: 'p1',
//     name: 'iPhone 15 Pro',
//     quantity: 12,
//     price: 999.99,
//     description: 'A state-of-the-art smartphone with a powerful processor and impressive display.'
//   ),
//   Product(
//     id: 'p2',
//     name: 'MacBook Pro 16"',
//     quantity: 5,
//     price: 2499.00,
//     description: 'A high-performance laptop with a powerful processor and impressive display.'
//   ),
//   Product(
//     id: 'p3',
//     name: 'Logitech MX Master 3',
//     quantity: 30,
//     price: 89.99,
//     description: 'A high-quality headset with Bluetooth connectivity and noise cancellation.'
//   ),
//   Product(
//     id: 'p4',
//     name: 'Samsung Galaxy S24',
//     quantity: 10,
//     price: 799.00,
//     description: 'A stylish and powerful smartphone with a powerful processor and impressive display.'
//   ),
//   Product(
//     id: 'p5',
//     name: 'Sony WH-1000XM5 Headphones',
//     quantity: 7,
//     price: 379.99,
//     description: 'A high-quality headset with Bluetooth connectivity and noise cancellation.'
//   ),
// ];

// // Let's mimic fromJson data normally fetched from a server
// final List<Map<String, dynamic>> _sampleProductsJson = [
//   {
//     'id': 'p1',
//     'name': 'iPhone 15 Pro',
//     'quantity': 12,
//     'price': 999.99,
//     'description':
//         'A state-of-the-art smartphone with a powerful processor and impressive display.',
//   },
//   {
//     'id': 'p2',
//     'name': 'MacBook Pro 16"',
//     'quantity': 5,
//     'price': 2499.00,
//     'description':
//         'A high-performance laptop with a powerful processor and impressive display.',
//   },
//   {
//     'id': 'p3',
//     'name': 'Logitech MX Master 3',
//     'quantity': 30,
//     'price': 89.99,
//     'description':
//         'A high-quality headset with Bluetooth connectivity and noise cancellation.',
//   },
//   {
//     'id': 'p4',
//     'name': 'Samsung Galaxy S24',
//     'quantity': 10,
//     'price': 799.00,
//     'description':
//         'A stylish and powerful smartphone with a powerful processor and impressive display.',
//   },
//   {
//     'id': 'p5',
//     'name': 'Sony WH-1000XM5 Headphones',
//     'quantity': 7,
//     'price': 379.99,
//     'description':
//         'A high-quality headset with Bluetooth connectivity and noise cancellation.',
//   },
// ];

// final List<Product> sampleProducts = _sampleProductsJson
//     .map((json) => Product.fromJson(json))
//     .toList();

// Let's mimic fromJson data normally fetched from a server as a Map
final Map<String, Map<String, dynamic>> sampleJson = {
  'p1': {
    'id': 'p1',
    'name': 'iPhone 15 Pro',
    'quantity': 12,
    'price': 999.99,
    'description':
        'A state-of-the-art smartphone with a powerful processor and impressive display.',
  },
  'p2': {
    'id': 'p2',
    'name': 'MacBook Pro 16"',
    'quantity': 5,
    'price': 2499.00,
    'description':
        'A high-performance laptop with a powerful processor and impressive display.',
  },
  'p3': {
    'id': 'p3',
    'name': 'Logitech MX Master 3',
    'quantity': 30,
    'price': 89.99,
    'description':
        'A high-quality headset with Bluetooth connectivity and noise cancellation.',
  },
  'p4': {
    'id': 'p4',
    'name': 'Samsung Galaxy S24',
    'quantity': 10,
    'price': 799.00,
    'description':
        'A stylish and powerful smartphone with a powerful processor and impressive display.',
  },
  'p5': {
    'id': 'p5',
    'name': 'Sony WH-1000XM5 Headphones',
    'quantity': 7,
    'price': 379.99,
    'description':
        'A high-quality headset with Bluetooth connectivity and noise cancellation.',
  },
};

//final ProductCollection sampleProducts = ProductCollection.fromJson(sampleJson);
