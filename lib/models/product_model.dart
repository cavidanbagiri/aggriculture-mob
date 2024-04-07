import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first


class ProductModel {

  final int id;
  final String product_name;
  final double amount;
  final String unit;
  final double price;
  final String currency;
  final String comment;
  final bool status;
  final int categoryId;
  final int userId;
  ProductModel({
    required this.id,
    required this.product_name,
    required this.amount,
    required this.unit,
    required this.price,
    required this.currency,
    required this.comment,
    required this.status,
    required this.categoryId,
    required this.userId,
  });




  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'product_name': product_name,
      'amount': amount,
      'unit': unit,
      'price': price,
      'currency': currency,
      'comment': comment,
      'status': status,
      'categoryId': categoryId,
      'userId': userId,
    };
  }

  factory ProductModel.fromMap(Map<String, dynamic> map) {
    return ProductModel(
      id: map['id'] as int,
      product_name: map['product_name'] as String,
      amount: map['amount'] as double,
      unit: map['unit'] as String,
      price: map['price'] as double,
      currency: map['currency'] as String,
      comment: map['comment'] as String,
      status: map['status'] as bool,
      categoryId: map['categoryId'] as int,
      userId: map['userId'] as int,
    );
  }

  String toJson() => json.encode(toMap());

  factory ProductModel.fromJson(String source) => ProductModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'ProductModel(id: $id, product_name: $product_name, amount: $amount, unit: $unit, price: $price, currency: $currency, comment: $comment, status: $status, categoryId: $categoryId, userId: $userId)';
  }
}
