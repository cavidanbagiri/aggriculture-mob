

import 'package:client_mob/models/item_model.dart';
// import 'package:client_mob/models/product_model.dart';
import 'package:client_mob/services/card_sevice.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ItemContainer extends ConsumerWidget {
  final ItemModel im;
  const ItemContainer({super.key, required this.im});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Column(
      children: [
        GestureDetector(
          onTap: () async{
            final data = {
              "userId": im.userId,
              "itemsId": im.id,
            };
            CardService.addCard(context, data);
          },
          child: Container(
            width: MediaQuery.of(context).size.width*0.8,
            height: MediaQuery.of(context).size.width*0.3,
            margin: const EdgeInsets.only(top: 5),
            color: Colors.blue,
            child: Column(
              children: [
                Container(
                  child: Text(im.name),
                ),
                Container(
                  child: Text(im.user_name),
                ),
                Container(
                  child: Text(im.category_name),
                ),
                Container(
                  child: Text(im.price.toString()),
                ),
              ],
            ),
          ),
        ),
        IconButton(onPressed: (){
        }, icon: const Icon(Icons.heart_broken)),
      ],
    );
  }
}