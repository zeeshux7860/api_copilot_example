import 'package:get/get.dart';

import 'package:test_app/api/get_controller/products.dart';
import 'package:test_app/api/get_controller/cart.dart';
import 'package:test_app/api/get_controller/dummy_api.dart';

var callBackGetx = CallBackGetx.instance;

class CallBackGetx {
  /// init method
  ///  [config] is required to get callback from phonepe gateway app to your app after payment is done or failed or cancelled by user or by phonepe gateway app itself due to some error or any other reason
  void init() {
    Get.lazyPut(() => ProductsController());
    Get.lazyPut(() => CartController());
    Get.lazyPut(() => DummyApiController());
  }

  void check() {
    // put or not
    var check = Get.isRegistered<ProductsController>();
    print('ProductsController isRegistered: $check');
  }

  // instance of this class
  static final CallBackGetx _instance = CallBackGetx();

  // getter of this class
  /// [instance] is used to get instance of this class
  static CallBackGetx get instance => _instance;

  final productsController = Get.find<ProductsController>();
  final cartController = Get.find<CartController>();
  final dummyApiController = Get.find<DummyApiController>();
}
