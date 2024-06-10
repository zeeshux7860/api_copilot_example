import 'package:flutter/material.dart';
import 'package:test_app/api/util/provider_callback.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  void initState() {
    callBackProvider.productsProviderWithoutListener.getAll();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var ds = callBackProvider.getAllModel;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Page'),
      ),
      body: ds == null
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : ListView.builder(
              itemCount: ds.products!.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(ds.products![index].title!),
                  leading: CircleAvatar(
                    backgroundImage: NetworkImage(ds.products![index].thumbnail!),
                  ),
                  // subtitle: Text(ds.products![index].description!),
                );
              },
            ),
    );
  }
}
