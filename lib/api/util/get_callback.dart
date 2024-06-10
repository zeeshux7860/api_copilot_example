import 'package:get/get.dart';

import 'package:myapp/api/get_controller/products.dart';
import 'package:myapp/api/get_controller/cart.dart';
import 'package:myapp/api/get_controller/dummy_api.dart';
import 'get_callback_get_x.dart';

var callBackGetx = GetCallBackGetx.instance;

class CallBackGetx {
  // instance of this class
  static final CallBackGetx _instance = CallBackGetx();

  // getter of this class
  /// [instance] is used to get instance of this class
  static CallBackGetx get instance => _instance;

  final productsController = Get.find<ProductsController>();
  final cartController = Get.find<CartController>();
  final dummyApiController = Get.find<DummyApiController>();
}
