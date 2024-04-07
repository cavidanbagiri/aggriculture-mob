import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first


class CountriesModel {
  
  final int id;
  final String country_name;
  final String code_name;

  CountriesModel({
    required this.id,
    required this.country_name,
    required this.code_name,
  });
  

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'country_name': country_name,
      'code_name': code_name,
    };
  }

  factory CountriesModel.fromMap(Map<String, dynamic> map) {
    return CountriesModel(
      id: map['id'] as int,
      country_name: map['country_name'] as String,
      code_name: map['code_name'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory CountriesModel.fromJson(String source) => CountriesModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'CountriesModel(id: $id, country_name: $country_name, code_name: $code_name)';
}
