import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test_app/api/util/get_x.dart';
import 'package:test_app/api/util/navigator_observer.dart';
import 'package:test_app/api/util/provider.dart';
import 'package:test_app/get_x.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetxApp(
      child: GetMaterialApp(
        // home: const MyHomePage(),
        navigatorObservers: [NavigationObserver()],
        initialRoute: '/',
        routes: {
          '/': (context) => const MyHomePage(),
        },
      ),
    );
  }
}
