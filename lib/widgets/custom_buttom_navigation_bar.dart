import 'package:client_mob/main.dart';
import 'package:client_mob/screens/home/home_page.dart';
import 'package:client_mob/screens/list/list_page.dart';
import 'package:client_mob/screens/card/card_page.dart';
import 'package:client_mob/screens/profile/profile_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';

class CustomBottomNavigationBar extends ConsumerWidget {
  const CustomBottomNavigationBar({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final page = ref.watch(pageProvider);
    const screens = [
      HomePage(),
      ListPage(),
      CardPage(),
      ProfilePage()
    ];
    return Scaffold(
      body: screens[page],
      bottomNavigationBar: SalomonBottomBar(
        currentIndex: page,
        items: [
          SalomonBottomBarItem(icon: const Icon(Icons.home),  title: const Text('Home'), selectedColor:Colors.purple),
          SalomonBottomBarItem(icon: const Icon(Icons.list), title: const Text('List'), selectedColor:Colors.pink),
          SalomonBottomBarItem(icon: const Icon(Icons.favorite), title: const Text('Cards'), selectedColor:Colors.teal),
          SalomonBottomBarItem(icon: const Icon(Icons.person), title: const Text('Profile'), selectedColor:Colors.orange),
        ],
        onTap: (value) {
          ref.read(pageProvider.notifier).state = value;
        },
      ),
    );
  }
}
