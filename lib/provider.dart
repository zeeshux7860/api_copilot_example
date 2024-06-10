import 'package:flutter/material.dart';
import 'package:myapp/api/util/provider_callback.dart';

class ProviderPage extends StatefulWidget {
  const ProviderPage({super.key});

  @override
  State<ProviderPage> createState() => _ProviderPageState();
}

class _ProviderPageState extends State<ProviderPage> {
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
