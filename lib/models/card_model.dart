import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first


class CardModel {

  int id;
  String image;
  String country_name;
  String category_name;
  String name;
  double price;
  double amount;
  String unit;
  String comment;

  CardModel({
    required this.id,
    required this.image,
    required this.country_name,
    required this.category_name,
    required this.name,
    required this.price,
    required this.amount,
    required this.unit,
    required this.comment,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'image': image,
      'country_name': country_name,
      'category_name': category_name,
      'name': name,
      'price': price,
      'amount': amount,
      'unit': unit,
      'comment': comment,
    };
  }

  factory CardModel.fromMap(Map<String, dynamic> map) {
    return CardModel(
      id: map['id'] as int,
      image: map['image'] as String,
      country_name: map['country_name'] as String,
      category_name: map['category_name'] as String,
      name: map['name'] as String,
      price: map['price'] as double,
      amount: map['amount'] as double,
      unit: map['unit'] as String,
      comment: map['comment'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory CardModel.fromJson(String source) => CardModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'CardModel(id: $id, image: $image, country_name: $country_name, category_name: $category_name, name: $name, price: $price, amount: $amount, unit: $unit, comment: $comment)';
  }
  
}
