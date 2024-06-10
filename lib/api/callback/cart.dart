import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:test_app/api/model/cart/get_my_cart.dart';
import 'package:test_app/api/query/cart/get_my_cart.dart';

class CallBackCart {
  Future<GetMyCartModel?> getMyCart() async {
    try {
      var response = await fetchGetMyCartMethod();
      if (response.statusCode == 200) {
        var result = GetMyCartModel.fromJson(json.decode(response.body));
        return result;
      } else {
        // throw Exception('Failed to load data');
        // handling error

        var result = GetMyCartModel.fromJson(json.decode(response.body));
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
