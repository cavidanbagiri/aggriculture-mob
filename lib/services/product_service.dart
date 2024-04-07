import 'dart:convert';

import 'package:client_mob/constants/api.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class ProductService {
  // Add product to database
  static addProduct(context, Map<String, dynamic> data) async {
    var uri = '$api/product/create';
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String token = '';
    var some = prefs.getString('x-auth-token');
    if (some != null) {
      token = some;
    } else {
      print('token is not available');
    }
    final json_data = jsonEncode(data); 
    final http.Response response = await http.post(
      Uri.parse(uri),
      body: json_data,
      headers: {
        'Content-Type': 'application/json; charset=UTF-8',
        'authorization': 'Bearear $token'
        },
    );
    if (response.statusCode == 201) {
      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('New product Successfully Added')),
        );
      }
    } else {
      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(jsonDecode(response.body)['msg'])),
        );
      }
    }
  }
}
