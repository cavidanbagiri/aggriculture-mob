import 'package:client_mob/screens/card/widgets/card_container.dart';
import 'package:client_mob/services/card_sevice.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final cardProvider = FutureProvider<CardService>((ref) {
  final some = CardService.showCards();
  return some;
});

class CardPage extends ConsumerWidget {
  const CardPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Card'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              margin: const EdgeInsets.fromLTRB(16, 4, 8, 4),
              child:const Text('Total Card 18', style: TextStyle(
                fontSize: 26,
              ),),
            ),
            CardContainer(),
            CardContainer(),
            CardContainer(),
            CardContainer(),
          ],
        ),
      ),
    );
  }
}
