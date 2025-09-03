//import 'package:app_items/ui/pages/product_list_page.dart';
import 'package:app_items/ui/pages/product_search_list_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() {
  runApp(InventoryApp());
}

class InventoryApp extends StatelessWidget {
  const InventoryApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const ProviderScope(child: MyApp());
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  ThemeData _createTheme(Brightness brightness) {
    return ThemeData(
      useMaterial3: true,
      brightness: brightness,
      fontFamily: 'Times New Roman', 
    );
  }


  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Product App',
      theme: _createTheme(Brightness.light),
      darkTheme: _createTheme(Brightness.dark),
      themeMode: ThemeMode.system, 
      //home: ProductListPage(),
      home: ProductSearchListPage(),
    );
  }
}
