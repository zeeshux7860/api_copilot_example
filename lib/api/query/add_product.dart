import 'dart:convert';

import 'package:http/http.dart';

import 'package:myapp/api/query/params/add_product.dart';
export 'package:myapp/api/query/params/add_product.dart';
import 'package:myapp/api/util/global_handler.dart';

Future<Response> fetchAddProductMethod(
    {required ParamsAddProduct params, Map<String, String>? headers}) async {
  // This is the url that will be called:
  var url = "https://dummyjson.com/products/add";

  //  Requesting data from the server:
  var response = await GlobalHandler.requestPost(
      path: Uri.parse(url).replace(),
      body: params.body!.toJson(),
      headersValue: headers);

  // This is the response of the request:
  return response;
}
