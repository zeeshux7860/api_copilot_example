import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:test_app/api/get_controller/cart.dart';
import 'package:test_app/api/get_controller/dummy_api.dart';
import 'package:test_app/api/get_controller/products.dart';

import 'package:test_app/api/provider/products.dart';
import 'package:test_app/api/provider/cart.dart';
import 'package:test_app/api/provider/dummy_api.dart';
import 'package:test_app/api/util/get_callback.dart';

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
