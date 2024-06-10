import 'package:http/http.dart';

import 'package:test_app/api/query/params/search_products.dart';
export 'package:test_app/api/query/params/search_products.dart';
import 'package:test_app/api/util/global_handler.dart';

Future<Response> fetchSearchProductsMethod(
    {required ParamsSearchProducts params}) async {
  // This is the url that will be called:
  var url = "https://dummyjson.com/products/search?q=Laptop";
  //  Requesting data from the server:
  var response = await GlobalHandler.requestGet(
      path: Uri.parse(url).replace(
        queryParameters: params.query!.toJson(),
      ),
      headersValue: {});

  // This is the response of the request:
  return response;
}
