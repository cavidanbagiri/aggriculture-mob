

import 'package:client_mob/models/product_model.dart';
import 'package:client_mob/services/card_sevice.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ProductContainer extends ConsumerWidget {
  final ProductModel pm;
  const ProductContainer({super.key, required this.pm});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Column(
      children: [
        GestureDetector(
          onTap: () async{
            final data = {
              "userId": pm.userId,
              "categoryId": pm.categoryId,
              "selectedId": pm.id
            };
            CardService.addCard(context, data);
          },
          child: Container(
            width: MediaQuery.of(context).size.width*0.8,
            height: MediaQuery.of(context).size.width*0.3,
            margin: const EdgeInsets.only(top: 5),
            color: Colors.blue,
            child: Text(pm.product_name),
          ),
        ),
        IconButton(onPressed: (){
        }, icon: const Icon(Icons.heart_broken)),
      ],
    );
  }
}