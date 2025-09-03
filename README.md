# app_items

A simple flutter product crud products application.

## Getting Started

This project is a sample products application showing add, edit, update and delete.

It was originally written using riverpod and List of products. To show simplicity of use of riverpod.

It was modified to use a Map<String, Product> for faster product lookups. However
to make efficient use of Riverpod - the state management was moved to Provider and notifyListeners for add, edit, delete.   

This was to show using Maps and Riverpod can be problematic for large data as Riverpod requires a new Map reference to show the state update.

Sometimes it's best to use different techniques for different purposes to optimize the application especially if you require using large enterprise data.
