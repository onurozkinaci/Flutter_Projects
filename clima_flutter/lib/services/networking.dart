import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class NetworkHelper {
  NetworkHelper({@required this.url});
  final url; //URI.https info will be sent from the LoadingScreen() as a parameter.

  Future getData() async {
    http.Response response = await http.get(url);
    if (response.statusCode == 200) {
      String responseBody = response.body;
      return jsonDecode(responseBody); //decoding-unpacking the JSON response.
    } else {
      print(response.statusCode);
    }
  }
}
