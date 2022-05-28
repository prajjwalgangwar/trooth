import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:trooth/models/token_model.dart';
import 'package:trooth/utilities/Constants.dart';

class RemoteServices{

  static Future<Token?> getTokenData()async{
    var client = http.Client();
    var _url = Uri.parse(AppConstants.urls[0]);
    var response = await client.get(_url);
    if(response.statusCode == 200){
      var body = response.body;
      return tokenFromJson(body);
    }
    return null;
  }

  static Future<http.StreamedResponse> getNewsData(String token, String searchKey)async{
    Request request=http.Request('GET', Uri.parse('https://trooth-backend.hestawork.com/api/searchEngine/search?search=$searchKey&start=1&limit=100'));
    request.headers.addAll({
      'authorization' : 'bearer $token',
      'accept' : 'application/json'
    });
    http.StreamedResponse response = await request.send();
    return response;
  }
}