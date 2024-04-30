import 'package:client_mob/main.dart';
import 'package:client_mob/models/item_model.dart';
import 'package:client_mob/screens/list/widgets/item_container.dart';
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
    final AsyncValue<List<ItemModel>> products = ref.watch(itemsProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('List'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Center(
              child: products.when(
                data: (data) {
                  return Column(
                    children: data.map((item){
                      return ItemContainer(im: item);
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
      ),
    );
  }
}
