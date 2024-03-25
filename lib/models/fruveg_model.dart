import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first

class FruVegModel {
  final int id;
  final String name;
  FruVegModel({
    required this.id,
    required this.name,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
    };
  }

  factory FruVegModel.fromMap(Map<String, dynamic> map) {
    return FruVegModel(
      id: map['id'] as int,
      name: map['name'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory FruVegModel.fromJson(String source) => FruVegModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'FruVegModel(id: $id, name: $name)';
}
