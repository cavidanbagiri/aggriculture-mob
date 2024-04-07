import 'package:client_mob/main.dart';
import 'package:client_mob/models/countries_model.dart';
import 'package:client_mob/models/product_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ListPage extends ConsumerStatefulWidget {
  const ListPage({super.key});

  @override
  ConsumerState<ListPage> createState() => _ListPageState();
}

class _ListPageState extends ConsumerState<ListPage> {
  @override
  Widget build(BuildContext context) {
    final AsyncValue<List<ProductModel>> products = ref.watch(productsProvider);

    return Scaffold(
      appBar: AppBar(
        title: Text('List'),
      ),
      body: Column(
        children: [
          Center(
            child: products.when(
              data: (data) {
                return Column(
                  children: data.map((e){
                    return Text(e.product_name);
                  }).toList(),
                );
              },
              error: (error, stackTrace) {
                return Text(stackTrace.toString());
              },
              loading: () {
                return const CircularProgressIndicator();
              },
            ),
          ),
        ],
      ),
    );
  }
}
