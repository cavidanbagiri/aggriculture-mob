// import 'dart:convert';

import 'package:client_mob/models/item_model.dart';


class ProductModel {

  final ItemModel item_model;
  
  ProductModel({
    required this.item_model,
  });

  


  // Map<String, dynamic> toMap() {
  //   return <String, dynamic>{
  //     'item_model': item_model.toMap(),
  //   };
  // }

  // factory ProductModel.fromMap(Map<String, dynamic> map) {
  //   return ProductModel(
  //     item_model: ItemModel.fromMap(map['item_model'] as Map<String,dynamic>),
  //   );
  // }

  // String toJson() => json.encode(toMap());

  // factory ProductModel.fromJson(String source) => ProductModel.fromMap(json.decode(source) as Map<String, dynamic>);

}

// import 'dart:convert';


// class ProductModel {

//   final int id;
//   final String product_name;
//   final double amount;
//   final String unit;
//   final double price;
//   final String currency;
//   final String comment;
//   final bool status;
//   final int categoryId;
//   final String category_name;
//   final String country_name;
//   final int userId;
//   ProductModel({
//     required this.id,
//     required this.product_name,
//     required this.amount,
//     required this.unit,
//     required this.price,
//     required this.currency,
//     required this.comment,
//     required this.status,
//     required this.categoryId,
//     required this.category_name,
//     required this.country_name,
//     required this.userId,
//   });




//   Map<String, dynamic> toMap() {
//     return <String, dynamic>{
//       'id': id,
//       'product_name': product_name,
//       'amount': amount,
//       'unit': unit,
//       'price': price,
//       'currency': currency,
//       'comment': comment,
//       'status': status,
//       'categoryId': categoryId,
//       'category_name': category_name,
//       'country_name': country_name,
//       'userId': userId,
//     };
//   }

//   factory ProductModel.fromMap(Map<String, dynamic> map) {
//     return ProductModel(
//       id: map['id'] as int,
//       product_name: map['product_name'] as String,
//       amount: map['amount'] as double,
//       unit: map['unit'] as String,
//       price: map['price'] as double,
//       currency: map['currency'] as String,
//       comment: map['comment'] as String,
//       status: map['status'] as bool,
//       categoryId: map['categoryId'] as int,
//       category_name: map['category_name'] as String,
//       country_name: map['country_name'] as String,
//       userId: map['userId'] as int,
//     );
//   }

//   String toJson() => json.encode(toMap());

//   factory ProductModel.fromJson(String source) => ProductModel.fromMap(json.decode(source) as Map<String, dynamic>);

//   @override
//   String toString() {
//     return 'ProductModel(id: $id, product_name: $product_name, amount: $amount, unit: $unit, price: $price, currency: $currency, comment: $comment, status: $status, categoryId: $categoryId, category_name: $category_name, country_name: $country_name, userId: $userId)';
//   }
// }
