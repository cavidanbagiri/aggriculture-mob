import 'dart:convert';

import 'package:client_mob/constants/api.dart';
import 'package:client_mob/models/fruveg_model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class FruVegService {
  // Fetch All Fruits and Vegetables
  static Future<List<FruVegModel>> fetchFruVeg(
      {required BuildContext context}) async {
    String uri = '$api/user/fetching';
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String token = '';
    var some = prefs.getString('x-auth-token');
    if (some != null) {
      token = some;
      // if (context.mounted) {
      //   ScaffoldMessenger.of(context).showSnackBar(
      //     const SnackBar(content: Text('token we have')),
      //   );
      // }
    } else {
      // if (context.mounted) {
      //   ScaffoldMessenger.of(context).showSnackBar(
      //     const SnackBar(content: Text('token netu')),
      //   );
      // }
    }
    final http.Response response = await http.get(Uri.parse(uri), headers: {
      'Content-Type': 'application/json; charset=UTF-8',
      'authorization': 'Bearear $token'
    });

    List<FruVegModel> fvm_list = [];
    print('status code : ${response.statusCode}' );
    print('body is : ${response.body}');
    if (response.statusCode == 200) {
      for (final i in jsonDecode(response.body)) {
        FruVegModel fvm = FruVegModel(id: i['id'], name: i['name']);
        fvm_list.add(fvm);
      }
      return fvm_list;
    } else {
      // if (context.mounted) {
      //   ScaffoldMessenger.of(context).showSnackBar(
      //     SnackBar(content: Text(jsonDecode(response.body)['msg'])),
      //   );
      // }
      print('response body is : ---->>>>>>>>>>> ');
      print(jsonDecode(response.body)['msg']);
      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(jsonDecode(response.body)['msg'])),
        );
      }
      return fvm_list;
    }
  }
}
