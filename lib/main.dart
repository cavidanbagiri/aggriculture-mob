import 'package:client_mob/models/fruveg_model.dart';
import 'package:client_mob/models/user_model.dart';
import 'package:client_mob/providers/user_notifier.dart';
import 'package:client_mob/services/fruveg_service.dart';
import 'package:client_mob/widgets/custom_buttom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';


final pageProvider = StateProvider<int>((ref) => 0);


final userProvider = StateNotifierProvider<UserNotifier, UserModel>((ref) => UserNotifier());


final fruvegProvider = FutureProvider.family<List<FruVegModel>, BuildContext>((ref, context) async{
  return FruVegService.fetchFruVeg(context: context);
});
final fruvegvalueProvider = StateProvider((ref) => 2);



void main() {
  runApp(const ProviderScope (child: MyApp()));
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
      home: const CustomBottomNavigationBar()
    );
  }
}
