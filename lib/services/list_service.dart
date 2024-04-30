import 'dart:convert';
import 'package:client_mob/constants/api.dart';
import 'package:client_mob/models/item_model.dart';
// import 'package:client_mob/models/product_model.dart';
import 'package:client_mob/services/token_service.dart';
import 'package:http/http.dart' as http;
// import 'package:shared_preferences/shared_preferences.dart';

class ListService {
  // Fetch All products
  static Future<List<ItemModel>> fetchItems() async {

    // Get Token From Token Service
    final String token = await TokenService.getToken();
    const String uri = '$api/items/';

    final http.Response items = await http.get(Uri.parse(uri), headers: {
      'Content-Type': 'application-json; charset=UTF-8',
      'authorization': 'Bearear $token'
    });
    List<ItemModel> im_list = [];
    if (items.statusCode == 200) {
      for (final each in jsonDecode(items.body)) {
        final ItemModel im = ItemModel(
            id: each['id'],
            name: each['name'],
            amount: each['amount'].toDouble(),
            unit: each['unit'],
            price: each['price'].toDouble(),
            currency: each['currency'],
            comment: each['comment'],
            status: each['status'],
            categoryId: each['categoryId'],
            category_name: each['CategoryModel']['category_name'],
            country_name: each['CountryModel']['country_name'],
            user_name: each['UserModel']['username'],
            userId: each['userId']
        );
        im_list.add(im);
      }
    } else {
      print(items);
    }
    return im_list;
  }
}
