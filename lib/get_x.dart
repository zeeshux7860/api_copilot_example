import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:myapp/api/util/get_callback.dart';

class GetxPage extends StatefulWidget {
  const GetxPage({super.key});

  @override
  State<GetxPage> createState() => _GetxPageState();
}

class _GetxPageState extends State<GetxPage> {
  @override
  void initState() {
    callBackGetx.productsController.getAll();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Obx(
      () {
        var ds = callBackGetx.getAllModel.value;
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
      },
    );
  }
}
