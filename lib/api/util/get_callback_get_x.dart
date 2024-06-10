import 'package:get/get.dart';
import 'package:myapp/api/model/products/get_all.dart';
import 'package:myapp/api/model/products/single_product.dart';
import 'package:myapp/api/model/products/search_products.dart';

import 'package:myapp/api/model/cart/get_my_cart.dart';

import 'package:myapp/api/model/add_product.dart';

import 'get_callback.dart';

class GetCallBackGetx extends CallBackGetx {
  static final GetCallBackGetx _instance = GetCallBackGetx();

  // getter of this class
  /// [instance] is used to get instance of this class
  static GetCallBackGetx get instance => _instance;

  //  Products Controller
  Rxn<GetAllModel> get getAllModel => productsController.getAllModel;
  Rxn<SingleProductModel> get singleProductModel => productsController.singleProductModel;
  Rxn<SearchProductsModel> get searchProductsModel => productsController.searchProductsModel;

  //  Cart Controller
  Rxn<GetMyCartModel> get getMyCartModel => cartController.getMyCartModel;

  //  DummyApi Controller
  Rxn<AddProductModel> get addProductModel => dummyApiController.addProductModel;
}
