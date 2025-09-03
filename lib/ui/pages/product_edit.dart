import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:app_items/data_classes/product.dart';
import 'package:app_items/providers/product_provider.dart';


class EditProductPage extends ConsumerStatefulWidget {
  final Product product;

  const EditProductPage({super.key, required this.product});

  @override
  ConsumerState<EditProductPage> createState() => _EditProductPageState();
}

class _EditProductPageState extends ConsumerState<EditProductPage> {
  late TextEditingController nameController;
  late TextEditingController quantityController;
  late TextEditingController priceController;
  late TextEditingController descriptionController;

  @override
  void initState() {
    super.initState();
    nameController = TextEditingController(text: widget.product.name);
    quantityController = TextEditingController(text: widget.product.quantity.toString());
    priceController = TextEditingController(text: widget.product.price.toStringAsFixed(2));
    descriptionController = TextEditingController(text: widget.product.description);
  }

  @override
  void dispose() {
    nameController.dispose();
    quantityController.dispose();
    priceController.dispose();
    descriptionController.dispose();
    super.dispose();
  }

  void _save() {
    final updated = widget.product.copyWith(
      name: nameController.text,
      quantity: int.tryParse(quantityController.text) ?? widget.product.quantity,
      price: double.tryParse(priceController.text) ?? widget.product.price,
      description: descriptionController.text,
    );


    ref.read(productCollectionProvider.notifier).update(updated); // Add the updated product back to the list (if it's new)

    Navigator.pop(context); // Go back to the list
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey[200],
      appBar: AppBar(title: const Text('Edit Product')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            TextField(
              controller: nameController,
              decoration: const InputDecoration(labelText: 'Name'),
            ),
            TextField(
              controller: quantityController,
              decoration: const InputDecoration(labelText: 'Quantity'),
              keyboardType: TextInputType.number,
            ),
            TextField(
              controller: priceController,
              decoration: const InputDecoration(labelText: 'Price'),
              keyboardType: TextInputType.numberWithOptions(decimal: true),
            ),
            TextField(
              controller: descriptionController,
              decoration: const InputDecoration(labelText: 'Description'),
              maxLines: 3,
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _save,
              child: const Text('Save Changes'),
            ),
          ],
        ),
      ),
    );
  }
}