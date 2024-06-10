import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'get_callback_provider.dart';

import 'package:myapp/api/provider/products.dart';
import 'package:myapp/api/provider/cart.dart';
import 'package:myapp/api/provider/dummy_api.dart';

GetCallBackProvider callBackProvider = GetCallBackProvider.instance;

class CallBackProvider {
  late BuildContext? context;

  /// init method
  ///  [config] is required to get callback from phonepe gateway app to your app after payment is done or failed or cancelled by user or by phonepe gateway app itself due to some error or any other reason
  void init({required BuildContext value}) {
    context = value;
  }

  // get Provider of this class
  // [provider] is used to get provider of this class
  // [listen] is used to listen changes in provider
  ProductsProvider get productsProviderWithoutListener => Provider.of<ProductsProvider>(context!, listen: false);
  ProductsProvider get productsProviderListener => Provider.of<ProductsProvider>(context!, listen: true);

  // get Provider of this class
  // [provider] is used to get provider of this class
  // [listen] is used to listen changes in provider
  CartProvider get cartProviderWithoutListener => Provider.of<CartProvider>(context!, listen: false);
  CartProvider get cartProviderListener => Provider.of<CartProvider>(context!, listen: true);

  // get Provider of this class
  // [provider] is used to get provider of this class
  // [listen] is used to listen changes in provider
  DummyApiProvider get dummyApiProviderWithoutListener => Provider.of<DummyApiProvider>(context!, listen: false);
  DummyApiProvider get dummyApiProviderListener => Provider.of<DummyApiProvider>(context!, listen: true);
}
