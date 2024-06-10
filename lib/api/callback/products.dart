import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:myapp/api/model/products/get_all.dart';
import 'package:myapp/api/query/products/get_all.dart';
import 'package:myapp/api/model/products/single_product.dart';
import 'package:myapp/api/query/products/single_product.dart';
import 'package:myapp/api/model/products/search_products.dart';
import 'package:myapp/api/query/products/search_products.dart';

class CallBackProducts {
  Future<GetAllModel?> getAll() async {
    try {
      var response = await fetchGetAllMethod();
      if (response.statusCode == 200) {
        var result = GetAllModel.fromJson(json.decode(response.body));
        return result;
      } else {
        // throw Exception('Failed to load data');
        // handling error

        var result = GetAllModel.fromJson(json.decode(response.body));
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

  Future<SingleProductModel?> singleProduct() async {
    try {
      var response = await fetchSingleProductMethod();
      if (response.statusCode == 200) {
        var result = SingleProductModel.fromJson(json.decode(response.body));
        return result;
      } else {
        // throw Exception('Failed to load data');
        // handling error

        var result = SingleProductModel.fromJson(json.decode(response.body));
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

  Future<SearchProductsModel?> searchProducts(
      {required ParamsSearchProducts params}) async {
    try {
      var response = await fetchSearchProductsMethod(params: params);
      if (response.statusCode == 200) {
        var result = SearchProductsModel.fromJson(json.decode(response.body));
        return result;
      } else {
        // throw Exception('Failed to load data');
        // handling error

        var result = SearchProductsModel.fromJson(json.decode(response.body));
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
