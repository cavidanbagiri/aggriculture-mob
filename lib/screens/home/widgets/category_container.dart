

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';

class CategoryContainer extends ConsumerWidget {
  final int id;
  final Widget categoryWidgetView;
  final String category;
  final IconData? image_name;
  final Color? background_color;
  final Color? icon_color;
  const CategoryContainer({super.key,
    required this.id,
    required this.categoryWidgetView,
    required this.category,
    required this.image_name,
    required this.background_color,
    required this.icon_color});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return InkWell(
      onTap: (){
        Navigator.of(context).push(MaterialPageRoute(builder: (context) {
          return categoryWidgetView;
        }));
      },
      child: Container(
          padding: const EdgeInsets.all(2),
          margin: const EdgeInsets.fromLTRB(5, 0, 5, 0),
          decoration: BoxDecoration(
            color: background_color,
            borderRadius: BorderRadius.circular(10.0),
          ),
          child: Column(
            children: [
              Container(
                width: MediaQuery.of(context).size.width * 0.20,
                height: MediaQuery.of(context).size.width * 0.13,
                child: Icon(
                  image_name,
                  color: icon_color,
                  size: MediaQuery.of(context).size.width * 0.13,
                ),
              ),
              Center(
                child: Container(
                  alignment: Alignment.center,
                  width: MediaQuery.of(context).size.width * 0.18,
                  height: MediaQuery.of(context).size.width * 0.10,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  child: Text(category, textAlign: TextAlign.center,style: GoogleFonts.poppins(color: Colors.white, fontWeight: FontWeight.w500),),
                ),
              )
            ],
          ),
        ),
    );
  }
}
