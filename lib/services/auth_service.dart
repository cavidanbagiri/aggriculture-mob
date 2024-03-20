import 'dart:convert';
import 'package:client_mob/constants/api.dart';
import 'package:client_mob/models/user_model.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';

class AuthService {
  static Future<UserModel> registerUser(
      {required String email,
      required String username,
      required String password,
      required BuildContext context}) async {
        print('aith service already work');
    final Map<String, dynamic> user_data = {
      'email': email,
      'username': username,
      'password': password
    };
    print('before json');
    final json_data = jsonEncode(user_data);
    print('after json');
    print('json data : $json_data');
    var uri = '$api/user/register';
    http.Response response = await http.post(Uri.parse('$uri'),
        body: json_data,
        headers: {'Content-Type': 'application/json; charset=UTF-8'});
        print('-----');
        print(response.body);
        print(response.statusCode);
    if (response.statusCode == 201) {
      print('if work');
      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Successfully Registered')),
        );
      }
    } 
    // else {
    //   print('else wrk');
    //   if (context.mounted) {
    //     ScaffoldMessenger.of(context).showSnackBar(
    //       SnackBar(content: Text(jsonDecode(response.body)['error'])),
    //     );
    //   }
    // }
    UserModel user =
        UserModel.fromJson(jsonEncode(jsonDecode(response.body)['user']));
    return user;
  }
}
