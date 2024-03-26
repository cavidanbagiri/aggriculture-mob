import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first


class CategoriesModel {
  final int id;
  final String category_name;
  
  CategoriesModel({
    required this.id,
    required this.category_name,
  });


  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'category_name': category_name,
    };
  }

  factory CategoriesModel.fromMap(Map<String, dynamic> map) {
    return CategoriesModel(
      id: map['id'] as int,
      category_name: map['category_name'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory CategoriesModel.fromJson(String source) => CategoriesModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'CategoriesModel(id: $id, category_name: $category_name)';
}
