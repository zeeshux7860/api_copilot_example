import 'package:flutter/material.dart';
import 'package:test_app/api/callback/products.dart';
import 'package:test_app/api/model/products/get_all.dart';

class WithoutStateMangement extends StatefulWidget {
  const WithoutStateMangement({super.key});

  @override
  State<WithoutStateMangement> createState() => _WithoutStateMangementState();
}

class _WithoutStateMangementState extends State<WithoutStateMangement> {
  late GetAllModel? ds;
  @override
  void initState() {
    getData();
    super.initState();
  }

  getData() async {
    ds = await CallBackProducts().getAll();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Page'),
      ),
      body: ds == null
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : ListView.builder(
              itemCount: ds!.products!.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(ds!.products![index].title!),
                  leading: CircleAvatar(
                    backgroundImage: NetworkImage(ds!.products![index].thumbnail!),
                  ),
                );
              },
            ),
    );
  }
}
