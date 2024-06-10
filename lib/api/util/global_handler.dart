import 'dart:html' if (dart.library.io) 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import 'package:http_parser/http_parser.dart';

Map<String, String> headersValue = {};
String baseUrl = "";

class GlobalHandler {
  static Future setToken(String token) async {
    await SharedPreferences.getInstance().then((prefs) {
      prefs.setString("token", token);
      prefs.setBool("is_loggedin", true);
    });
  }

  static Future<String?> getToken() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var token = prefs.getString("token");
    return token;
  }

  static logout(BuildContext context) async {
    await SharedPreferences.getInstance().then((prefs) {
      prefs.clear();

      // Get.offAll(LoginPage());
    });
  }

  static Future<bool> checkLogedin() async {
    var prefs = await SharedPreferences.getInstance();
    var isLogedin = prefs.getBool("is_loggedin");
    return isLogedin ?? false;
  }

  static Future<Map<String, String>?> getHeaders() async {
    var token = await getToken();
    headersValue = {
      "Accept": "application/json",
      'auth-token': token ?? "",
      // 'Content-Type': 'application/x-www-form-urlencoded'
    };
    return headersValue;
  }

  static Future<http.Response> requestPost(
      {required Uri path,
      Object? body,
      Map<String, String>? headersValue}) async {
    var headers = await getHeaders();
    headers!.addAll(headersValue ?? {});
    var response = await http.post(
      path,
      body: body,
      headers: headers,
    );

    return response;
  }

  static Future<http.Response> requestGet(
      {required Uri path, Map<String, String>? headersValue}) async {
    var headers = await getHeaders();
    headers!.addAll(headersValue ?? {});
    var response = await http.get(
      path,
      headers: headers,
    );
    return response;
  }

  static Future<http.Response> requestPut(
      {required Uri path,
      Object? body,
      Map<String, String>? headersValue}) async {
    var headers = await getHeaders();
    headers!.addAll(headersValue ?? {});
    var response = await http.put(
      path,
      body: body,
      headers: headers,
    );
    return response;
  }

  static Future<http.Response> requestDelete(
      {required Uri path,
      Object? body,
      Map<String, String>? headersValue}) async {
    var headers = await getHeaders();
    headers!.addAll(headersValue ?? {});
    var response = await http.delete(
      path,
      body: body,
      headers: headers,
    );
    return response;
  }

  static Future<http.Response> requestPatch(
      {required Uri path,
      Object? body,
      Map<String, String>? headersValue}) async {
    var headers = await getHeaders();
    headers!.addAll(headersValue ?? {});
    var response = await http.patch(
      path,
      body: body,
      headers: headers,
    );
    return response;
  }

  static Future<CustomResponse> requestUpload(
      {required Uri path,
      Map<String, dynamic>? body,
      Map<String, dynamic>? bodyFile,
      Map<String, String>? headersValue,
      required String method}) async {
    var headers = await getHeaders();

    headers!.addAll(headersValue ?? {});
    var request = http.MultipartRequest(method, path);
    request.headers.addAll(headers);
    request.fields.addAll(Map.fromEntries(
        body!.entries.map((e) => MapEntry(e.key, e.value.toString()))));

    if (kIsWeb) {
      // await Future.forEach(bodyFile!.entries, (entry) async {
      //   var name = await getMimeType(entry.value.toString());
      //   var byte = await blobToByteArray(entry.value.toString());
      //   request.files.add(http.MultipartFile.fromBytes(
      //     entry.key,
      //     byte, // Convert to bytes
      //     filename: entry.value.toString().split("/").last + "." + name.split("/").last,
      //     contentType: MediaType.parse(name), // Parse MIME type
      //   ));
      // });
    } else {
      await Future.forEach(bodyFile!.entries, (e) async {
        request.files
            .add(await http.MultipartFile.fromPath(e.key, e.value.toString()));
      });
    }
    // print(request.files.map((e) => e.));
    // print(request.files);
    var response = await request.send();

    // Read response data
    var responseData = await response.stream.bytesToString();

    // Get response status code
    int statusCode = response.statusCode;

    // Get response headers
    Map<String, String> responseHeaders = response.headers;

    // Convert response data to a datatype of your choice (e.g., Map or custom class)
    // Example assuming response data is JSON
    // var jsonResponse = json.encode(responseData); // no need
    print(responseData);
    // Create a CustomResponse object
    CustomResponse customResponse =
        CustomResponse(statusCode, responseHeaders, responseData);

    // Return the custom response
    return customResponse;
  }

  static Future<CustomResponse> requestUploadByte(
      {required Uri path,
      Map<String, dynamic>? body,
      Map<String, dynamic>? bodyFile,
      Map<String, String>? headersValue,
      required String method}) async {
    var headers = await getHeaders();

    headers!.addAll(headersValue ?? {});
    var request = http.MultipartRequest(method, path);
    request.headers.addAll(headers);
    request.fields.addAll(Map.fromEntries(
        body!.entries.map((e) => MapEntry(e.key, e.value.toString()))));

    if (kIsWeb) {
      await Future.forEach(bodyFile!.entries, (entry) async {
        // var name = await getMimeType(entry.value.toString());
        // var byte = await blobToByteArray(entry.value.toString());
        var value = entry.value as PlatformFile;
        request.files.add(http.MultipartFile.fromBytes(
          entry.key,
          value.bytes!, // Convert to bytes
          filename: value.name,
          // contentType: MediaType.parse(value.!), // Parse MIME type
        ));
      });
    } else {
      await Future.forEach(bodyFile!.entries, (e) async {
        request.files
            .add(await http.MultipartFile.fromPath(e.key, e.value.toString()));
      });
    }
    // print(request.files.map((e) => e.));
    // print(request.files);
    var response = await request.send();

    // Read response data
    var responseData = await response.stream.bytesToString();

    // Get response status code
    int statusCode = response.statusCode;

    // Get response headers
    Map<String, String> responseHeaders = response.headers;

    // Convert response data to a datatype of your choice (e.g., Map or custom class)
    // Example assuming response data is JSON
    // var jsonResponse = json.encode(responseData); // no need
    print(responseData);
    // Create a CustomResponse object
    CustomResponse customResponse =
        CustomResponse(statusCode, responseHeaders, responseData);

    // Return the custom response
    return customResponse;
  }

  static Future<http.Response> requestDownload(Uri path) async {
    var headers = await getHeaders();
    var response = await http.get(
      path,
      headers: headers,
    );
    return response;
  }

  static void navigatorPush(BuildContext context, Widget child) {
    Navigator.push(context, MaterialPageRoute(
      builder: (context) {
        return child;
      },
    ));
  }

  static void navigatorPushReplacement(BuildContext context, Widget child) {
    Navigator.pushReplacement(context, MaterialPageRoute(
      builder: (context) {
        return child;
      },
    ));
  }
}

class CustomResponse {
  int statusCode;
  Map<String, String> headers;
  dynamic body;

  CustomResponse(this.statusCode, this.headers, this.body);
}

// Future<String> getMimeType(String url) async {
//   // Implement logic to fetch MIME type
//   // For web, you can use Blob
//   if (kIsWeb) {
//     Blob blob = await HttpRequest.request(url, responseType: 'blob').then((request) => request.response);
//     return blob.type;
//   } else {
//     // For non-web platforms, you can use a different approach
//     // For example, you can use path package to get extension and map it to MIME type
//     // Example: return 'image/jpeg' for '.jpg', 'image/png' for '.png', etc.
//     return ''; // Replace with actual implementation
//   }
// }

// Future<Uint8List> blobToByteArray(String blobUrl) async {
//   try {
//     // Fetch the Blob data
//     final response = await HttpRequest.request(blobUrl, responseType: 'blob');
//     final blob = response.response;

//     // Convert Blob data to byte array
//     final reader = FileReader();
//     reader.readAsArrayBuffer(blob);

//     // Wait for FileReader to load the data
//     await reader.onLoad.first;

//     // Get the result as byte array
//     final byteArray = Uint8List.fromList(reader.result as List<int>);

//     return byteArray;
//   } catch (error) {
//     print('Error converting Blob to byte array: $error');
//     rethrow;
//   }
// }
