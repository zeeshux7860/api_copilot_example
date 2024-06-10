import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:myapp/api/provider/products.dart';
import 'package:myapp/api/provider/cart.dart';
import 'package:myapp/api/provider/dummy_api.dart';


class ProviderApp extends StatelessWidget {
   final Widget child;
  const ProviderApp({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [ChangeNotifierProvider<ProductsProvider>(create: (_) => ProductsProvider()),
ChangeNotifierProvider<CartProvider>(create: (_) => CartProvider()),
ChangeNotifierProvider<DummyApiProvider>(create: (_) => DummyApiProvider()),],
      child: child
    );
  }
}

