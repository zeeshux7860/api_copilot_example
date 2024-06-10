import 'package:flutter/material.dart';
import 'package:test_app/api/util/navigator_observer.dart';
import 'package:test_app/api/util/provider.dart';
import 'package:test_app/api/util/provider_callback.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ProviderApp(
      child: MaterialApp(
        navigatorObservers: [NavigationObserver()],
        initialRoute: '/first',
        routes: {
          '/first': (context) => FirstPage(),
          '/second': (context) => SecondPage(),
        },
      ),
    );
  }
}

class FirstPage extends StatefulWidget {
  const FirstPage({super.key});

  @override
  State<FirstPage> createState() => _FirstPageState();
}

class _FirstPageState extends State<FirstPage> {
  @override
  void initState() {
    super.initState();
    getData();
  }

  void getData() async {
    // setState(() {
    callBackProvider.productsProviderWithoutListener.getAll();
    // });
  }

  @override
  Widget build(BuildContext context) {
    var getAllModel = callBackProvider.getAllModel;

    return Scaffold(
      appBar: AppBar(
        title: const Text('First Page'),
      ),
      body: getAllModel == null
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : ListView.builder(
              itemCount: getAllModel.products?.length ?? 0,
              itemBuilder: (context, index) {
                return ListTile(
                  leading: CircleAvatar(
                    backgroundImage:
                        NetworkImage(getAllModel.products![index].thumbnail!),
                  ),
                  title: Text(getAllModel.products![index].title!),
                );
              },
            ),
    );
  }
}

class SecondPage extends StatelessWidget {
  const SecondPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Second Page'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: Text('Go Back to First Page'),
        ),
      ),
    );
  }
}
