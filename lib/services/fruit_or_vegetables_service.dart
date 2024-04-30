

import 'dart:convert';
import 'dart:io';

import 'package:client_mob/services/token_service.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../constants/api.dart';

class FruitOrVegetableService {

  // Add Fruit Or Vegetable
  static Future<bool> addFruitOrVegetable (context, data) async {

    // Get An URL
    var uri = '$api/items/create';

    // Get Token
    final String token = await TokenService.getToken();

    print('data is $data');
    final json_data = jsonEncode(data);

    print('json data ');
    print(json_data);

    // Create response and data to server
    final http.Response response = await http.post(
      Uri.parse(uri),
      body: json_data,
      headers: {
        'Content-Type': 'application/json; charset=UTF-8',
        'authorization': 'Bearear $token'
      },
    );


    print('response L ');
    print(response..body);


    if (response.statusCode == 201) {
      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('New product Successfully Added')),
        );
        return true;
      }
    } else {
      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(jsonDecode(response.body)['msg'])),
        );
        return false;
      }
    }
    return false;
  }

  // Add Items With Image
  static Future<bool> addProductWithImage(context, Map<String, dynamic> data, File imageFile) async {

    // Create Sending Image URL
    var uri = '$api/items/create';

    final String token = await TokenService.getToken();

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
    request.fields['name'] = data['name'];
    request.fields['kind'] = data['kind'];
    request.fields['amount'] = data['amount'];
    request.fields['unit'] = data['unit'];
    request.fields['price'] = data['price'];
    request.fields['currency'] = data['currency'];
    request.fields['comment'] = data['comment'];
    request.fields['categoryId'] = data['categoryId'].toString();
    request.fields['countryId'] = data['countryId'].toString();


    // Send request to the backend
    var response = await request.send();
    print('response is ');
    print(response);

    if (response.statusCode == 201) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('New product Successfully Added')),
      );
      return true;
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Image Can\'t Added')),
      );
      return false;
    }
  }


}