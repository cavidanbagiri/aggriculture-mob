import 'package:client_mob/models/categories_model.dart';
import 'package:client_mob/models/fruveg_model.dart';
import 'package:client_mob/models/user_model.dart';
import 'package:client_mob/providers/user_notifier.dart';
import 'package:client_mob/services/categories_service.dart';
import 'package:client_mob/services/fruveg_service.dart';
import 'package:client_mob/widgets/custom_buttom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// Controle Bottom Navigation Bar Pages
final pageProvider = StateProvider<int>((ref) => 0);

// Control User Information
final userProvider = StateNotifierProvider<UserNotifier, UserModel>((ref) {
  return UserNotifier();
});

// Show All Fruits and Vegetables For Creating Selling
final fruvegProvider = FutureProvider.family<List<FruVegModel>, BuildContext>(
    (ref, context) async {
  return FruVegService.fetchFruVeg(context: context);
});
final fruvegvalueProvider = StateProvider((ref) => 1);


// Fetch All Categories and Show in Home Page For Creating a new thing
final categoriesProvider = FutureProvider<List<CategoriesModel>>((ref) {
  print('categories fetch already work');
  return CategoriesService.fetchCategories();
  // return CategoriesModel(id: 0, category_name: 'Unknown');
});


// Create New Category, choose unit
final unitProvider = StateProvider<String>((ref) => 'Kg');



void main() {
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: const CustomBottomNavigationBar());
  }
}
