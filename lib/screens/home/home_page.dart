import 'dart:async';

import 'package:client_mob/main.dart';
import 'package:client_mob/models/categories_model.dart';
import 'package:client_mob/screens/home/views/fruitsorvegetables_view.dart';
import 'package:client_mob/screens/home/views/product_view.dart';
import 'package:client_mob/screens/home/widgets/category_container.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
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
    final AsyncValue<List<CategoriesModel>> categories =
        ref.watch(categoriesProvider);

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

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Home',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.purpleAccent,
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              const SizedBox(
                height: 10,
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Categories',
                      style: GoogleFonts.poppins(
                          fontWeight: FontWeight.w600, fontSize: 26),
                    ),
                    Text(
                      'See all',
                      style: GoogleFonts.rubik(
                          fontWeight: FontWeight.w400,
                          fontSize: 14,
                          color: Colors.blueGrey
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    CategoryContainer(id:1, categoryWidgetView: categoryWidgets[0], category: 'Products', background_color: Colors.greenAccent[200], image_name: Icons.headphones, icon_color: Colors.green,),
                    CategoryContainer(id:2, categoryWidgetView: categoryWidgets[1], category: 'Fruit & Vegetable', background_color: Colors.deepPurpleAccent[100], image_name: Icons.apple, icon_color: Colors.deepPurple,),
                    CategoryContainer(id:3, categoryWidgetView: categoryWidgets[2], category: 'Technical Service', background_color: Colors.blueAccent[100], image_name: Icons.heart_broken, icon_color: Colors.blue,),
                    CategoryContainer(id:4, categoryWidgetView: categoryWidgets[3], category: 'Transport Service', background_color: Colors.orangeAccent[100], image_name: Icons.car_rental, icon_color: Colors.orange,),
                    CategoryContainer(id:5, categoryWidgetView: categoryWidgets[4], category: 'IT Support', background_color: Colors.redAccent[100], image_name: Icons.heart_broken, icon_color: Colors.red,),
                  ],
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Last Added',
                      style: GoogleFonts.poppins(
                          fontWeight: FontWeight.w600, fontSize: 26),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
