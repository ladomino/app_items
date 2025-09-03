// widgets/product_tile.dart
import 'package:app_items/data_classes/product.dart';
import 'package:app_items/providers/product_provider.dart';
import 'package:app_items/ui/pages/product_edit.dArt';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class ProductTile extends ConsumerWidget {
  final Product product;
  final int index;

  const ProductTile({super.key, required this.product, required this.index});

  // @override
  // Widget build(BuildContext context) {
  //   return ListTile(
  //     title: Text(product.name),
  //     subtitle: Text(
  //       'Qty: ${product.quantity} • \$${product.price.toStringAsFixed(2)}',
  //     ),
  //     onTap: () {
  //       Navigator.push(
  //         context,
  //         MaterialPageRoute(
  //           builder: (context) => EditProductPage(
  //             key: ValueKey(product.id),
  //             product: product,
  //           ),
  //         ),
  //       );
  //     },
  //   );
  // }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // Alternate between two colors based on index
    final backgroundColor = index.isEven 
        ? Colors.blueGrey[50] 
        : Colors.blueGrey[100];

    return Slidable(
      key: ValueKey(product.id),
      endActionPane: ActionPane(
        motion: const ScrollMotion(),
        children: [
          SlidableAction(
            onPressed: (context) {
              // Show confirmation dialog
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return AlertDialog(
                    title: const Text('Delete Product'),
                    content: Text(
                      'Are you sure you want to delete "${product.name}"?',
                    ),
                    actions: [
                      TextButton(
                        onPressed: () => Navigator.of(context).pop(),
                        child: const Text('Cancel'),
                      ),
                      TextButton(
                        onPressed: () {
                          ref
                              .read(productCollectionProvider.notifier)
                              .delete(product.id);
                          Navigator.of(context).pop();
                        },
                        child: const Text('Delete'),
                      ),
                    ],
                  );
                },
              );
            },
            backgroundColor: const Color(0xFFFE4A49),
            foregroundColor: Colors.white,
            icon: Icons.delete,
            label: 'Delete',
          ),
        ],
      ),
      child: Container(
        color: backgroundColor,
        child: ListTile(
          title: Text(product.name),
          subtitle: Text(
            'Qty: ${product.quantity} • \$${product.price.toStringAsFixed(2)}',
          ),
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) =>
                    EditProductPage(key: ValueKey(product.id), product: product),
              ),
            );
          },
        ),
      ),
    );
  }
}
