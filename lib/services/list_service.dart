import 'dart:convert';
import 'dart:io';

import 'package:client_mob/constants/api.dart';
import 'package:client_mob/models/product_model.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class ListService {
  // Fetch All products
  static Future<List<ProductModel>> fetchProducts() async {
    final prefs = await SharedPreferences.getInstance();
    String token = '';
    var stored_token = prefs.getString('x-auth-token');
    if (stored_token != null) {
      token = stored_token;
    } else {
      print('Token is not available');
    }
    final String uri = '$api/product/';

    final http.Response products = await http.get(Uri.parse(uri), headers: {
      'Content-Type': 'application-json; charset=UTF-8',
      'authorization': 'Bearear $token'
    });
    List<ProductModel> pm_list = [];
    if (products.statusCode == 200) {
      for (final each in jsonDecode(products.body)) {
        final ProductModel pm = ProductModel(
            id: each['id'],
            product_name: each['product_name'],
            amount: each['amount'].toDouble(),
            unit: each['unit'],
            price: each['price'].toDouble(),
            currency: each['currency'],
            comment: each['comment'],
            status: each['status'],
            categoryId: each['categoryId'],
            userId: each['userId']);
        pm_list.add(pm);
      }
    } else {
      print(products);
    }
    return pm_list;
  }
}
