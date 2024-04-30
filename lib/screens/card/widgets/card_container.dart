

import 'package:client_mob/models/card_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CardContainer extends ConsumerWidget {
  //final CardModel card_model;
  //const CardContainer({super.key, required this.card_model});
  //final CardModel card_model;
  const CardContainer({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    const image_link = 'https://samsgardenstore.com/wp-content/uploads/2020/12/Regular-Tomato-Desi-Vegetable-Seeds.webp';
    return Container(
      margin: EdgeInsets.all(8),
      padding: EdgeInsets.all(4),
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(Radius.circular(16.0)),
        color: Colors.black38,
      ),
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.width * 0.6,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Image.network(image_link,width: MediaQuery.of(context).size.width*0.3,),
          Text('Tomato'),
          Text('12 Ton'),
          Text('134000 Rub')
        ],
      ),
    );
  }
}
