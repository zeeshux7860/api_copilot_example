import 'dart:convert';

import 'package:get/get.dart';

import 'package:test_app/api/model/add_product.dart';
import 'package:test_app/api/query/add_product.dart';

class DummyApiController extends GetxController {
  var addProductModel = AddProductModel().obs;

  Future<AddProductModel?> addProduct(
      {required ParamsAddProduct params, Map<String, String>? headers}) async {
    try {
      var response =
          await fetchAddProductMethod(params: params, headers: headers);
      if (response.statusCode == 200) {
        addProductModel.value =
            AddProductModel.fromJson(json.decode(response.body));
        refresh();
        var result = AddProductModel.fromJson(json.decode(response.body));
        return result;
      } else {
        // throw Exception('Failed to load data');
        // handling error
        addProductModel.value =
            AddProductModel.fromJson(json.decode(response.body));
        refresh();

        var result = AddProductModel.fromJson(json.decode(response.body));
        return result;
      }
    } catch (e) {
      if (e is String) {
        throw Exception(e);
      } else {
        throw Exception(e.toString());
      }
    }
  }
}
