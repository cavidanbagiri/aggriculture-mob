
import 'dart:convert';
import 'package:client_mob/constants/api.dart';
import 'package:client_mob/services/token_service.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class CardService {

    // Add Selected Item To Card
    static addCard(context, Map<String, dynamic> data) async{

      // Create an URL
      const uri = "$api/cards/addcards";

      // get Token from Token Service
      final String token = await TokenService.getToken();

      // Encode Coming Data To Json
      final json_data = jsonEncode(data);

      // Create and send response
      final http.Response response = await http.post(Uri.parse(uri), body: json_data, headers: {
        'Content-Type': 'application/json; charset=UTF-8',
        'authorization': 'Bearer $token'
      });

      // Check Response is True or no
      if(response.statusCode == 201){
        ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Successfully Added To Card')
        ));
      }
      else{
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Cant Add To Card'))
        );
      }

    }

}