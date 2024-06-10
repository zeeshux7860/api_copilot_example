import 'provider_callback.dart';

import 'package:myapp/api/model/products/get_all.dart';
import 'package:myapp/api/model/products/single_product.dart';
import 'package:myapp/api/model/products/search_products.dart';

import 'package:myapp/api/model/cart/get_my_cart.dart';

import 'package:myapp/api/model/add_product.dart';

class GetCallBackProvider extends CallBackProvider {
  static final GetCallBackProvider _instance = GetCallBackProvider();

  // getter of this class
  /// [instance] is used to get instance of this class
  static GetCallBackProvider get instance => _instance;

  //  Products Provider
  GetAllModel? get getAllModel => productsProviderListener.getAllModel;
  SingleProductModel? get singleProductModel => productsProviderListener.singleProductModel;
  SearchProductsModel? get searchProductsModel => productsProviderListener.searchProductsModel;

  //  Cart Provider
  GetMyCartModel? get getMyCartModel => cartProviderListener.getMyCartModel;

  //  DummyApi Provider
  AddProductModel? get addProductModel => dummyApiProviderListener.addProductModel;
}
