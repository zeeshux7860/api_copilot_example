import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:myapp/api/model/cart/get_my_cart.dart';
import 'package:myapp/api/query/cart/get_my_cart.dart';

class CartProvider extends ChangeNotifier {
GetMyCartModel? getMyCartModel;


Future<GetMyCartModel?> getMyCart() async {
   try {
   var response = await fetchGetMyCartMethod();
   if (response.statusCode == 200) {
         getMyCartModel = GetMyCartModel.fromJson(json.decode(response.body));
  notifyListeners(); 
    var result = GetMyCartModel.fromJson(json.decode(response.body));
        return result;
   } else {
    // throw Exception('Failed to load data');
    // handling error
     getMyCartModel = GetMyCartModel.fromJson(json.decode(response.body));
  notifyListeners(); 

  var result = GetMyCartModel.fromJson(json.decode(response.body));
        return result;
   }
  } catch (e) {
    if (e is String) {
      throw Exception(e);
    } else {
      throw Exception(e.toString());

  }}
 
          }
          


}
