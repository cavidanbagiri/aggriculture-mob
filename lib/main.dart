import 'package:client_mob/models/categories_model.dart';
import 'package:client_mob/models/countries_model.dart';
import 'package:client_mob/models/product_model.dart';
import 'package:client_mob/models/user_model.dart';
import 'package:client_mob/providers/user_notifier.dart';
import 'package:client_mob/services/categories_service.dart';
import 'package:client_mob/services/country_service.dart';
import 'package:client_mob/services/list_service.dart';
import 'package:client_mob/widgets/custom_buttom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// Controle Bottom Navigation Bar Pages
final pageProvider = StateProvider<int>((ref) => 0);

// Control User Information
final userProvider = StateNotifierProvider<UserNotifier, UserModel>((ref) {
  return UserNotifier();
});

// Fetch All Categories and Show in Home Page For Creating a new thing
final categoriesProvider = FutureProvider<List<CategoriesModel>>((ref) {
  return CategoriesService.fetchCategories();
});

// Fetch All Products 
final productsProvider = FutureProvider<List<ProductModel>>((ref){
  return ListService.fetchProducts();
});

final countriesProvider = FutureProvider<List<CountriesModel>>((ref) {
  //print('>> ${CountryService.fetchAllCountries()}');
  return CountryService.fetchAllCountries();
});

// Create New Category, choose unit
final unitProvider = StateProvider<String>((ref) => 'Kg');
final priceProvider = StateProvider<String>((ref) => 'Rub');
final countryValueProvider = StateProvider<int>((ref) => 1);


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
