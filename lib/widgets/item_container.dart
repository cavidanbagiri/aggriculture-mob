

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';

class ItemContainer extends ConsumerWidget {
  const ItemContainer({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    String image = 'https://seed2plant.in/cdn/shop/products/tomatoseeds.jpg?v=1604033216';
    return Container(
      clipBehavior: Clip.antiAlias,
      padding: EdgeInsets.fromLTRB(0,0,0,4),
      margin: EdgeInsets.fromLTRB(4, 10, 4, 10),
      width: MediaQuery.of(context).size.width / 2.30,
      height: MediaQuery.of(context).size.width / 1.7,
      decoration: BoxDecoration(
        color: Colors.white,
          borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            spreadRadius: 1,
            blurRadius: 1,
            offset: Offset(0, 1), // changes position of shadow
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            clipBehavior: Clip.antiAlias,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
            ),
            child: Image.network(image,
              width: MediaQuery.of(context).size.width / 2.25,
              height: MediaQuery.of(context).size.width / 2.7,
              fit: BoxFit.cover,
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
            child: Container(
              child: Expanded(
                child: Text('Fruit Or Vegetables',
                  style: GoogleFonts.inter(
                    fontWeight: FontWeight.w600, fontSize: 14,
                    color: Colors.grey,
                  ),
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
            child: Container(
              //height:  45,
              child: Expanded(
                child: Text('Tomato From Russia Azerbaijan and Dubai',
                        style: GoogleFonts.inter(
                        fontWeight: FontWeight.w600, fontSize: 15,
                        color: Colors.black54,
                        ),
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ),
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                child: Text('1500000', style: GoogleFonts.poppins(
                    fontWeight: FontWeight.w500, fontSize: 16,
                    color: Colors.green
                ),),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(3, 0, 0, 1),
                child: Text('Rub', style: GoogleFonts.poppins(
                    fontWeight: FontWeight.w400, fontSize: 14,
                  color: Colors.green
                ),),
              ),
            ],
          )
        ],
      ),
    );
  }
}
