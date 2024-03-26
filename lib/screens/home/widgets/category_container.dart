import 'package:client_mob/screens/home/widgets/product_view.dart';
import 'package:flutter/material.dart';

class CategoryContainer extends StatelessWidget {

  final String containerName;  
  final Widget categoryWidgetView;
  
  const CategoryContainer({super.key, required this.containerName, required this.categoryWidgetView});
  

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        Navigator.of(context).push(MaterialPageRoute(builder: (context) {
          return categoryWidgetView;
        }));
      },
      child: Container(
        width: MediaQuery.of(context).size.width ,
        height: MediaQuery.of(context).size.width * 0.2,
        padding: EdgeInsets.all(2),
        decoration: BoxDecoration(
          color: Colors.white70,
          borderRadius: BorderRadius.circular(6.0),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 3,
              blurRadius: 7,
              offset: Offset(0, 3),
            ),
          ],
        ),
        child: Center(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              textAlign: TextAlign.center,
              containerName,
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ],
        )),
      ),
    );
  }
}
