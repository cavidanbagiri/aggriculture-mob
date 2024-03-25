import 'dart:convert';
import 'package:client_mob/constants/api.dart';
import 'package:client_mob/models/user_model.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthService {
  static Future<UserModel> registerUser(
      {required String email,
      required String username,
      required String password,
      required BuildContext context}) async {
    final Map<String, dynamic> user_data = {
      'email': email,
      'username': username,
      'password': password
    };
    final json_data = jsonEncode(user_data);
    var uri = '$api/user/register';
    http.Response response = await http.post(Uri.parse('$uri'),
        body: json_data,
        headers: {'Content-Type': 'application/json; charset=UTF-8'});
    if (response.statusCode == 201) {
      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Successfully Registered')),
        );
      }
    } else {
      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(jsonDecode(response.body)['msg'])),
        );
      }
    }
    UserModel user =
        UserModel.fromJson(jsonEncode(jsonDecode(response.body)['user']));
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('x-auth-token', jsonDecode(response.body)['access_token']);
    prefs.setString(
        'refresh-token', jsonDecode(response.body)['refresh_token']);
    return user;
  }

  static Future<UserModel> loginUser(
      {required String email,
      required String username,
      required String password,
      required BuildContext context}) async {
    final Map<String, dynamic> user_data = {
      'email': email,
      'username': username,
      'password': password
    };
    final json_data = jsonEncode(user_data);
    var uri = '$api/user/login';
    http.Response response = await http.post(Uri.parse('$uri'),
        body: json_data,
        headers: {'Content-Type': 'application/json; charset=UTF-8'});
    print('-->>');
    print(response.body);
    if (response.statusCode == 200) {
      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Successfully Login')),
        );
      }
    } else {
      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(jsonDecode(response.body)['msg'])),
        );
      }
    }
    UserModel user =
        UserModel.fromJson(jsonEncode(jsonDecode(response.body)['user']));
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('x-auth-token', jsonDecode(response.body)['access_token']);
    prefs.setString('refresh-token', jsonDecode(response.body)['refresh_token']);
    return user;
  }

  static refreshToken() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final String? refreshToken = prefs.getString('refresh-token');
    print('refresh token is : $refreshToken');
    var uri = '$api/user/refresh';
    if (refreshToken != null) {
      http.Response response = await http.get(Uri.parse(uri), headers: {
        'Content-Type': 'application/json; charset=UTF-8',
        'refreshToken': refreshToken
      });
      prefs.setString('x-auth-token', jsonDecode(response.body)['access_token']);
      prefs.setString('refresh-token', jsonDecode(response.body)['refresh_token']);
    }
    else{
      print('There Is Not Refresh Token, User Not Login');
    }
  }
}
