import 'dart:convert';

import 'package:get/get.dart';

import 'package:myapp/api/model/products/get_all.dart';
import 'package:myapp/api/query/products/get_all.dart';
import 'package:myapp/api/model/products/single_product.dart';
import 'package:myapp/api/query/products/single_product.dart';
import 'package:myapp/api/model/products/search_products.dart';
import 'package:myapp/api/query/products/search_products.dart';

class ProductsController extends GetxController {
var getAllModel = Rxn<GetAllModel>();
var singleProductModel = Rxn<SingleProductModel>();
var searchProductsModel = Rxn<SearchProductsModel>();


Future<GetAllModel?> getAll() async {
   try {
   var response = await fetchGetAllMethod();
   if (response.statusCode == 200) {
         getAllModel.value = GetAllModel.fromJson(json.decode(response.body));
  refresh(); 
    var result = GetAllModel.fromJson(json.decode(response.body));
        return result;
   } else {
    // throw Exception('Failed to load data');
    // handling error
     getAllModel.value = GetAllModel.fromJson(json.decode(response.body));
  refresh(); 

  var result = GetAllModel.fromJson(json.decode(response.body));
        return result;
   }
  } catch (e) {
    if (e is String) {
      throw Exception(e);
    } else {
      throw Exception(e.toString());

  }}
 
          }
          

Future<SingleProductModel?> singleProduct() async {
   try {
   var response = await fetchSingleProductMethod();
   if (response.statusCode == 200) {
         singleProductModel.value = SingleProductModel.fromJson(json.decode(response.body));
  refresh(); 
    var result = SingleProductModel.fromJson(json.decode(response.body));
        return result;
   } else {
    // throw Exception('Failed to load data');
    // handling error
     singleProductModel.value = SingleProductModel.fromJson(json.decode(response.body));
  refresh(); 

  var result = SingleProductModel.fromJson(json.decode(response.body));
        return result;
   }
  } catch (e) {
    if (e is String) {
      throw Exception(e);
    } else {
      throw Exception(e.toString());

  }}
 
          }
          

Future<SearchProductsModel?> searchProducts({required ParamsSearchProducts params }) async {
   try {
   var response = await fetchSearchProductsMethod(params: params );
   if (response.statusCode == 200) {
         searchProductsModel.value = SearchProductsModel.fromJson(json.decode(response.body));
  refresh(); 
    var result = SearchProductsModel.fromJson(json.decode(response.body));
        return result;
   } else {
    // throw Exception('Failed to load data');
    // handling error
     searchProductsModel.value = SearchProductsModel.fromJson(json.decode(response.body));
  refresh(); 

  var result = SearchProductsModel.fromJson(json.decode(response.body));
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
