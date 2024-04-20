

import 'dart:convert';

import 'package:client_mob/constants/api.dart';
import 'package:client_mob/models/countries_model.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class CountryService {

  static Future<List<CountriesModel>> fetchAllCountries () async {

    final String uri = '$api/countries/';

    SharedPreferences prefs = await SharedPreferences.getInstance();

    var stored_token = prefs.getString('x-auth-token');
    String token = '';
    if(stored_token != null){
      token = stored_token;
    }
    else{
      print('token not available');
    }

    http.Response response = await http.get(Uri.parse(uri), headers: {
      'Content-Type': 'application/json; charset=UTF-8',
      'authorication': 'Bearear $token'
    });

    final List<CountriesModel> cm_list = [];
    for(final each in jsonDecode(response.body)){
      final cm = CountriesModel(id: each['id'], country_name: each['country_name'], code_name: each['code_name']);
      cm_list.add(cm);
    }
    // print('ccm $cm_list');
    return cm_list;

  }

}