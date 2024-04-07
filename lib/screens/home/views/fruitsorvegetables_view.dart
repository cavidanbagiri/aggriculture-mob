import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class FruitsOrVegetablesView extends ConsumerStatefulWidget {
  const FruitsOrVegetablesView({super.key});

  @override
  ConsumerState<FruitsOrVegetablesView> createState() => _SellFruitVegetableState();
}

class _SellFruitVegetableState extends ConsumerState<FruitsOrVegetablesView> {
  @override
  Widget build(BuildContext context) {
    return Text('Sell Fruit Vegetable');
  }
}