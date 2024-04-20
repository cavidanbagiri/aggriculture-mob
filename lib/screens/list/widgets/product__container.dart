

import 'package:client_mob/models/product_model.dart';
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
          onTap: () {
            print('clicked : ${pm.id}');
          },
          child: Container(
            width: MediaQuery.of(context).size.width*0.8,
            height: MediaQuery.of(context).size.width*0.3,
            margin: EdgeInsets.only(top: 5),
            color: Colors.blue,
            child: Text(pm.product_name),
          ),
        ),
        IconButton(onPressed: (){
        }, icon: Icon(Icons.heart_broken)),
      ],
    );
  }
}