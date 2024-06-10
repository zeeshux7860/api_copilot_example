import 'package:http/http.dart';

import 'package:test_app/api/util/global_handler.dart';

Future<Response> fetchSingleProductMethod() async {
  // This is the url that will be called:
  var url = "https://dummyjson.com/products/1";
  //  Requesting data from the server:
  var response = await GlobalHandler.requestGet(
      path: Uri.parse(url).replace(), headersValue: {});

  // This is the response of the request:
  return response;
}
