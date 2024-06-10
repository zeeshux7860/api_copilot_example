import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:test_app/api/model/add_product.dart';
import 'package:test_app/api/query/add_product.dart';

class DummyApiProvider extends ChangeNotifier {
  AddProductModel? addProductModel;

  Future<AddProductModel?> addProduct(
      {required ParamsAddProduct params, Map<String, String>? headers}) async {
    try {
      var response =
          await fetchAddProductMethod(params: params, headers: headers);
      if (response.statusCode == 200) {
        addProductModel = AddProductModel.fromJson(json.decode(response.body));
        notifyListeners();
        var result = AddProductModel.fromJson(json.decode(response.body));
        return result;
      } else {
        // throw Exception('Failed to load data');
        // handling error
        addProductModel = AddProductModel.fromJson(json.decode(response.body));
        notifyListeners();

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
