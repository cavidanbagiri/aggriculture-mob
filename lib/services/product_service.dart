import 'dart:convert';
import 'dart:io';

import 'package:client_mob/constants/api.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class ProductService {
  // Add product to database
  // static addProduct(context, Map<String, dynamic> data) async {
  //   var uri = '$api/product/create';
  //   SharedPreferences prefs = await SharedPreferences.getInstance();
  //   String token = '';
  //   var some = prefs.getString('x-auth-token');
  //   if (some != null) {
  //     token = some;
  //   } else {
  //     print('token is not available');
  //   }
  //   final json_data = jsonEncode(data);

  //   final http.Response response = await http.post(
  //     Uri.parse(uri),
  //     body: json_data,
  //     headers: {
  //       'Content-Type': 'application/json; charset=UTF-8',
  //       'authorization': 'Bearear $token'
  //     },
  //   );
  //   if (response.statusCode == 201) {
  //     if (context.mounted) {
  //       ScaffoldMessenger.of(context).showSnackBar(
  //         const SnackBar(content: Text('New product Successfully Added')),
  //       );
  //     }
  //   } else {
  //     if (context.mounted) {
  //       ScaffoldMessenger.of(context).showSnackBar(
  //         SnackBar(content: Text(jsonDecode(response.body)['msg'])),
  //       );
  //     }
  //   }
  // }

  // static Future<void> uploadImage(File imageFile) async {
  //   final uri = '$api/product/uploadimage';
  //   var request = http.MultipartRequest(
  //     'POST',
  //     Uri.parse(uri),
  //   );

  //   var pic = await http.MultipartFile.fromPath('image', imageFile.path);
  //   request.files.add(pic);

  //   var response = await request.send();

  //   if (response.statusCode == 201) {
  //     print('Image uploaded successfully');
  //   } else {
  //     print('Failed to upload image. Error code: ${response.statusCode}');
  //   }
  // }

  static addProduct(context, Map<String, dynamic> data, File imageFile) async {

    // Create Sending Image URL
    var uri = '$api/product/create';

    // Take Token from shared preferences
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String token = '';
    var some = prefs.getString('x-auth-token');
    if (some != null) {
      token = some;
    } else {
      print('token is not available');
    }

    // Create Request
    var request = http.MultipartRequest(
      'POST',
      Uri.parse(uri),
    );

    // Add selected image to the request
    var pic = await http.MultipartFile.fromPath('image', imageFile.path);
    request.files.add(pic);

     // Create headers
    final headers = {
      'Content-Type':'application/json;',
      'authorization': 'Bearear $token'
    };

    // Add headers to the request
    request.headers.addAll(headers);

    // Get data from frontend and convert to json
    // final json_data = jsonEncode(data);
    request.fields['product_name'] = data['product_name'];
    request.fields['amount'] = data['amount'];
    request.fields['unit'] = data['unit'];
    request.fields['price'] = data['price'];
    request.fields['currency'] = data['currency'];
    request.fields['comment'] = data['comment'];
    request.fields['categoryId'] = data['categoryId'].toString();
    request.fields['countryId'] = data['countryId'].toString();
    

    // Send request to the backend
    var response = await request.send();

    if (response.statusCode == 201) {
      print('Image uploaded successfully');
    } else {
      print('Failed to upload image. Error code: ${response.statusCode}');
    }
  }


    // final json_data = jsonEncode(data);

    // final http.Response response = await http.post(
    //   Uri.parse(uri),
    //   body: json_data,
    //   headers: {
    //     'Content-Type': 'application/json; charset=UTF-8',
    //     'authorization': 'Bearear $token'
    //   },
    // );
    // if (response.statusCode == 201) {
    //   if (context.mounted) {
    //     ScaffoldMessenger.of(context).showSnackBar(
    //       const SnackBar(content: Text('New product Successfully Added')),
    //     );
    //   }
    // } else {
    //   if (context.mounted) {
    //     ScaffoldMessenger.of(context).showSnackBar(
    //       SnackBar(content: Text(jsonDecode(response.body)['msg'])),
    //     );
    //   }
    // }
  


  static Future<void> uploadImage(File imageFile, Map<String, dynamic> data) async {
    
    // Create a uri for sending request to backend
    // final uri = '$api/product/uploadimage';
    final uri = '$api/product/uploadimage';

    // Create request form
    var request = http.MultipartRequest(
      'POST',
      Uri.parse(uri),
    );

    // Add selected image to the request
    var pic = await http.MultipartFile.fromPath('image', imageFile.path);
    request.files.add(pic);

    // Get Token from sharedpreferences
    final prefs = await SharedPreferences.getInstance();
    String token = '';
    var stored_token = prefs.getString('x-auth-token');
    if (stored_token != null) {
      token = stored_token;
    } else {
      print('Token is not available');
    }

    // Create headers
    final headers = {
      'Content-Type':'application/json;',
      'authorization': 'Bearear $token'
    };

    // Add headers to the request
    request.headers.addAll(headers);

    // Get data from frontend and convert to json
    // final json_data = jsonEncode(data);
    request.fields['product_name'] = data['product_name'];
    request.fields['amount'] = data['amount'];
    request.fields['unit'] = data['unit'];
    request.fields['price'] = data['price'];
    request.fields['currency'] = data['currency'];
    request.fields['comment'] = data['comment'];
    request.fields['categoryId'] = data['categoryId'].toString();
    request.fields['countryId'] = data['countryId'].toString();
    

    // Send request to the backend
    var response = await request.send();

    if (response.statusCode == 201) {
      print('Image uploaded successfully');
    } else {
      print('Failed to upload image. Error code: ${response.statusCode}');
    }
  }

}
