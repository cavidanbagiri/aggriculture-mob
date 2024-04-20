import 'dart:convert';
import 'package:client_mob/constants/api.dart';
import 'package:client_mob/models/categories_model.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class CategoriesService {
  // Fetch All Categories
  static Future<List<CategoriesModel>> fetchCategories() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String token = '';
    var stored_token = prefs.getString('x-auth-token');
    if (stored_token != null) {
      token = stored_token;
    } else {
      print('token is not available');
    }

    const uri = '$api/category';
    final http.Response response = await http.get(Uri.parse(uri), headers: {
      'Content-Type': 'application/json; charset=UTF-8',
      'authorization': 'Bearear $token'
    });

    List<CategoriesModel> cm_list = [];
    if(response.statusCode == 200){
      for (final i in jsonDecode(response.body)) {
        CategoriesModel fvm = CategoriesModel(id: i['id'], category_name: i['category_name']);
        cm_list.add(fvm);
      }
      return cm_list;
    }
    else{
      print('fetching category Error');
    }

  return cm_list;
  }
}
