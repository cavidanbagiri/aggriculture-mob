import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first


class ItemModel {

  final int id;
  final String name;
  final double amount;
  final String unit;
  final double price;
  final String currency;
  final String comment;
  final bool status;
  final int categoryId;
  final String category_name;
  final String country_name;
  final String user_name;
  final int userId;
  ItemModel({
    required this.id,
    required this.name,
    required this.amount,
    required this.unit,
    required this.price,
    required this.currency,
    required this.comment,
    required this.status,
    required this.categoryId,
    required this.category_name,
    required this.country_name,
    required this.user_name,
    required this.userId,
  });




  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'product_name': name,
      'amount': amount,
      'unit': unit,
      'price': price,
      'currency': currency,
      'comment': comment,
      'status': status,
      'categoryId': categoryId,
      'category_name': category_name,
      'country_name': country_name,
      'user_name': user_name,
      'userId': userId,
    };
  }

  factory ItemModel.fromMap(Map<String, dynamic> map) {
    return ItemModel(
      id: map['id'] as int,
      name: map['name'] as String,
      amount: map['amount'] as double,
      unit: map['unit'] as String,
      price: map['price'] as double,
      currency: map['currency'] as String,
      comment: map['comment'] as String,
      status: map['status'] as bool,
      categoryId: map['categoryId'] as int,
      category_name: map['category_name'] as String,
      country_name: map['country_name'] as String,
      user_name: map['user_name'] as String,
      userId: map['userId'] as int,
    );
  }

  String toJson() => json.encode(toMap());

  factory ItemModel.fromJson(String source) => ItemModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'ItemModel(id: $id, product_name: $name, amount: $amount, unit: $unit, price: $price, currency: $currency, comment: $comment, status: $status, categoryId: $categoryId, category_name: $category_name, country_name: $country_name, user_name: $user_name, userId: $userId)';
  }
}
