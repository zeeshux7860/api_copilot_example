import 'package:http/http.dart';

import 'package:myapp/api/util/global_handler.dart';

Future<Response> fetchGetAllMethod() async {
  // This is the url that will be called:
  var url = "https://dummyjson.com/products";
  //  Requesting data from the server:
  var response = await GlobalHandler.requestGet(
      path: Uri.parse(url).replace(), headersValue: {});

  // This is the response of the request:
  return response;
}
