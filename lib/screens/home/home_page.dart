import 'dart:async';

import 'package:client_mob/main.dart';
import 'package:client_mob/models/categories_model.dart';
import 'package:client_mob/models/fruveg_model.dart';
import 'package:client_mob/screens/home/widgets/fruitsorvegetables_view.dart';
import 'package:client_mob/screens/home/widgets/product_view.dart';
import 'package:client_mob/screens/home/widgets/category_container.dart';
import 'package:client_mob/screens/home/widgets/product_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomePage extends ConsumerStatefulWidget {
  const HomePage({super.key});

  @override
  ConsumerState<HomePage> createState() => _HomePageState();
}

class _HomePageState extends ConsumerState<HomePage> {
  @override
  Widget build(BuildContext context) {
    final user = ref.watch(userProvider);
    final AsyncValue<List<CategoriesModel>> categories = ref.watch(categoriesProvider);
    // final AsyncValue<List<FruVegModel>> fruveg =
    //     ref.watch(fruvegProvider(context));
    const categoryWidgets = [
      ProductView(),
      FruitsOrVegetablesView(),
      FruitsOrVegetablesView(),
      FruitsOrVegetablesView(),
      FruitsOrVegetablesView(),
      FruitsOrVegetablesView(),
    ];


    Future<String> getUsername() async {
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      print('access token ${prefs.getString('x-auth-token')}');
      return prefs.getString('x-auth-token') ?? 'unknown';
    }

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
            'Home',
            style: TextStyle(color: Colors.white),
          ),
          backgroundColor: Colors.purpleAccent,
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                const SizedBox(
                  height: 10,
                ),
                const Text('Sell You product',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),),
                // SizedBox(
                //   width: MediaQuery.of(context).size.width,
                //   child: Text(
                //     'Welcome Back ${getUsername()}',
                //     style: const TextStyle(
                //       fontSize: 24,
                //       fontWeight: FontWeight.bold,
                //     ),
                //   ),
                // ),
                const SizedBox(
                  height: 20,
                ),
                categories.when(
                  data: (data) {
                    return Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: data.map((e) {
                        return CategoryContainer(containerName: e.category_name, categoryWidgetView: categoryWidgets[e.id-1]);
                      }).toList(),
                    );
                    // return Row(
                    //   mainAxisAlignment: MainAxisAlignment.spaceAround,
                    //   children: [
                    //     CategoryContainer(
                    //       containerName: 'Add product',
                    //       categoryWidgetView: AddNewProductView(),
                    //     ),
                    //     CategoryContainer(
                    //       containerName: 'Sell Fruit and Vegetable',
                    //       categoryWidgetView: SellFruitVegetableView(),
                    //     ),
                    //   ],
                    // );
                    // return DropdownButton(
                    //   value: ref.watch(fruvegvalueProvider),
                    //   items: data
                    //       .map(
                    //         (e) => DropdownMenuItem(
                    //           value: e.id,
                    //           child: Text(e.name),
                    //         ),
                    //       )
                    //       .toList(),
                    //   onChanged: (value) {
                    //     ref.read(fruvegvalueProvider.notifier).state = value!;
                    //   },
                    // );
                  },
                  error: (error, stackTrace) {
                    return Text(stackTrace.toString());
                  },
                  loading: () {
                    return const CircularProgressIndicator();
                  },
                ),
                // const Row(
                //   mainAxisAlignment: MainAxisAlignment.spaceAround,
                //   children: [
                //     CategoryContainer(
                //       containerName: 'Add product',
                //       categoryWidgetView: ProductView(),
                //     ),
                //     CategoryContainer(
                //       containerName: 'Sell Fruit and Vegetable',
                //       categoryWidgetView: FruitsOrVegetablesView(),
                //     ),
                //   ],
                // ),
                const SizedBox(
                  height: 10,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
