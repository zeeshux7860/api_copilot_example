import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:myapp/api/get_controller/products.dart';
import 'package:myapp/api/get_controller/cart.dart';
import 'package:myapp/api/get_controller/dummy_api.dart';


class GetxApp extends StatelessWidget {
  final Widget child;
  const GetxApp({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
  Get.lazyPut(() => ProductsController());
Get.lazyPut(() => CartController());
Get.lazyPut(() => DummyApiController());

    return Builder(
      builder: (context) {
        return child;
      },
    );
  }
}

